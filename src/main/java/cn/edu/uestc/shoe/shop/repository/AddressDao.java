package cn.edu.uestc.shoe.shop.repository;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.User;
/**
 * Address dao
 * 

 */
public interface AddressDao extends JpaRepository<Address, Integer>,
		JpaSpecificationExecutor<Address> {

	@Query("FROM Address WHERE user.userId = ?1") 
	List<Address> check(Integer userId);
	
	/**
	 * 按userID找地址
	 */
	Page<Address> findByUser(User u,Pageable pageable);

	//List<Address> findAll(Integer userId);
	
	}