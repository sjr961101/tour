package com.royal.pojo;

public class Hotel {
	
	private Integer hotelId;
	private String hotelName;
	private String hotelAddress;
	private Integer scenicId;
	private String picture;
	private Integer pv;
	
	public Hotel() {
		super();
	}
	
	public Hotel(Integer hotelId, String hotelName, String hotelAddress, Integer scenicId, String picture, Integer pv) {
		super();
		this.hotelId = hotelId;
		this.hotelName = hotelName;
		this.hotelAddress = hotelAddress;
		this.scenicId = scenicId;
		this.picture = picture;
		this.pv = pv;
	}

	public Integer getHotelId() {
		return hotelId;
	}
	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
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
	public Integer getPv() {
		return pv;
	}
	public void setPv(Integer pv) {
		this.pv = pv;
	}
	

}
