package com.royal.dao;

import java.util.List;

import com.royal.pojo.User;

public interface UserDao {
	/**
	 * �����û�
	 * @param userName
	 * @return
	 */
	public User findUserByUserName(String userName);

	/**
	 * ����û�
	 * @param name
	 * @param pwd
	 * @param confirm
	 * @param mail
	 */
	public void addUser(String name, String pwd, String mail,String flag);

	/**
	 * ���������ַ��ѯ�û�
	 * @param mail
	 * @return
	 */
	public User findUserByEmail(String mail);
	
	/**�����û�*/
	public void updateUserAble(int userId);

	/**
	 * ���������û�
	 * @return
	 */
	public List<User> findAllUsers();

	/**
	 * ɾ���û�
	 * @param userId
	 */
	public void deleteUser(int userId);

	/**
	 * �����û���ŵõ��û���Ϣ
	 * @param userId
	 * @return
	 */
	public User findUserByUserId(int userId);

	/**
	 * �޸��û���Ϣ
	 * @param userName
	 * @param password
	 * @param email
	 */
	public void editUser(int userId,String userName, String password, String email);

	/**
	 * �����û�
	 * @param userId
	 */
	public void disableUser(int userId);
	
	/**
	 * �����û�
	 */
	public void enableUser(int userId);
}
