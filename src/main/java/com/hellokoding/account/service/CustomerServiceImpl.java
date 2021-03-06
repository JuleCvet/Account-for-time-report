package com.hellokoding.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellokoding.account.model.Customer;
import com.hellokoding.account.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public void save(Customer customer) {
		customerRepository.saveAndFlush(customer);
	}

	@Override
	public Customer findByCustomerName(String customerName) {
		return customerRepository.findByCustomerName(customerName);
	}

	@Override
	public List<Customer> showAllCustomers() {
		List<Customer> allCustomers = customerRepository.findAll();

		return allCustomers;
	}

	@Override
	public boolean updateCustomer(Customer customer) {
		Customer oldCustomer = customerRepository.findOne(customer.getcustomerId());
		
		oldCustomer.setCustomerName(customer.getCustomerName());
		oldCustomer.setDeleted(customer.getDeleted());
		
		customerRepository.saveAndFlush(oldCustomer);

		return true;
	}

	@Override
	public void deleteCustomer(Customer customer) {
		customerRepository.delete(customer.getcustomerId());
	}

	@Override
	public boolean updateCustomerDel(Customer customer) {
		Customer oldCustomer = customerRepository.findOne(customer.getcustomerId());
		oldCustomer.setDeleted(1);
		
		customerRepository.saveAndFlush(oldCustomer);
		return true;
	}

	@Override
	public Customer findByCustomerId(Long customerId) {
		Customer oldCustomer = customerRepository.findByCustomerId(customerId);
		 
		return oldCustomer;
	}
}
