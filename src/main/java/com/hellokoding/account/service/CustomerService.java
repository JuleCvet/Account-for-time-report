package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.Customer;

public interface CustomerService {

	void save(Customer customer);

	Customer findByCompanyName(String companyName);

	public List<Customer> showAllCustomers();

	boolean updateCustomer(Customer customer);

	void deleteCustomer(Customer customer);
}
