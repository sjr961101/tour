package com.royal.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * �û��Ƽ�����
 * @author admin
 *
 */
public class User_Scenic {
	//�û��Ƽ�����id
	private Integer usId;
	//�û�����
	private User user;
	//��������
	private String usName;
	//������ϸ��ַ
	private String scenicAddress;
	//ʡ��
	private String province;
	//��
	private String city;
	//����ͼƬ
	private String picture;
	//�Ƽ�����
	private String reason;
	//�Ƽ�ʱ��
	private Date recommandTime;
	//�Ƿ�ͨ��(0δ�鿴��1ͨ����-1����)
	private Integer ispass;
	private String rTime;
	
	
	public User_Scenic() {
		// TODO Auto-generated constructor stub
	}
	
	public User_Scenic(Integer usId, User user, String usName, String scenicAddress, String province, String city,
			String picture, String reason, Date recommandTime, Integer ispass) {
		super();
		this.usId = usId;
		this.user = user;
		this.usName = usName;
		this.scenicAddress = scenicAddress;
		this.province = province;
		this.city = city;
		this.picture = picture;
		this.reason = reason;
		this.recommandTime = recommandTime;
		this.ispass = ispass;
	}

	public Integer getUsId() {
		return usId;
	}

	public void setUsId(Integer usId) {
		this.usId = usId;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUsName() {
		return usName;
	}
	public void setUsName(String usName) {
		this.usName = usName;
	}
	public String getScenicAddress() {
		return scenicAddress;
	}
	public void setScenicAddress(String scenicAddress) {
		this.scenicAddress = scenicAddress;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
	public Date getRecommandTime() {
		return recommandTime;
	}
	public void setRecommandTime(Date recommandTime) {
		this.recommandTime = recommandTime;
	}
	public Integer getIspass() {
		return ispass;
	}
	public void setIspass(Integer ispass) {
		this.ispass = ispass;
	}

	public String getrTime() {
		SimpleDateFormat formart=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return formart.format(recommandTime);
	}

	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	
}
