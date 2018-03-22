package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.Project;
import com.hellokoding.account.model.Report;

public interface ProjectService {

	void save(Project project);

	Project findByProjectName(String projectname);
	
	Project findByProjectId (Long id);

	boolean updateProject(Project project);

	void deleteProject(Project project);
	
	boolean updateProjectDel(Project project);
	
	List<Project> showAllProjects();
}
