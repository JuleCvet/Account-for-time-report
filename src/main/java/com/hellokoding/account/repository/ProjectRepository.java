package com.hellokoding.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.account.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Long> {
	Project findByProjectName(String projectName);
}
