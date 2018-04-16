package com.hellokoding.account.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hellokoding.account.model.UserRole;


/*public class UserRoleServiceImpl implements UserRoleService{
	
	@Autowired
	private UserRoleRepository userRoleRepository;

	@Override
	public ArrayList<Long> findAllByUserId(Long id) {
		List<UserRole> allUsers = userRoleRepository.findAll();
		
		ArrayList<Long> roleIDs = new ArrayList<Long>();
		
		for (UserRole l : allUsers) {
			if (l.getRoleID() == id) {
				roleIDs.add(id);
			}
		}
		return roleIDs;
	}

}*/
