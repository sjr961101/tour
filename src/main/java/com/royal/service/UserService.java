package com.royal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royal.dao.UserDao;
import com.royal.form.LoginForm;
import com.royal.pojo.User;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	/**
	 * 查找用户
	 */
	public User findUserByUserName(User user) {
		return userDao.findUserByUserName(user.getUserName());
	}

	public User findUserByName(String name) {
		return userDao.findUserByUserName(name);
	}

	/**
	 * 添加用户
	 * @param name
	 * @param pwd
	 * @param confirm
	 * @param mail
	 */
	public void addUser(String userName, String password, String email,String flag) {
		userDao.addUser(userName,password,email,flag);
	}

	/**
	 * 根据邮箱地址查询用户
	 * @param mail
	 * @return
	 */
	public User findUserByEmail(String mail) {
		return userDao.findUserByEmail(mail);
	}
	
	/**禁用用户*/
	public void updateUserAble(int userId){
		userDao.updateUserAble(userId);
	}

	/**
	 * 查找所有用户
	 * @return
	 */
	public List<User> findAllUsers() {
		return userDao.findAllUsers();
	}

	/**
	 * 删除用户
	 * @param userId
	 */
	public void deleteUser(int userId) {
		userDao.deleteUser(userId);
	}

	/**
	 * 根据用户编号得到用户信息
	 * @param userId
	 * @return
	 */
	public User findUserByUserId(int userId) {
		return userDao.findUserByUserId(userId);
	}

	/**
	 * 修改用户信息
	 * @param userName
	 * @param password
	 * @param email
	 */
	public void editUser(int userId, String userName, String password, String email) {
		userDao.editUser(userId,userName,password,email);
	}

	/**
	 * 禁用用户
	 * @param userId
	 */
	public void disableUser(int userId) {
		userDao.disableUser(userId);
	}

	/**
	 * 启用用户
	 * @param userId
	 */
	public void enableUser(int userId) {
		userDao.enableUser(userId);
	}

	
}
