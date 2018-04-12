package com.hellokoding.account.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.hellokoding.account.model.Customer;

@Component
public class CustomerValidator implements Validator{

	public boolean checkChars(String s) {
		Pattern p = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(s);
		boolean b = m.find();
		if(b) {
			return true;
				}
				return false;
			}
	
	@Override
	public boolean supports(Class<?> aClass) {
		return Customer.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Customer customer = (Customer) o;
		
		ValidationUtils.rejectIfEmpty(errors, "customerName", "NotEmpty");
		
		if(checkChars(customer.getCustomerName())) {
			errors.rejectValue("customerName", "Chars.customerForm.customerName");
			
		}
		
		if(customer.getCustomerName().length() < 3 || customer.getCustomerName().length() > 32) {
			errors.rejectValue("customerName", "Size.customerForm.customerName");
		}
		
	}
	

	
	
	

}
