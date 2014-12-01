package cn.edu.uestc.shoe.shop.service;

import java.util.List;

import cn.edu.uestc.shoe.shop.entity.Product;
import cn.edu.uestc.shoe.shop.entity.Shoppingcart;
/**
 * shoppingcart sev inf
 * 
 * @author cjt
 */
public interface ShoppingcartService {
	/**
	 * 列表 
	 */
	List<Shoppingcart> list(Integer userId);
	/**
	 * 删除
	 */
	void delete(Integer shoppingcartId);
	/**
	 *  保存
	 */
	void save(Shoppingcart shoppingcart);
	/**
	 * 查询
	 */
	Shoppingcart get(Integer shoppingcartId);
	
}