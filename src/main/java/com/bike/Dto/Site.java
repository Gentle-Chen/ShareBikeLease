package com.bike.Dto;

public class Site {

	private String s_uuid;
	private String s_name;
	private String s_longitude;
	private String s_latitude;
	private String s_capacity;
	
	
	public String getS_uuid() {
		return s_uuid;
	}
	public void setS_uuid(String s_uuid) {
		this.s_uuid = s_uuid;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_longitude() {
		return s_longitude;
	}
	public void setS_longitude(String s_longitude) {
		this.s_longitude = s_longitude;
	}
	public String getS_latitude() {
		return s_latitude;
	}
	public void setS_latitude(String s_latitude) {
		this.s_latitude = s_latitude;
	}
	public String getS_capacity() {
		return s_capacity;
	}
	public void setS_capacity(String s_capacity) {
		this.s_capacity = s_capacity;
	}
	
	@Override
	public String toString() {
		return "Site [s_uuid=" + s_uuid + ", s_name=" + s_name + ", s_longitude="
				+ s_longitude + ", s_latitude=" + s_latitude + ", s_capacity="
				+ s_capacity + "]";
	}
	
}
