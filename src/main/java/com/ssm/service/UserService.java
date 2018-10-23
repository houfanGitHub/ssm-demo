package com.ssm.service;

import java.util.List;

import com.ssm.pojo.Users;

public interface UserService {

	List<Users> findAll();
	
	void addUsers(Users users);
	
	void updateUsers(Users users);
	
	void deleteUsers(Integer uid);

	Users findOne(Integer uid);
}
