package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.User;

public interface UserService {

	void save(User user);

	User findByUsername(String username);

	void deleteUser(User user);

	List<User> showAllUsers();
	
	boolean updateUser(User user);
	
	boolean updateUserDel(User user);

}
