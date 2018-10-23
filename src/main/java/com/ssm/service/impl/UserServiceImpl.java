package com.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.UsersMapper;
import com.ssm.pojo.Users;
import com.ssm.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UsersMapper usersMapper;
	
	@Override
	public List<Users> findAll() {
		List<Users> list = usersMapper.findAll();
		return list;
	}

	@Override
	public void addUsers(Users users) {
		users.setLocked(0);
		users.setCreatedate(new Date());
		users.setLastlogindate(null);
		usersMapper.insert(users);
	}

	@Override
	public void updateUsers(Users users) {
		usersMapper.updateByPrimaryKeySelective(users);
	}

	@Override
	public void deleteUsers(Integer uid) {
		usersMapper.deleteByPrimaryKey(uid);
	}

	@Override
	public Users findOne(Integer uid) {
		Users users = usersMapper.selectByPrimaryKey(uid);
		return users;
	}

}
