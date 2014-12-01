package cn.edu.uestc.shoe.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import cn.edu.uestc.shoe.shop.entity.Product;

/**
 * Product sev inf
 * 
 * @author Jesse
 *
 */

public interface ProductService {
	
	
	/**
	 * 列表 
	 */
	Page<Product> listAll(Pageable pageable);
	
	/**
	 * 保存
	 */
	void save(Product product);

	/**
	 * 查询
	 */
	Product get(Integer id);

	/**
	 * 删除
	 */
	void delete(Integer id);
	
	/**
	 * 按类型list
	 */
	Page<Product> listByType(String type,Pageable pageable);
//	List<Product> listByType(String type);
	
	/**
	 * 按品牌list
	 */
	Page<Product> listByBrand(String brand,Pageable pageable);
//	List<Product> listByBrand(String brand);
	
	/**
	 * 按品牌和类型list
	 */
	Page<Product> listByBrandAndType(String brand,String type,Pageable pageable);
	
	/**
	 * 取出首页商品
	 */
	List<Product> listHomepage(int module);
	
	/**
	 * 搜索
	 */
	Page<Product> listBySearch(String key,Pageable pageable);

}
