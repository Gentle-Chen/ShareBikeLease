package com.bike.Dto;

public class User {

	private String u_uuid;
	private String u_email;
	private String u_name;
	private String u_password;
	private String u_sex;
	private String u_identityCard;
	private String u_phone;
	private String u_address;
	private float u_balance;

	
	public String getU_uuid() {
		return u_uuid;
	}
	public void setU_uuid(String u_uuid) {
		this.u_uuid = u_uuid;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public String getU_identityCard() {
		return u_identityCard;
	}
	public void setU_identityCard(String u_identityCard) {
		this.u_identityCard = u_identityCard;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public float getU_balance() {
		return u_balance;
	}
	public void setU_balance(float u_balance) {
		this.u_balance = u_balance;
	}
	@Override
	public String toString() {
		return "User [u_uuid=" + u_uuid + ", u_email=" + u_email + ", u_name="
				+ u_name + ", u_password=" + u_password + ", u_sex=" + u_sex
				+ ", u_identityCard=" + u_identityCard + ", u_phone=" + u_phone
				+ ", u_address=" + u_address + ", u_balance=" + u_balance + "]";
	}
	
	
	
}
