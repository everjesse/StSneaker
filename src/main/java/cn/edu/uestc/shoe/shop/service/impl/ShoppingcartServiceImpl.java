package cn.edu.uestc.shoe.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.Shoppingcart;
import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.repository.ProductDao;
import cn.edu.uestc.shoe.shop.repository.ShoppingcartDao;
import cn.edu.uestc.shoe.shop.service.ShoppingcartService;
/**
 * shoppingcart sev impl
 * 
 * @author cjt
 */
@Service
public class ShoppingcartServiceImpl implements ShoppingcartService {
	@Autowired
	private ShoppingcartDao shoppingcartDao;

	@Override
	public List<Shoppingcart> list(Integer userId) {				
	return shoppingcartDao.findAll(userId);
	}

	@Override
	public void delete(Integer shoppingcartId) {

		shoppingcartDao.delete(shoppingcartId);
	}

	@Override
	public void save(Shoppingcart shoppingcart) {
		shoppingcartDao.save(shoppingcart);
	}

	/**
	 * 查询
	 */
	@Override
	public Shoppingcart get(Integer shoppingcartId) {

		return shoppingcartDao.findOne(shoppingcartId);

	}
}

