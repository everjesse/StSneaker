package cn.edu.uestc.shoe.shop.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.Shoppingcart;
import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.repository.AddressDao;
import cn.edu.uestc.shoe.shop.service.AddressService;
@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressDao AddressDao;
	
	/**
	 * 列表 
	 */
 //	public Page<Address> list(Pageable pageable,final Integer userId){
//		
//		Specification<Address> spec = new Specification<Address>() {
//			public Predicate toPredicate(Root<Address> root,
//					CriteriaQuery<?> query, CriteriaBuilder cb) {
//				List<Predicate> list = new ArrayList<Predicate>();
//				if (userId != null) {
//					list.add(cb.equal(root.get("userId").as(Integer.class),
//							userId.intValue()));
//				}
//				Predicate[] p = new Predicate[list.size()];
//				return cb.and(list.toArray(p));
//			}
//		};
//		return AddressDao.findAll(spec, pageable);
//	}
	public Page<Address> listByUser(User u,Pageable pageable){
		return AddressDao.findByUser(u, pageable);
	}
	@Override
	public List<Address> list(Integer userId) {				
	return AddressDao.check(userId);
	}
	
	/**
	 * 保存 
	 */
	public void save(Address Address){
	
		AddressDao.save(Address);
	}

	/**
	 * 查询
	 */
	public Address get(Integer addressId) {

		return AddressDao.findOne(addressId);
	}
    public Address gets(Integer addressId)
    {
    	return AddressDao.findOne(addressId);
    }
	/**
	 * 删除
	 */
	public void delete(Integer AddressId) {

		AddressDao.delete(AddressId);
		
	}

}
