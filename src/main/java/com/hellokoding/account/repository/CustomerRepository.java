package com.hellokoding.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.account.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
	Customer findByCompanyName(String companyName);

}
