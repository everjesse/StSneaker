package cn.edu.uestc.shoe.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.edu.uestc.shoe.shop.entity.Product;

/**
 * 
 * Product Dao
 * 
 * @author Jesse
 *
 */

public interface ProductDao extends JpaRepository<Product, Integer>,
	JpaSpecificationExecutor<Product>{
	
	/**
	 * 按品牌list
	 */
//	@Query("FROM Product WHERE brandName = ?1 ") 
//	List<Product> listByBrand(String brand);
	Page<Product> findByBrandName(String brandName,Pageable pageable);

	
	/**
	 * 按类别list
	 */
//	@Query("FROM Product WHERE type = ?1 ") 
//	List<Product> listByType(String type);
	Page<Product> findByType(String type,Pageable pageable);
	
	/**
	 * 按品牌和类别list
	 */
	Page<Product> findByBrandNameAndType(String brandName,String type,Pageable pageable);

	
	/**
	 * 按首页模块号list
	 */
	@Query("FROM Product WHERE firstPageModule = ?1 ") 
	List<Product> listByHomepage(int module);
	
	/**
	 * 按名字取like返回page
	 */
	Page<Product> findByProductNameLike(String key,Pageable pageable);
	
	
	
}