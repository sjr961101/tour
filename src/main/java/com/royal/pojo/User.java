package com.royal.pojo;

public class User {
	private int userId;
	private String userName;
	private String password;
	//�Ƿ���ã�0���á�1������
	private int isAble;
	//Ȩ��
	private int authorityId;
	private String email;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIsAble() {
		return isAble;
	}
	public void setIsAble(int isAble) {
		this.isAble = isAble;
	}
	public int getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(int authorityId) {
		this.authorityId = authorityId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}

