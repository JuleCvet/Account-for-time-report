package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.UserProject;

public interface UserProjectService {
	
	void saveUserProject(UserProject userProject);
	
	boolean updateUserProjectDelete(UserProject userProject);
	
	public List<UserProject> showAllUsersAndProjects();
	
	UserProject findByUserProjectid(Long id);
	
	boolean updateUserProject(UserProject userProject);
	

}

