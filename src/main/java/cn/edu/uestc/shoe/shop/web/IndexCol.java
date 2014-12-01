package cn.edu.uestc.shoe.shop.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.uestc.shoe.shop.entity.Product;
import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.service.ProductService;
import cn.edu.uestc.shoe.shop.service.UserService;

/**
 * index col
 * 
 * @author Jesse
 *
 */

@Controller
@RequestMapping(value = "/index")
public class IndexCol {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	
	private final int RECOMMAND = 1;
	private final int HOT = 2;
	private final int NEWARRIVAL = 3;

	
	/**
	 * 首页商品展示 
	 * 
	 * firstPageModule值
	 * 推荐1 热卖2 新品3 不在首页展示0
	 */
	@RequestMapping(value = "index")
	public ModelAndView getHomepage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User u = (User)request.getSession().getAttribute("user");
		List<Product> lRecommand= productService.listHomepage(RECOMMAND);
		List<Product> lHot= productService.listHomepage(HOT);
		List<Product> lNewArrival= productService.listHomepage(NEWARRIVAL);
		
		mv.addObject("lRecommand", lRecommand);
		mv.addObject("lHot", lHot);
		mv.addObject("lNewArrival", lNewArrival);
		
		mv.setViewName("/index/index");
		return mv;
		
	}
	
	
}
