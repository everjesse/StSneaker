package cn.edu.uestc.shoe.shop.service;

import java.util.List;

import cn.edu.uestc.shoe.shop.entity.User;
/**
 * user sev inf
 * 
 * @author cjt
 */
public interface UserService  {

	/**
	 * 保存
	 */
	void save(User user);
	
	/**
	 * 检查
	 */
	List<User> check(String mailbox);
	/**
	 * 获得
	 */
	User get(Integer userId);
	
	User check(User user);
	

}
