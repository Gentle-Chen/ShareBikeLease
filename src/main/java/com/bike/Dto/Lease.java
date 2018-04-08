package com.bike.Dto;

public class Lease {
	
	private String l_uuid;
	
	private String l_leaseTime;
	
	private String l_returnTime;
	
	private double l_money;
	
	private String l_status;
	
	private String l_money_status;
	
	private User user;
	
	private Bike bike;

	public String getL_uuid() {
		return l_uuid;
	}

	public void setL_uuid(String l_uuid) {
		this.l_uuid = l_uuid;
	}

	public String getL_leaseTime() {
		return l_leaseTime;
	}

	public void setL_leaseTime(String l_leaseTime) {
		this.l_leaseTime = l_leaseTime;
	}

	public String getL_returnTime() {
		return l_returnTime;
	}

	public void setL_returnTime(String l_returnTime) {
		this.l_returnTime = l_returnTime;
	}


	public double getL_money() {
		return l_money;
	}

	public void setL_money(double l_money) {
		this.l_money = l_money;
	}

	public String getL_status() {
		return l_status;
	}

	public void setL_status(String l_status) {
		this.l_status = l_status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Bike getBike() {
		return bike;
	}

	public void setBike(Bike bike) {
		this.bike = bike;
	}

	public String getL_money_status() {
		return l_money_status;
	}

	public void setL_money_status(String l_money_status) {
		this.l_money_status = l_money_status;
	}
	
	

}
