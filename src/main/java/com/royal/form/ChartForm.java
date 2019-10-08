package com.royal.form;

import java.util.Date;

public class ChartForm {

	private Integer userId;
	private String content;
	private Integer scenicId;
	private Date chartTime;
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
	public Integer getScenicId() {
		return scenicId;
	}
	public void setScenicId(Integer scenicId) {
		this.scenicId = scenicId;
	}
	public Date getChartTime() {
		return chartTime;
	}
	public void setChartTime(Date chartTime) {
		this.chartTime = chartTime;
	}
	
}
