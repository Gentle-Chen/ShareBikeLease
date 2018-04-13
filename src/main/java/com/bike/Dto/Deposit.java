package com.bike.Dto;

public class Deposit {
	
	private int d_uuid;
	
	private String d_status;
	
	private double d_money;
	
	private User user;

	public int getD_uuid() {
		return d_uuid;
	}

	public void setD_uuid(int d_uuid) {
		this.d_uuid = d_uuid;
	}

	public String getD_status() {
		return d_status;
	}

	public void setD_status(String d_status) {
		this.d_status = d_status;
	}

	public double getD_money() {
		return d_money;
	}

	public void setD_money(double d_money) {
		this.d_money = d_money;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

}
