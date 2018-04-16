package com.hellokoding.account.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hellokoding.account.model.Role;
import com.hellokoding.account.repository.roleRepository;

public class RoleServiceImpl implements RoleService{

	@Autowired
	private roleRepository roleRepository;
	
	@Override
	public Role findByid(Long id) {
		
		Role oldRole = roleRepository.findByid(id);
		
		return oldRole;
	}
}
