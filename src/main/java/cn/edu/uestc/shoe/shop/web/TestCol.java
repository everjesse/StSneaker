package cn.edu.uestc.shoe.shop.web;

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
import cn.edu.uestc.shoe.shop.entity.Test;
import cn.edu.uestc.shoe.shop.service.TaskService;
import cn.edu.uestc.shoe.shop.service.TestService;

/**
 * task col
 *  
 * @author lynch
 */
@Controller
@RequestMapping(value="/test")
public class TestCol {
	
	@Autowired
	private TestService testService;
	
	/**
	 * 列表
	 */	
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "3") int pageSize) {

		ModelAndView mv = new ModelAndView();
		Page<Test> tests  = testService.list(new PageRequest(pageNumber - 1, pageSize, Sort.Direction.DESC, "testId"));
		mv.addObject("tests",tests);
		mv.setViewName("test/testList");
		return mv;
	}
	
	/**
	 * 添加页面
	 */
	@RequestMapping(value = "testAdd", method = RequestMethod.GET)
	public String createForm() {

		return "test/testAdd";
	}
	
	/**
	 * 添加
	 */
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(Test test) {

		testService.save(test);
		return "redirect:/test/list";
	}





/**
 * 详情
 */
@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
public String updateForm(@PathVariable("id") Integer id, Model model) {
	
	model.addAttribute("test", testService.get(id));
	model.addAttribute("action", "update");
	return "test/testInfo";

}

/**
 * 修改
 */
@RequestMapping(value = "update", method = RequestMethod.POST)
public String update(@Valid @ModelAttribute("test") Test test,
		RedirectAttributes redirectAttributes) {
	
	testService.save(test);
	redirectAttributes.addFlashAttribute("message", "更新任务成功");
	return "redirect:/test/list";
}

/**
 * 删除
 */
@RequestMapping(value = "delete/{id}")
public String delete(@PathVariable("id") Integer id,
		RedirectAttributes redirectAttributes) {
	
	testService.delete(id);
	redirectAttributes.addFlashAttribute("message", "删除任务成功");
	return "redirect:/task/list";
}

}
