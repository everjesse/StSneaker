package cn.edu.uestc.shoe.shop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import cn.edu.uestc.shoe.shop.entity.Task;
import cn.edu.uestc.shoe.shop.entity.Test;

/**
 * test sev inf
 * 
 * @author lynch
 */
public interface TestService {

	/**
	 * 列表 
	 */
	Page<Test> list(Pageable pageable);

	/**
	 * 保存 
	 */

   void save(Test test);

/**
 * 查询
 */
  Test get(Integer id);

/**
 * 删除
 */
void delete(Integer id);
}
