package com.bike.Dto;

public class Admin {
	
	private String a_uuid;
	
	private String a_email;
	
	private String a_password;


	

	public String getA_uuid() {
		return a_uuid;
	}

	public void setA_uuid(String a_uuid) {
		this.a_uuid = a_uuid;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email;
	}

	public String getA_password() {
		return a_password;
	}

	public void setA_password(String a_password) {
		this.a_password = a_password;
	}

	@Override
	public String toString() {
		return "Admin [a_uuid=" + a_uuid + ", a_email=" + a_email
				+ ", a_password=" + a_password + "]";
	}
	
	

}
