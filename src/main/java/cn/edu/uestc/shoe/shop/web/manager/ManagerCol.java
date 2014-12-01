package cn.edu.uestc.shoe.shop.web.manager;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * task col
 *  
 * @author lynch
 */
@Controller
@RequestMapping(value="/manager")
public class ManagerCol {
	
	/**
	 * 后台首页
	 */	
	@RequestMapping(value = "index")
	public String index() {
		return "manager/index";
	}
	
}
