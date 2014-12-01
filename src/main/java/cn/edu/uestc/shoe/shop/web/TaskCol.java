package cn.edu.uestc.shoe.shop.web;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.edu.uestc.shoe.shop.entity.Task;
import cn.edu.uestc.shoe.shop.service.TaskService;
import cn.edu.uestc.shoe.shop.util.WebSer;

/**
 * task col
 *  
 * @author lynch
 */
@Controller
@RequestMapping(value="/task")
public class TaskCol {
	
	@Autowired
	private TaskService taskService;
	
	/**
	 * 列表
	 */	
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "5") int pageSize,
			String _taskName, ServletRequest request) {

		ModelAndView mv = new ModelAndView();
		Page<Task> tasks = taskService.list(new PageRequest(pageNumber - 1, pageSize, Sort.Direction.DESC, "taskId"), _taskName);
		Map<String, Object> searchParams = WebSer.getParametersStartingWith(request, "_");
		mv.addObject("searchParams", WebSer.encodeParameterStringWithPrefix(searchParams, "_"));
		mv.addObject("tasks", tasks);
		mv.setViewName("task/taskList");
		return mv;
	}
	
	/**
	 * 添加页面
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {

		model.addAttribute("task", new Task());
		model.addAttribute("action", "create");
		return "task/taskForm";
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid Task task, RedirectAttributes redirectAttributes) {

		taskService.save(task);
		redirectAttributes.addFlashAttribute("message", "创建任务成功");
		return "redirect:/task/list";
	}
	
	/**
	 * 修改页面
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		
		model.addAttribute("task", taskService.get(id));
		model.addAttribute("action", "update");
		return "task/taskForm";
	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("task") Task task,
			RedirectAttributes redirectAttributes) {
		
		taskService.save(task);
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/task/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Integer id,
			RedirectAttributes redirectAttributes) {
		
		taskService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/task/list";
	}

}
