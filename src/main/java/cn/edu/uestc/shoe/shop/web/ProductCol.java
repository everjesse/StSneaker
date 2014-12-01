package cn.edu.uestc.shoe.shop.web;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



import org.springframework.web.servlet.ModelAndView;

import cn.edu.uestc.shoe.shop.entity.Product;
import cn.edu.uestc.shoe.shop.service.ProductService;
import cn.edu.uestc.shoe.shop.util.WebSer;

/**
 * product col
 * 
 * @author Jesse
 *
 */
@Controller
@RequestMapping(value = "/products")
public class ProductCol {
	
	@Autowired
	private ProductService productService;
	
	/**
	 * 列表显示
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String indent(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "9") int pageSize,
			@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "brand", defaultValue = "") String brand,
			Model model,
			HttpServletRequest request) {

		//Integer userId = (Integer)request.getSession().getAttribute("userId");
		Page<Product> page = null;
		
		if(type.equals("")&&brand.equals("")){
			page = productService.listAll(new PageRequest(pageNumber-1, pageSize, Sort.Direction.DESC, "productId"));
		}
		else if(type.equals("")&&(!brand.equals(""))){
			page = productService.listByBrand(brand, new PageRequest(pageNumber-1, pageSize));
		}
		else if(!(type.equals(""))&&brand.equals("")){
			page = productService.listByType(type, new PageRequest(pageNumber-1, pageSize));
		}
		else{
			page = productService.listByBrandAndType(brand, type, new PageRequest(pageNumber-1, pageSize));
		}
		
//		Page<Product> page = productService.list(new PageRequest(pageNumber-1, pageSize, Sort.Direction.DESC, "indentId"),cuId);
	    model.addAttribute("products", page);
	    return "list/list";
	}
	
	/**
	 * 商品详情显示
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail(@RequestParam(value = "productId", defaultValue = "1") int productId){
		ModelAndView mv = new ModelAndView();
		
		Product p = productService.get(productId);
		mv.addObject("product", p);
		mv.setViewName("single/single");
		return mv;
	}

	/**
	 * 搜索
	 */
	@RequestMapping(value = "/search")
	public String search(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "9") int pageSize,
			String _key,ServletRequest request,
			Model model){
		Page<Product> page = null;
		page = productService.listBySearch(_key.trim(),new PageRequest(pageNumber-1, pageSize));
		model.addAttribute("products", page);
		
		Map<String, Object> searchParams = WebSer.getParametersStartingWith(request, "_");
		model.addAttribute("searchParams", WebSer.encodeParameterStringWithPrefix(searchParams, "_"));
		return "list/list";
	}
}
