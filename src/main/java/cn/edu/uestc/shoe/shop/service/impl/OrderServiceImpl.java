package cn.edu.uestc.shoe.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.Orderinfo;
import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.repository.OrderDao;
import cn.edu.uestc.shoe.shop.service.OrderService;

@Service
public  class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	
	/**
	 * 列表
	 */

	public Page<Orderinfo> listByUser(User u,Pageable pageable){
		return orderDao.findByUser(u, pageable);
		}
				
	/**
	 * 保存
	 */
	@Override
	public Orderinfo save(Orderinfo orderinfo) {
		return orderDao.save(orderinfo);
	}

	/**
	 * 查询
	 */
	@Override
	public List<Orderinfo> get(Integer userId) {
		return orderDao.check(userId);
	}
	/**
	 * 删除
	 */
	public void delete(Integer OrderId) {

		orderDao.delete(OrderId);
	}

	@Override
	public Orderinfo getOne(Integer orderId) {
		return orderDao.findOne(orderId);
	}


}
