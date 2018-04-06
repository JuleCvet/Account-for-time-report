package com.hellokoding.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.account.model.UserProject;

public interface UserProjectRepository extends JpaRepository<UserProject, Long>{
	UserProject findByid(Long id);
}
