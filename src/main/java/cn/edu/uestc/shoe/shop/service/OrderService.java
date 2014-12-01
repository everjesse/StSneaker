package cn.edu.uestc.shoe.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import cn.edu.uestc.shoe.shop.entity.Orderinfo;
import cn.edu.uestc.shoe.shop.entity.User;


public interface OrderService {
	/**
	 * 列表
	 */
	//Page<Orderinfo> list(Pageable pageable, final Integer usID);
	Page<Orderinfo> listByUser(User u,Pageable pageable );
	/**
	 * 保存
	 */
	Orderinfo save(Orderinfo orderinfo);

	/**
	 * 查询by user
	 */
	List<Orderinfo> get(Integer userId);
	/**
	 * 查询by orderid
	 */
	Orderinfo getOne(Integer orderId);
	/**
	 * 删除
	 */
	void delete(Integer OrderId);

	
}
