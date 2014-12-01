package cn.edu.uestc.shoe.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.Orderdetail;
import cn.edu.uestc.shoe.shop.entity.User;
/**
 * Orderdetail sev inf
 * 
 * @author Jesse
 *
 */
public interface OrderDetailService {
	/**
	 * 列表 
	 */
	
	List<Orderdetail> list(Integer orderId);
	/**
	 * 保存
	 */
	void save(Orderdetail orderdetail);

	/**
	 * 查询
	 */
	Orderdetail get(Integer orderDetailId);

	/**
	 * 删除
	 */
	void delete(Integer orderDetailId);
}
