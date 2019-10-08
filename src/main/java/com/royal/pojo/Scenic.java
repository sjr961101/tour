package com.royal.pojo;
/**
 * ����
 * @author admin
 *
 */
public class Scenic {
	//����id
	private Integer scenicId;
	//��������
	private String scenicName;
	//ʡ��
	private String province;
	//��
	private String city;
	//������ϸ��ַ
	private String address;
	//����ͼƬ
	private String picture;
	//���
	private Integer categoryId;
	//����
	private String info;
	//������
	private Integer pv;
	public Scenic() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Scenic(Integer scenicId, String scenicName, String province, String city, String address, String picture,
			Integer categoryId, String info) {
		super();
		this.scenicId = scenicId;
		this.scenicName = scenicName;
		this.province = province;
		this.city = city;
		this.address = address;
		this.picture = picture;
		this.categoryId = categoryId;
		this.info = info;
	}
	

	public Scenic(Integer scenicId, String scenicName, String province, String city, String address, String picture,
			Integer categoryId, String info, Integer pv) {
		super();
		this.scenicId = scenicId;
		this.scenicName = scenicName;
		this.province = province;
		this.city = city;
		this.address = address;
		this.picture = picture;
		this.categoryId = categoryId;
		this.info = info;
		this.pv = pv;
	}


	public Integer getScenicId() {
		return scenicId;
	}
	public void setScenicId(Integer scenicId) {
		this.scenicId = scenicId;
	}
	public String getScenicName() {
		return scenicName;
	}
	public void setScenicName(String scenicName) {
		this.scenicName = scenicName;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}


	public Integer getPv() {
		return pv;
	}


	public void setPv(Integer pv) {
		this.pv = pv;
	}
	
	
}
