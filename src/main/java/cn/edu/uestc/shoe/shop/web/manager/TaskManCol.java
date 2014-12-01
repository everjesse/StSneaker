package cn.edu.uestc.shoe.shop.web.manager;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.uestc.shoe.shop.entity.Task;
import cn.edu.uestc.shoe.shop.service.TaskService;

/**
 * task col
 *  
 * @author lynch
 */
@Controller
@RequestMapping(value="/manager/task")
public class TaskManCol {
	
	@Autowired
	private TaskService taskService;
	
	/**
	 * 后台首页
	 */	
	@RequestMapping(value = "/view")
	public String task() {
		return "manager/task";
	}
	
	/**
	 * 列表
	 */	
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Integer rows, Integer page) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Page<Task> tasks = taskService.list(new PageRequest(page - 1, rows, Sort.Direction.DESC, "taskId"));
		map.put("total", tasks.getTotalElements());
		map.put("rows", tasks.getContent());
		return map;
	}
	
	
	/**
	 * 添加
	 */
	@RequestMapping(value="/create")
	@ResponseBody
	public Map<String, Object> create(Task task) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		taskService.save(task);
		map.put("success", true);
		return map;
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value="/update")
	@ResponseBody
	public Map<String, Object> update(Task task) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		taskService.save(task);
		map.put("success", true);
		return map;
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("id") Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
		taskService.delete(id);
		map.put("success", true);
		return map;
	}
	
}
