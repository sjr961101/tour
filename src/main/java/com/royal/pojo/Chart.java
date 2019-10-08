package com.royal.pojo;

import java.util.Date;



public class Chart {

	private Integer chartId;
	private Integer userId;
	private String content;
	private Integer scenicid;
	private Date chartTime;
	private String formatTime;
	private User user;
	private Scenic scenic;
	public Integer getChartId() {
		return chartId;
	}
	public void setChartId(Integer chartId) {
		this.chartId = chartId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getScenicid() {
		return scenicid;
	}
	public void setScenicid(Integer scenicid) {
		this.scenicid = scenicid;
	}
	public Date getChartTime() {
		return chartTime;
	}
	public void setChartTime(Date chartTime) {
		this.chartTime = chartTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Scenic getScenic() {
		return scenic;
	}
	public void setScenic(Scenic scenic) {
		this.scenic = scenic;
	}
	public String getFormatTime() {
		return formatTime;
	}
	public void setFormatTime(String formatTime) {
		this.formatTime = formatTime;
	}
}
