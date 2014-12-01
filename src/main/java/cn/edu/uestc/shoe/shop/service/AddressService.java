package cn.edu.uestc.shoe.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.User;

public interface AddressService {

	
	/**
	 * 列表 
	 */
	//Page<Address> list(Pageable pageable, Integer userId);
	Page<Address> listByUser(User u,Pageable pageable);
	List<Address> list(Integer userId);
	/**
	 * 保存
	 */
	void save(Address Address);

	/**
	 * 查询
	 */
	Address get(Integer addressId);
    Address gets(Integer addressId);
	/**
	 * 删除
	 */
	void delete(Integer AddressId);

	
    
}
