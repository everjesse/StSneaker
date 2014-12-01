package cn.edu.uestc.shoe.shop.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.Product;
import cn.edu.uestc.shoe.shop.entity.Shoppingcart;
import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.service.AddressService;
import cn.edu.uestc.shoe.shop.service.ShoppingcartService;
import cn.edu.uestc.shoe.shop.service.ProductService;
import cn.edu.uestc.shoe.shop.service.UserService;
/**
 * shoppingcart col
 *  
 * @author cjt
 */
@Controller
@RequestMapping(value="/shoppingcart")
public class ShoppingcartCol {
	@Autowired
	private ShoppingcartService shoppingcartService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	@Autowired
	private AddressService addressService;
	
	/**
	 * 添加
	 */
	@RequestMapping(value = "create")
	public String create(Integer productId,Integer productAmount,HttpServletRequest request){
		Product product = productService.get(productId);
		Boolean flag = false;
		//取用户ID
		User u = (User)request.getSession().getAttribute("user");
		
		//合并重复商品
		List<Shoppingcart> shoppingcarts  = shoppingcartService.list(u.getUserId());
		for(Shoppingcart s : shoppingcarts){
			if(flag = s.getProduct().equals(product)){
				s.setProductAmount(productAmount+s.getProductAmount());
				shoppingcartService.save(s);
				break;
			}
		}
		if(!flag){
			Shoppingcart shoppingcart = new Shoppingcart();
			shoppingcart.setProductAmount(productAmount);
			shoppingcart.setProduct(product);
			shoppingcart.setUser(u);
			shoppingcartService.save(shoppingcart);
		}
		
		return "redirect:/shoppingcart/list";
	}
	/**
	 * 显示购物车
	 */
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) {

		//取用户ID
		User u = (User)request.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView();
		List<Shoppingcart> shoppingcarts  = shoppingcartService.list(u.getUserId());
		mv.addObject("shoppingcarts",shoppingcarts);
		mv.setViewName("shoppingcart/shoppingcart");
		return mv;
	}
	
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete/{shoppingcartId}")
	public String delete(@PathVariable("shoppingcartId") Integer shoppingcartId) {
		
		shoppingcartService.delete(shoppingcartId);
		return "redirect:/shoppingcart/list";
	}
	
	
}
