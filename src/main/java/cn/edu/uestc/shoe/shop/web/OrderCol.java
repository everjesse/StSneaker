package cn.edu.uestc.shoe.shop.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.uestc.shoe.shop.entity.Address;
import cn.edu.uestc.shoe.shop.entity.Orderdetail;
import cn.edu.uestc.shoe.shop.entity.Orderinfo;
import cn.edu.uestc.shoe.shop.entity.Product;
import cn.edu.uestc.shoe.shop.entity.Shoppingcart;
import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.service.AddressService;
import cn.edu.uestc.shoe.shop.service.OrderDetailService;
import cn.edu.uestc.shoe.shop.service.OrderService;
import cn.edu.uestc.shoe.shop.service.ProductService;
import cn.edu.uestc.shoe.shop.service.ShoppingcartService;
import cn.edu.uestc.shoe.shop.service.UserService;



@Controller
@RequestMapping(value="/order")
public class OrderCol {
	@Autowired
	private OrderService indentService;
	@Autowired
	private ShoppingcartService shoppingcartService;
	@Autowired
	private UserService userService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private ProductService productService;
	
	/**
	 * 保存订单
	 */
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView orderCreate(Integer addressId,String feedbackRemark,HttpServletRequest request) {


		List<Shoppingcart> list = (List<Shoppingcart>)request.getSession().getAttribute("cart");
		//取用户ID
		User u =(User)request.getSession().getAttribute("user");
		ModelAndView mv1 = new ModelAndView();
		Address address = addressService.get(addressId);
		List<Orderdetail> listdetails = new ArrayList<Orderdetail>();
		
		Orderinfo orderinfo  = new Orderinfo();
		
		
		orderinfo.setPhone(address.getPhone());
		orderinfo.setOrderStatus(1);  //此字段可能不会用到
		orderinfo.setOrderPayWay("货到付款");
//		orderinfo.setOrderId(u.getUserId());
		orderinfo.setFeedbackRemarks(feedbackRemark);
		orderinfo.setDeliveryAddress(address.getDetailAddress());
		orderinfo.setAddressName(address.getAddressName());
		orderinfo.setUser(u);
		orderinfo.setOrderCreateTime(new Date());
		
		double payprice = 0;
		
		//对订单详情进行修改
		for(int i=0;i<list.size();i++){
			
			Shoppingcart cart = list.get(i);
			Product b = cart.getProduct();
			payprice=payprice + b.getProductTradePrice()*cart.getProductAmount();
			
			Orderdetail details = new Orderdetail();
			details.setProductAmount(cart.getProductAmount());
			details.setProductId(b.getProductId());
			details.setProductPhoto(b.getProductPhoto());
			details.setProductTradePrice(b.getProductTradePrice());
			details.setOrderinfo(orderinfo);    //没有orderinfo!!
//			orderDetailService.save(details);   不能在这里save!!
			
			listdetails.add(details);
		}
			orderinfo.setOrderdetails(listdetails);
			orderinfo.setOrderTotalMoney(payprice);
			Orderinfo newOrder = indentService.save(orderinfo);
			
//		//这里save orderdetail
//		for(Orderdetail detail : listdetails){
//			detail.setOrderinfo(newOrder);
//			orderDetailService.save(detail);
//		}
		
			
		for(Shoppingcart tmp : list){
			Product p = tmp.getProduct();
			
			int newAmount = p.getProductStock() - tmp.getProductAmount();
			if(newAmount > 0)
				p.setProductStock(newAmount);
			else
				p.setProductStock(0);
			productService.save(p);
			shoppingcartService.delete(tmp.getShoppingcartId());
		}
		
		//此处还没有修改	
		//mv1.addObject("list",list);
		mv1.setViewName("redirect:/usercenter/usercenter");
		return mv1;
	}
	
	/**
	 * 添加新地址
	 * @param address
	 * @param request
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = "newaddress")
	@ResponseBody
	public Map<String, Object> create(Address address, HttpServletRequest request,@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "8") int pageSize){
		
		Map<String, Object> map = new HashMap<String, Object>();
		User u = (User) request.getSession().getAttribute("user");
		address.setUser(u);
		if(address.getIsDefaultAddress()==null){
			address.setIsDefaultAddress(false);
		}
		else{
			Page<Address> pAddresses = addressService.listByUser(u, new PageRequest(
					pageNumber - 1, pageSize));
			for(Address tmp : pAddresses.getContent()){
				tmp.setIsDefaultAddress(false);
				addressService.save(tmp);
			}
			address.setIsDefaultAddress(true);
		}
		addressService.save(address);
		Page<Address> addresses = addressService.listByUser(u, new PageRequest(
				pageNumber - 1, pageSize));
		map.put("success", true);
		map.put("msg", "添加成功！");
		map.put("obj", address);
		map.put("addresses", addresses);
		return map;
	}
	
	
	/**
	 * 确认订单
	 */
	@RequestMapping(value = "confirm",method = RequestMethod.GET)
	public ModelAndView indentfirst(
			Integer[] productAmount,
			Integer[] shoppingcartId,
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "8") int pageSize,
			HttpServletRequest request) {

		//取用户ID
	    User u = (User)request.getSession().getAttribute("user");
	    
		
		for(int i = 0;i < shoppingcartId.length;i++){
			
			Shoppingcart tmp = shoppingcartService.get(shoppingcartId[i]);
			tmp.setProductAmount(productAmount[i]);
			shoppingcartService.save(tmp);
		}
		
		
		
		List<Shoppingcart> shoppingcarts  = shoppingcartService.list(u.getUserId());
		//存入session
		request.getSession().setAttribute("cart", shoppingcarts);
		//Page<Address>address=addressService.list(new PageRequest(pageNumber-1, pageSize), u.getUserId());
		Page<Address>address=addressService.listByUser( u,new PageRequest(pageNumber-1, pageSize));
		ModelAndView mv1 = new ModelAndView();
		mv1.addObject("lShoppingcarts",shoppingcarts);
		mv1.addObject("pAddresses", address);
		mv1.setViewName("order/order");
		return mv1;
	}
}
	

