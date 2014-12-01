package cn.edu.uestc.shoe.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import cn.edu.uestc.shoe.shop.entity.User;


public interface UserDao extends JpaRepository<User, Integer>,
		JpaSpecificationExecutor<User> {

	@Query("FROM User WHERE mailbox = ?1 ") 
	List<User> check(String mailbox);
	
	@Query("FROM User WHERE mailbox = ?1 AND password = ?2") 
	User check(String mailbox,String password);
}
