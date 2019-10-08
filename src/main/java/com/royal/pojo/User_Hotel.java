package com.royal.pojo;

import java.util.Date;

/**
 * �û��Ƽ��Ƶ�
 * @author admin
 *
 */
public class User_Hotel {
	//�Ƶ�id
	private Integer uhId;
	//�û�����
	private User user;
	//�Ƶ�����
	private String hotelName;
	//�Ƶ��ַ
	private String hotelAddress;
	//����id
	private Integer scenicId;
	//�Ƶ�ͼƬ
	private String picture;
	//�Ƽ�����
	private String reason;
	//�Ƽ�ʱ��
	private Date recommandTime;
	//�Ƽ�ʱ���ַ�����ʽ
	private String strRTime;
	public Date getRecommandTime() {
		return recommandTime;
	}
	public void setRecommandTime(Date recommandTime) {
		this.recommandTime = recommandTime;
	}
	//�Ƿ�ͨ��(0δ�鿴��1ͨ����-1����)
	private Integer isPass;
	public Integer getUhId() {
		return uhId;
	}
	public void setUhId(Integer uhId) {
		this.uhId = uhId;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getHotelAddress() {
		return hotelAddress;
	}
	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}
	public Integer getScenicId() {
		return scenicId;
	}
	public void setScenicId(Integer scenicId) {
		this.scenicId = scenicId;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getIsPass() {
		return isPass;
	}
	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
	public String getStrRTime() {
		return strRTime;
	}
	public void setStrRTime(String strRTime) {
		this.strRTime = strRTime;
	}
	public User_Hotel(Integer uhId, User user, String hotelName, String hotelAddress, Integer scenicId, String picture,
			String reason, Date recommandTime, String strRTime, Integer isPass) {
		super();
		this.uhId = uhId;
		this.user = user;
		this.hotelName = hotelName;
		this.hotelAddress = hotelAddress;
		this.scenicId = scenicId;
		this.picture = picture;
		this.reason = reason;
		this.recommandTime = recommandTime;
		this.strRTime = strRTime;
		this.isPass = isPass;
	}
	public User_Hotel() {
		super();
	}
	
}
