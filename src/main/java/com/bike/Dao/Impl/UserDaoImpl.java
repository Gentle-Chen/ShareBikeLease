package com.bike.Dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bike.Dao.UserDao;
import com.bike.Dto.Deposit;
import com.bike.Dto.User;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public User regist(User user){
		String statement = "com.bike.Mapper.UserMapper.regist";
		int i = sqlSessionTemplate.insert(statement, user);
		if(i>0){
			return user;
		}else
			return null;
		
	}

	public boolean checkEmail(String u_email) {
		String statement = "com.bike.Mapper.UserMapper.checkEmail";
		List<User> list = sqlSessionTemplate.selectList(statement,u_email);
		if(list == null || list.isEmpty()){
			return true;
		}else{
			return false;	
		}
		
	}

	public User getUserByUuid(int u_uuid) {
		String statement = "com.bike.Mapper.UserMapper.getUserByUuid";
		User user = sqlSessionTemplate.selectOne(statement,u_uuid);
		return user;
	}

	public User updateUser(int u_uuid, String u_phone, String u_address) {
		Map<String,Object> updateMap = new HashMap<String,Object>();
		updateMap.put("u_uuid", u_uuid);
		updateMap.put("u_phone", u_phone);
		updateMap.put("u_address", u_address);
		String statement = "com.bike.Mapper.UserMapper.updateUser";
		sqlSessionTemplate.update(statement,updateMap);
		
		String statement2 = "com.bike.Mapper.UserMapper.getUserByUuid";
		User user = sqlSessionTemplate.selectOne(statement2,u_uuid);
		return user;
	}

	public User updatePassword(int u_uuid, String u_password) {
		Map<String,Object> updateMap = new HashMap<String,Object>();
		updateMap.put("u_uuid", u_uuid);
		updateMap.put("u_password", u_password);
		String statement = "com.bike.Mapper.UserMapper.updatePassword";
		sqlSessionTemplate.update(statement,updateMap);
		
		String statement2 = "com.bike.Mapper.UserMapper.getUserByUuid";
		User user = sqlSessionTemplate.selectOne(statement2,u_uuid);
		return user;
	}

	public User getUserByEmail(String email) {
		String statement = "com.bike.Mapper.UserMapper.getUserByEmail";
		User user = sqlSessionTemplate.selectOne(statement,email);
		return user;
	}

	public void resetPassword(String email,String newPassword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("u_email", email);
		map.put("u_password", newPassword);
		String statement = "com.bike.Mapper.UserMapper.resetPassword";
		sqlSessionTemplate.update(statement,map);
	}

	public User checkMoney(int u_uuid, double money) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("u_uuid", u_uuid);
		map.put("money", money);
		String statement = "com.bike.Mapper.UserMapper.checkMoney";
		User user = sqlSessionTemplate.selectOne(statement,map);
		return user;
	}

	@Override
	public Deposit checkDeposit(int u_uuid) {
		String statement = "com.bike.Mapper.UserMapper.checkDeposit";
		Deposit deposit = sqlSessionTemplate.selectOne(statement,u_uuid);
		return deposit;
	}
	
}
