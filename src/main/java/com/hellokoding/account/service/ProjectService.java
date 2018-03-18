package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.Project;

public interface ProjectService {

	void save(Project project);

	Project findByProjectName(String projectname);

	boolean updateProject(Project project);

	void deleteProject(Project project);
	
	boolean updateProjectDel(Project project);
	
	List<Project> showAllProjects();
}
