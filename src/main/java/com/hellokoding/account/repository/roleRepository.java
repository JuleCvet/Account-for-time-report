package com.hellokoding.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.account.model.Role;

public interface roleRepository extends JpaRepository<Role, Long>{
	Role findByid(Long id);
}
