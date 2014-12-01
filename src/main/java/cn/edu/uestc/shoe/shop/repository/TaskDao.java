package cn.edu.uestc.shoe.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import cn.edu.uestc.shoe.shop.entity.Task;

/**
 * task dao
 * 
 * @author lynch
 */
public interface TaskDao extends JpaRepository<Task, Integer>,
		JpaSpecificationExecutor<Task> {

	
	
	
	
	
}
