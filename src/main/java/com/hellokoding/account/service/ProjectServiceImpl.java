package com.hellokoding.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellokoding.account.model.Project;
import com.hellokoding.account.repository.ProjectRepository;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectRepository projectRepository;

	@Override
	public void save(Project project){
		project.setDeleted(0);
		projectRepository.saveAndFlush(project);
	}

	@Override
	public Project findByProjectname(String projectName) {
		return projectRepository.findByProjectName(projectName);
	}

	@Override
	public void deleteProject(Project project) {
		System.out.printf("Trying to delete project ", project);
		projectRepository.delete(project.getId());

	}

	/*
	 * public List<Project> showAllProjects( { TypedQuery<Project> namedQuery =
	 * projectRepository.createNamedQuery("find_all_projects", Project.class);
	 * return namedQuery.getResultList(); }
	 */

	@Override
	public List<Project> showAllProjects() {
		List<Project> allProjects = projectRepository.findAll();

		return allProjects;
	}

	@Override
	public boolean updateProject(Project project) {
		Project oldProject = projectRepository.findOne(project.getId());
		oldProject.setProjectName(project.getProjectName());
		oldProject.setDescription(project.getDescription());
		oldProject.setType(project.getType());
		oldProject.setDeleted(project.getDeleted());
		oldProject.setCustomerID(project.getCustomerID());
		projectRepository.saveAndFlush(oldProject);

		return true;
	}

	@Override
	public boolean updateProjectDel(Project project) {
		Project oldProject = projectRepository.findOne(project.getId());
		
		oldProject.setDeleted(1);
		projectRepository.saveAndFlush(oldProject);
		
		return true;
	}

	@Override
	public Project findByProjectId(Long id) {
	Project oldProject = projectRepository.findByid(id);
		return oldProject;
	}
}
