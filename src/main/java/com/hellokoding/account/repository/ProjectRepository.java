package com.hellokoding.account.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hellokoding.account.model.Project;
import com.hellokoding.account.model.Report;

public interface ProjectRepository extends JpaRepository<Project, Long> {
	Project findByProjectName(String projectName);
	
	Project findByid(Integer id);
}
