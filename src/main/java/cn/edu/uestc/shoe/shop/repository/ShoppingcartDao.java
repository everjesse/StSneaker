package cn.edu.uestc.shoe.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import cn.edu.uestc.shoe.shop.entity.Shoppingcart;
/**
 * shoppingcart dao
 * 
 * @author cjt
 */
public interface ShoppingcartDao extends JpaRepository<Shoppingcart, Integer>,
JpaSpecificationExecutor<Shoppingcart> {
	
	@Query("FROM Shoppingcart WHERE user.userId = ?1 ") 
	List<Shoppingcart> findAll(Integer userid);
}
