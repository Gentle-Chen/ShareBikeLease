package com.bike.Dto;

public class Bike {

	private String b_uuid;
	private String b_id;
	private String b_status;
	private Site site;

	
	public String getB_uuid() {
		return b_uuid;
	}
	public void setB_uuid(String b_uuid) {
		this.b_uuid = b_uuid;
	}
	
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getB_status() {
		return b_status;
	}
	public void setB_status(String b_status) {
		this.b_status = b_status;
	}
	public Site getSite() {
		return site;
	}
	public void setSite(Site site) {
		this.site = site;
	}
	
	@Override
	public String toString() {
		return "Bike [b_uuid=" + b_uuid + ", b_id=" + b_id + ", b_status="
				+ b_status + ", site=" + site + "]";
	}
	
	
}
