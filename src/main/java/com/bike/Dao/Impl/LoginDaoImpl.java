package com.bike.Dao.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bike.Dao.LoginDao;
import com.bike.Dto.Admin;
import com.bike.Dto.Login;
import com.bike.Dto.User;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public User findUser(Login login){
		String statement = "com.bike.Mapper.LoginMapper.findUser";
		User u = sqlSessionTemplate.selectOne(statement, login);
		return u;
	}
	
	@Override
	public User loginForUser(Login login){
		String statement = "com.bike.Mapper.LoginMapper.userLogin";
		User u = sqlSessionTemplate.selectOne(statement, login);
		return u;
	}
	
	@Override
	public Admin findAdmin(Login login){
		String statement = "com.bike.Mapper.LoginMapper.findAdmin";
		Admin a = sqlSessionTemplate.selectOne(statement, login);
		return a;
	}

	@Override
	public Admin loginForAdmin(Login login) {
		String statement = "com.bike.Mapper.LoginMapper.adminLogin";
		Admin a = sqlSessionTemplate.selectOne(statement, login);
		return a;
	}

}
