package cn.edu.uestc.shoe.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.uestc.shoe.shop.entity.User;
import cn.edu.uestc.shoe.shop.repository.UserDao;
import cn.edu.uestc.shoe.shop.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public void save(User user) {
		userDao.save(user);
	}
	@Override
	public List<User> check(String mailbox) {
		return userDao.check(mailbox);
	}

	@Override
	public User check(User user) {
		User u =  userDao.check(user.getMailbox(), user.getPassword());
		return u;
	}
	@Override
	public User get(Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
