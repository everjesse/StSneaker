package cn.edu.uestc.shoe.shop.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.Task;
import cn.edu.uestc.shoe.shop.entity.Test;
import cn.edu.uestc.shoe.shop.repository.TaskDao;
import cn.edu.uestc.shoe.shop.service.TaskService;

/**
 * task sev impl
 * 
 * @author lynch
 */
@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskDao taskDao;
	
	/**
	 * 列表 
	 */
	public Page<Task> list(Pageable pageable){
		
		return taskDao.findAll(pageable);
	}
	
	/**
	 * 列表 
	 */
	public Page<Task> list(Pageable pageable,final String taskName) {
		
		Specification<Task> spec = new Specification<Task>() {
			public Predicate toPredicate(Root<Task> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				if (taskName != null && taskName != "") {
					list.add(cb.like(root.get("taskName").as(String.class), "%"+ taskName + "%"));
//					Predicate p2 = cb.equal(root.get("uuid").as(Integer.class), um.getUuid());  
//			        Predicate p3 = cb.gt(root.get("age").as(Integer.class), um.getAge());  
				}
				Predicate[] p = new Predicate[list.size()];
				return cb.and(list.toArray(p));
			}
		};
		return taskDao.findAll(spec,pageable);
	}
	
	/**
	 * 保存 
	 */
	public void save(Task task){
	
		taskDao.save(task);
	}

	/**
	 * 查询
	 */
	public Task get(Integer id) {

		return taskDao.findOne(id);
	}

	/**
	 * 删除
	 */
	public void delete(Integer id) {

		taskDao.delete(id);
	}

}
