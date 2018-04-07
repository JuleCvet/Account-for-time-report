package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.Customer;

public interface CustomerService {

	void save(Customer customer);

	Customer findByCustomerName(String customerName);
	
	Customer findByCustomerId(Long customerId);

	public List<Customer> showAllCustomers();

	boolean updateCustomer(Customer customer);

	void deleteCustomer(Customer customer);
	
	boolean updateCustomerDel(Customer customer);
}
