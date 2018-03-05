package com.bike.Dao;

import com.bike.Dto.Admin;
import com.bike.Dto.Login;
import com.bike.Dto.User;

public interface LoginDao {
	
	public User loginForUser(Login login);
	
	public Admin loginForAdmin(Login login);

	User findUser(Login login);

	Admin findAdmin(Login login);

}
