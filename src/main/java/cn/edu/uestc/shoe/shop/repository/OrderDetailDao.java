package cn.edu.uestc.shoe.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import cn.edu.uestc.shoe.shop.entity.Orderdetail;
import cn.edu.uestc.shoe.shop.entity.Orderinfo;

/**
 * Orderdetail Dao
 * @author Jesse
 *
 */
public interface OrderDetailDao extends JpaRepository<Orderdetail, Integer>,
JpaSpecificationExecutor<Orderdetail> {
	
	@Query("FROM Orderdetail WHERE orderinfo.orderId = ?1 ") 
	List<Orderdetail> check(Integer orderId);


}
