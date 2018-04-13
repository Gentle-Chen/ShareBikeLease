package com.bike.Dao;

import com.bike.Dto.Deposit;
import com.bike.Dto.User;

public interface UserDao {
	
	public User getUserByUuid(int u_uuid);
	
	public User getUserByEmail(String email);
	
	public boolean checkEmail(String u_email);
	
	public User regist(User user);
	
	public User updateUser(int u_uuid,String u_phone, String u_address);
	
	public User updatePassword(int u_uuid,String u_password);
	
	public void resetPassword(String email,String newPassword);
	
	public User checkMoney(int u_uuid,double money);
	
	public Deposit checkDeposit(int u_uuid);
	
}
