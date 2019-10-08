package com.royal.pojo;

public class Provience {
	private int provienceId;
	private String provienceName;
	
	public Provience() {
		super();
	}
	public Provience(int provienceId, String provienceName) {
		super();
		this.provienceId = provienceId;
		this.provienceName = provienceName;
	}
	public int getProvienceId() {
		return provienceId;
	}
	public void setProvienceId(int provienceId) {
		this.provienceId = provienceId;
	}
	public String getProvienceName() {
		return provienceName;
	}
	public void setProvienceName(String provienceName) {
		this.provienceName = provienceName;
	}
	
}
