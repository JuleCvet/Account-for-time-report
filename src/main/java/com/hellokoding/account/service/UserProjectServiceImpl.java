package com.hellokoding.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hellokoding.account.model.UserProject;
import com.hellokoding.account.repository.UserProjectRepository;

@Component
public class UserProjectServiceImpl implements UserProjectService{
	
	@Autowired
	private UserProjectRepository userProjectRepository;

	@Override
	public void saveUserProject(UserProject userProject) {
		userProjectRepository.saveAndFlush(userProject);
		
	}
	
	@Override
	public boolean updateUserProjectDelete(UserProject userProject) {
		UserProject newUserProject = userProjectRepository.findOne(userProject.getUserProjectID());
		
		newUserProject.setDeleted(1);
		userProjectRepository.saveAndFlush(newUserProject);
		
		return true;
	}
	
	@Override
	public List<UserProject> showAllUsersAndProjects() {
		List<UserProject> newList = userProjectRepository.findAll();
		
		return newList;
	}

	/*@Override
	public UserProject findByUserProjectId(Long userProjectID) {
		return userProjectRepository.findOne(userProjectID);
	}

	@Override
	public boolean updateUserProject(UserProject userProject) {
		UserProject newUserProject = userProjectRepository.findOne(userProject.getUserProjectID());
		
		newUserProject.setUserID(userProject.getUserID());
		newUserProject.setProjectID(userProject.getProjectID());
		userProjectRepository.saveAndFlush(newUserProject);
		
		return false;
	}
		

	@Override
	public void deleteUserProject(UserProject userProject) {
		userProjectRepository.delete(userProject.getUserProjectID());
	}*/
}
