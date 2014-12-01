package cn.edu.uestc.shoe.shop.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.Orderdetail;
import cn.edu.uestc.shoe.shop.entity.Orderinfo;
import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.service.AddressService;
import cn.edu.uestc.shoe.shop.service.OrderDetailService;
import cn.edu.uestc.shoe.shop.service.OrderService;
import cn.edu.uestc.shoe.shop.service.UserService;
/**
 * usercenter col
 *  
 *@author cjt
 */
@Controller
@RequestMapping(value="/usercenter")
public class UserCenterCol {
    @Autowired
    private OrderService orderService;
	@Autowired
	private  AddressService addressService;
    @Autowired
	private UserService userService;
    
    @Autowired
    private OrderDetailService orderDetailService;
	/**
	 * 跳转页面
	 */
	@RequestMapping(value = "usercenter",method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request,@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "5") int pageSize) {

		ModelAndView mv = new ModelAndView();
		//取用户ID
		User u = (User)request.getSession().getAttribute("user");
		Page<Address>address=addressService.listByUser( u,new PageRequest(pageNumber-1, pageSize));
		mv.addObject("Address", address);
		Page<Orderinfo> orderinfo = orderService.listByUser( u,new PageRequest(pageNumber-1, pageSize));
	    mv.addObject("Order",orderinfo );
//	    List<Orderinfo> orderinfos  = u.getOrderinfos();
	    List<Orderinfo> orderinfos = orderService.get(u.getUserId());


		mv.addObject("orderinfos",orderinfos);
		mv.setViewName("usercenter/usercenter");
		return mv;
	}
//	/**
//	 * 添加页面
//	 */
//	@RequestMapping(value = "createform", method = RequestMethod.POST)
//	public String createForm(Model model) {
//
//		model.addAttribute("Address", new Address());
//		model.addAttribute("action", "create");
//		return "/usercenter/usercenter";
//	}
//	

	/**
	 * 添加地址
	 */
	@RequestMapping(value ="create", method = RequestMethod.POST)
	public ModelAndView create(HttpServletRequest request,Address address) {
		ModelAndView mv = new ModelAndView(); 

		
		//取用户ID
		User u = (User)request.getSession().getAttribute("user");
		address.setUser(u);
		
		if(address.getIsDefaultAddress()==null){
			address.setIsDefaultAddress(false);
		}
		else{
			Page<Address> pAddresses = addressService.listByUser(u, new PageRequest(
					0, 8));
			for(Address tmp : pAddresses.getContent()){
				tmp.setIsDefaultAddress(false);
				addressService.save(tmp);
			}
			address.setIsDefaultAddress(true);
		}
		
		addressService.save(address);
		mv.addObject("msg", 6);
		mv.setViewName("redirect:/usercenter/usercenter");
		return mv;
	}
	

	/**
	 * 设为默认
	 */
	
	@RequestMapping(value = "default/{addressId}")
	public ModelAndView defalut(HttpServletRequest request, @PathVariable("addressId") Integer addressId,@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "5") int pageSize) {
		ModelAndView mv = new ModelAndView(); 

		User u = (User)request.getSession().getAttribute("user");
		Page<Address>addr=addressService.listByUser( u,new PageRequest(pageNumber-1, pageSize));
        for(Address tmp : addr.getContent()){
			tmp.setIsDefaultAddress(false);
			addressService.save(tmp);
		}
        Address address=addressService.gets(addressId);
        address.setIsDefaultAddress(true);
        addressService.save(address);
        mv.addObject("msg", 5);
		mv.setViewName("redirect:/usercenter/usercenter");
		return mv;
	}
	/**
	 * 删除地址
	 */
	@RequestMapping(value = "delete/{addressId}")
	public ModelAndView delete(@PathVariable("addressId") Integer AddressId) {
		ModelAndView mv = new ModelAndView(); 

		addressService.delete(AddressId);
		mv.addObject("msg", 4);
		mv.setViewName("redirect:/usercenter/usercenter");
		return mv;
	}
   /**
   * 删除订单
   */
	@RequestMapping(value = "deletes/{orderId}")
	public ModelAndView deletes(@PathVariable("orderId") Integer orderId) {
		
		ModelAndView mv = new ModelAndView(); 
		
	 	Orderinfo oi = orderService.getOne(orderId);
	 	List<Orderdetail> lOd = oi.getOrderdetails();
	 	for(Orderdetail od : lOd){
	 		orderDetailService.delete(od.getOrderDetailId());
	 	}
	 	
		orderService.delete(orderId);
		mv.addObject("msg", 3);
		mv.setViewName("redirect:/usercenter/usercenter");
		return mv;
	}
/**
 * 修改密码
 */
@RequestMapping(value = "updatepassword",method = RequestMethod.POST)
public ModelAndView updateuser(HttpServletRequest request,String oldpassword,String newpassword)
{
	ModelAndView mv = new ModelAndView();
	User u= (User)request.getSession().getAttribute("user");
	if (oldpassword.equals(u.getPassword())){
		u.setPassword(newpassword);
		userService.save(u);
		mv.addObject("msg", "1");

	}

	else{
		mv.addObject("msg", "2");
	}
	mv.setViewName("redirect:/usercenter/usercenter");
	return mv;
	
}
}
