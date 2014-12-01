package cn.edu.uestc.shoe.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.Orderdetail;
import cn.edu.uestc.shoe.shop.repository.OrderDetailDao;
import cn.edu.uestc.shoe.shop.service.OrderDetailService;
/**
 * Orderdetail sev impl
 * 
 * @author Jesse
 *
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Override
	public List<Orderdetail> list(Integer orderId) {
		return orderDetailDao.check(orderId);
	}

	@Override
	public void save(Orderdetail orderdetail) {
		orderDetailDao.save(orderdetail);
	}

	@Override
	public Orderdetail get(Integer orderDetailId) {
		return orderDetailDao.getOne(orderDetailId);
	}

	@Override
	public void delete(Integer orderDetailId) {
		orderDetailDao.delete(orderDetailId);
		
	}

}
