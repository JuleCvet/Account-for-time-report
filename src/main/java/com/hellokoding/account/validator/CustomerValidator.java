package com.hellokoding.account.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.hellokoding.account.model.Customer;

@Component
public class CustomerValidator implements Validator{

	@Override
	public boolean supports(Class<?> aClass) {
		return Customer.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Customer customer = (Customer) o;
		
		ValidationUtils.rejectIfEmpty(errors, "customerName", "NotEmpty");
		if(customer.getCustomerName().length() < 3 || customer.getCustomerName().length() > 32) {
			errors.rejectValue("customerName", "Size.customerForm.customerName");
		}
		
	}
	

	
	
	

}
