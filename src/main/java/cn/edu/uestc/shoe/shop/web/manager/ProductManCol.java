package cn.edu.uestc.shoe.shop.web.manager;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.uestc.shoe.shop.entity.Product;
import cn.edu.uestc.shoe.shop.service.ProductService;
import cn.edu.uestc.shoe.shop.util.ImageSize;
import cn.edu.uestc.shoe.shop.util.ImageUpload;


@Controller
@RequestMapping(value="/manager/product")
public class ProductManCol {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ImageUpload imageUpload;
	
	@Value("#{imagePropertise['image.path']}")
	private String path;
	
	private ImageSize imageSzie = new ImageSize(600, 600);
	
	@RequestMapping(value = "/view")
	public String task() {
		return "manager/product";
	}
	
	/**
	 * 列表
	 */	
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Integer rows, Integer page) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Page<Product> products = productService.listAll(new PageRequest(page - 1, rows, Sort.Direction.DESC, "productId"));
		map.put("total", products.getTotalElements());
		map.put("rows", products.getContent());
		return map;
	}
	
	/**
	 * 添加
	 */
	@RequestMapping(value="/create")
	@ResponseBody
	public Map<String, Object> create(Product product, MultipartFile file, MultipartFile file1) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String photo =  imageUpload.imageUpload(path, file, imageSzie);
		String intro =  imageUpload.imageUpload(path, file1, imageSzie);
		product.setProductBriefInfo(intro);
		product.setProductPhoto(photo);
		productService.save(product);
		map.put("success", true);
		return map;
	}
	
	
	/**
	 * 编辑
	 */
	@RequestMapping(value="/update")
	@ResponseBody
	public Map<String, Object> update(Product product, MultipartFile file, MultipartFile file1) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(file.getOriginalFilename()!="")
		{
			String photo =  imageUpload.imageUpload(path, file, imageSzie);
			product.setProductPhoto(photo);
		}
		if(file1.getOriginalFilename()!="")
		{
			String intro =  imageUpload.imageUpload(path, file1, imageSzie);
			product.setProductBriefInfo(intro);
		}
		productService.save(product);
		map.put("success", true);
		return map;
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("id") Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
		productService.delete(id);
		map.put("success", true);
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
