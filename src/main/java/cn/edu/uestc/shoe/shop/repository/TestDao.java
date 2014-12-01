package cn.edu.uestc.shoe.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import cn.edu.uestc.shoe.shop.entity.Test;

/**
 * test dao
 * 
 * @author lynch
 */
public interface TestDao extends JpaRepository<Test, Integer>,
		JpaSpecificationExecutor<Test> {

}
