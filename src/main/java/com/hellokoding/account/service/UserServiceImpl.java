package com.hellokoding.account.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hellokoding.account.model.User;
import com.hellokoding.account.repository.RoleRepository;
import com.hellokoding.account.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet<>(roleRepository.findAll()));
		userRepository.save(user);
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void deleteUser(User user) {
		System.out.printf("Trying to delete user ", user);
		userRepository.delete(user.getId());

	}

	@Override
	public List<User> showAllUsers() {
		List<User> allUsers = userRepository.findAll();

		return allUsers;

	}

	@Override
	public boolean updateUser(User user) {
		User oldUser = userRepository.findOne(user.getId());
		oldUser.setUsername(user.getUsername());
		
		userRepository.saveAndFlush(oldUser);
		
		return true;
	}

	@Override
	public boolean updateUserDel(User user) {
		
		User oldUser = userRepository.findOne(user.getId());
		oldUser.setDeleted(1);
		
		userRepository.saveAndFlush(oldUser);
		
		return true;
	}

/*	@Override
	public User findByIdUser(Long id) {
		User oldUser = userRepository.findByuserID(id);
		
		return oldUser;
	}*/
}
