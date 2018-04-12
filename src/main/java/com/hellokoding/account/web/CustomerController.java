package com.hellokoding.account.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hellokoding.account.model.Customer;
import com.hellokoding.account.service.CustomerService;
import com.hellokoding.account.validator.CustomerValidator;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerValidator customerValidator;

	@Autowired
	private CustomerService customerService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/create-customer", method = RequestMethod.GET)
	public String createCustomer(Model model) {
		model.addAttribute("customerForm", new Customer());

		return "create-customer";
	}

	@RequestMapping(value = "/create-customer", method = RequestMethod.POST)
	public String createCustomer(@ModelAttribute("customerForm") Customer customerForm, BindingResult bindingResult,
			Model model) {

		customerValidator.validate(customerForm, bindingResult);
		
		if (bindingResult.hasErrors()) {
			return "create-customer";
		}

		customerService.save(customerForm);

		return "redirect:/welcome";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "delete-customer/{customerId}", method = RequestMethod.GET)
	public String delete_customer(Model model, @PathVariable Long customerId) {
		model.addAttribute("deleteCustomer", customerService.findByCustomerId(customerId));

		return "delete-customer";
	}

	@RequestMapping(value = "delete-customer/{customerId}", method = RequestMethod.POST)
	public String delete_customer(@ModelAttribute("deleteCustomer") Customer customer, BindingResult bindingResult,
			Model model) {
		
		if (bindingResult.hasErrors()) {
			return "delete-customer";
		}

		customerService.updateCustomerDel(customer);

		return "redirect:/welcome";
	}

	@RequestMapping(value = "/viewCustomers", method = RequestMethod.GET)
	public String view_customers(Model model) {

		model.addAttribute("list", customerService.showAllCustomers());

		return "viewCustomers";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update-customer/{customerId}", method = RequestMethod.GET)
	public String update_customer(Model model, @PathVariable Long customerId) {
		
		model.addAttribute("update", customerService.findByCustomerId(customerId));

		return "update-customer";
	}

	@RequestMapping(value = "update-customer/{customerId}", method = RequestMethod.POST)
	public String update_customer(@ModelAttribute("update") Customer customer, BindingResult bindingResult,
			Model model) {
		
		if (bindingResult.hasErrors()) {
			return "update-customer";
		}

		customerService.updateCustomer(customer);

		return "redirect:/welcome";
	}
}
