package cn.edu.uestc.shoe.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.Task;
import cn.edu.uestc.shoe.shop.entity.Test;
import cn.edu.uestc.shoe.shop.repository.TestDao;
import cn.edu.uestc.shoe.shop.service.TestService;
/**
 * task sev impl
 * 
 * @author lynch
 */
@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDao testDao;
	/**
	 * 列表 
	 */
	public Page<Test> list(Pageable pageable){
		
		return testDao.findAll(pageable);
	}
	
	/**
	 * 保存 
	 */
	public void save(Test test){
	
		testDao.save(test);
	}

	/**
	 * 查询
	 */
	public Test get(Integer id) {

		return testDao.findOne(id);
	}

	/**
	 * 删除
	 */
	public void delete(Integer id) {

		testDao.delete(id);
	}


}

