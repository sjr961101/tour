package com.royal.dao;

import java.util.List;

import com.royal.pojo.User;

public interface UserDao {
	/**
	 * 查找用户
	 * @param userName
	 * @return
	 */
	public User findUserByUserName(String userName);

	/**
	 * 添加用户
	 * @param name
	 * @param pwd
	 * @param confirm
	 * @param mail
	 */
	public void addUser(String name, String pwd, String mail,String flag);

	/**
	 * 根据邮箱地址查询用户
	 * @param mail
	 * @return
	 */
	public User findUserByEmail(String mail);
	
	/**禁用用户*/
	public void updateUserAble(int userId);

	/**
	 * 查找所有用户
	 * @return
	 */
	public List<User> findAllUsers();

	/**
	 * 删除用户
	 * @param userId
	 */
	public void deleteUser(int userId);

	/**
	 * 根据用户编号得到用户信息
	 * @param userId
	 * @return
	 */
	public User findUserByUserId(int userId);

	/**
	 * 修改用户信息
	 * @param userName
	 * @param password
	 * @param email
	 */
	public void editUser(int userId,String userName, String password, String email);

	/**
	 * 禁用用户
	 * @param userId
	 */
	public void disableUser(int userId);
	
	/**
	 * 启用用户
	 */
	public void enableUser(int userId);
}
