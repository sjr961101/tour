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
	 * �����û�
	 */
	public User findUserByUserName(User user) {
		return userDao.findUserByUserName(user.getUserName());
	}

	public User findUserByName(String name) {
		return userDao.findUserByUserName(name);
	}

	/**
	 * ����û�
	 * @param name
	 * @param pwd
	 * @param confirm
	 * @param mail
	 */
	public void addUser(String userName, String password, String email,String flag) {
		userDao.addUser(userName,password,email,flag);
	}

	/**
	 * ���������ַ��ѯ�û�
	 * @param mail
	 * @return
	 */
	public User findUserByEmail(String mail) {
		return userDao.findUserByEmail(mail);
	}
	
	/**�����û�*/
	public void updateUserAble(int userId){
		userDao.updateUserAble(userId);
	}

	/**
	 * ���������û�
	 * @return
	 */
	public List<User> findAllUsers() {
		return userDao.findAllUsers();
	}

	/**
	 * ɾ���û�
	 * @param userId
	 */
	public void deleteUser(int userId) {
		userDao.deleteUser(userId);
	}

	/**
	 * �����û���ŵõ��û���Ϣ
	 * @param userId
	 * @return
	 */
	public User findUserByUserId(int userId) {
		return userDao.findUserByUserId(userId);
	}

	/**
	 * �޸��û���Ϣ
	 * @param userName
	 * @param password
	 * @param email
	 */
	public void editUser(int userId, String userName, String password, String email) {
		userDao.editUser(userId,userName,password,email);
	}

	/**
	 * �����û�
	 * @param userId
	 */
	public void disableUser(int userId) {
		userDao.disableUser(userId);
	}

	/**
	 * �����û�
	 * @param userId
	 */
	public void enableUser(int userId) {
		userDao.enableUser(userId);
	}

	
}
