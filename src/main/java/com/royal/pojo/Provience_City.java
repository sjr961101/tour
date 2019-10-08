package com.royal.pojo;

public class Provience_City {
	private int pcid;
	private int provienceId;
	private int cityId;
	
	
	public Provience_City() {
		super();
	}
	public Provience_City(int pcid, int provienceId, int cityId) {
		super();
		this.pcid = pcid;
		this.provienceId = provienceId;
		this.cityId = cityId;
	}
	public int getPcid() {
		return pcid;
	}
	public void setPcid(int pcid) {
		this.pcid = pcid;
	}
	public int getProvienceId() {
		return provienceId;
	}
	public void setProvienceId(int provienceId) {
		this.provienceId = provienceId;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	
}
