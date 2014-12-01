package cn.edu.uestc.shoe.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.Product;
import cn.edu.uestc.shoe.shop.repository.ProductDao;
import cn.edu.uestc.shoe.shop.service.ProductService;

/**
 * Product sev impl
 * 
 * @author Jesse
 *
 */

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;

	@Override
	public Page<Product> listAll(Pageable pageable) {
		
		return productDao.findAll(pageable);
	}

	@Override
	public void save(Product product) {
		productDao.save(product);
		
	}

	@Override
	public Product get(Integer id) {
		return productDao.findOne(id);

	}

	@Override
	public void delete(Integer id) {
		productDao.delete(id);
		
	}


	@Override
	public List<Product> listHomepage(int module) {
		return productDao.listByHomepage(module);
	}

	@Override
	public Page<Product> listByType(String type, Pageable pageable) {
		return productDao.findByType(type, pageable);
	}

	@Override
	public Page<Product> listByBrand(String brand, Pageable pageable) {
		return productDao.findByBrandName(brand, pageable);
	}

	@Override
	public Page<Product> listByBrandAndType(String brand, String type,
			Pageable pageable) {
		return productDao.findByBrandNameAndType(brand, type, pageable);
	}

	@Override
	public Page<Product> listBySearch(String key,Pageable pageable) {
		return productDao.findByProductNameLike("%"+key+"%",pageable);
	}

}
