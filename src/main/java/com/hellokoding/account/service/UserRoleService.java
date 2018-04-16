package com.hellokoding.account.service;

import java.util.ArrayList;

public interface UserRoleService {
	
	public ArrayList<Long> findAllByUserId(Long id);
	
}
