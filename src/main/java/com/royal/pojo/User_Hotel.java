package com.royal.pojo;

import java.util.Date;

/**
 * 用户推荐酒店
 * @author admin
 *
 */
public class User_Hotel {
	//酒店id
	private Integer uhId;
	//用户对象
	private User user;
	//酒店名称
	private String hotelName;
	//酒店地址
	private String hotelAddress;
	//景点id
	private Integer scenicId;
	//酒店图片
	private String picture;
	//推荐理由
	private String reason;
	//推荐时间
	private Date recommandTime;
	//推荐时间字符串形式
	private String strRTime;
	public Date getRecommandTime() {
		return recommandTime;
	}
	public void setRecommandTime(Date recommandTime) {
		this.recommandTime = recommandTime;
	}
	//是否被通过(0未查看，1通过，-1驳回)
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
