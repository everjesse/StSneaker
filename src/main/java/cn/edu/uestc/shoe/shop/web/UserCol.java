package cn.edu.uestc.shoe.shop.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.service.UserService;

/**
 * user col
 * 
 * @author Jesse cjt
 */
@Controller
@RequestMapping(value="/user")
public class UserCol {
	
	@Autowired
	private UserService userService;	
	
		/**
		 * 注册页面
		 */
		@RequestMapping(value = "register")
		public String createForm() {

			return "user/register";
		}
		
		/**
		 * 添加
		 */
		@RequestMapping(value = "registerUser")
		public ModelAndView registerUser(User user) {
			ModelAndView mv = new ModelAndView();
			System.out.println(user.getMailbox()+"->"+user.getPassword());

			String msg = "";
			if("".equals(user.getMailbox())){
				msg="账号为空";    //账号不能为空
				mv.setViewName("user/register");
			}else if("".equals(user.getPassword())){
				msg="密码为空" ;    //密码不能为空
				mv.setViewName("user/register");
			}else {
		    	List<User> list = userService.check(user.getMailbox());
		    	if(list.size()==0){
		    		userService.save(user);
		    		msg="注册成功";
		    		mv.setViewName("login/login");
		    	}else{
		    		msg="该账号已被占用";
		    		mv.setViewName("user/register");
		    	}
			}

			mv.addObject("msg", msg);
			System.out.println(user.getMailbox()+"->"+user.getPassword());
			return mv;
		}
		
		/**
		 * 登陆页面
		 *
		 */
		@RequestMapping(value="/login")
		public String loginPage(){
			return "/login/login";
		}
		
		/**
		 * 
		 * 登陆
		 */
		
		@RequestMapping(value="/submit",method = RequestMethod.POST)
		public ModelAndView login(User u,HttpServletRequest request){
			ModelAndView mv = new ModelAndView();
			User t = userService.check(u);
			if(t == null){
				mv.addObject("msg", "用户名/密码有误");
				mv.setViewName("/login/login");
				return mv;
			}
			else{
				mv.setViewName("redirect:/index/index");
				request.getSession().setAttribute("user", t);
				
				System.out.println(t.getMailbox()+":"+t.getPassword());
				return mv;
			}
		}
		
		/**
		 * 注销
		 */
		@RequestMapping(value = "/logout")
		public String logout(HttpServletRequest request){
			request.getSession().removeAttribute("user");
			return "redirect:/index/index";
		}
	
}
