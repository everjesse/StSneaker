package cn.edu.uestc.shoe.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import cn.edu.uestc.shoe.shop.entity.Orderinfo;
import cn.edu.uestc.shoe.shop.entity.User;



public interface OrderDao extends JpaRepository<Orderinfo, Integer>,
JpaSpecificationExecutor<Orderinfo> {
	
	@Query("FROM Orderinfo WHERE user.userId = ?1 ") 
	List<Orderinfo> check(Integer userId);

	 Page<Orderinfo> findByUser(User user, Pageable pageable);

}

