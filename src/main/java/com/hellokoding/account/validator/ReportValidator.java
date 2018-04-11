package com.hellokoding.account.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.hellokoding.account.model.Report;

@Component
public class ReportValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> aClass) {
		return Report.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Report report = (Report) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyName", "NotEmpty");
		if(report.getCompanyName().length() < 3 || report.getCompanyName().length() > 32) {
			errors.rejectValue("companyName", "Size.reportForm.companyName");
			
		ValidationUtils.rejectIfEmpty(errors, "hoursReported", "NotEmpty");
		if(report.getHoursReported().SIZE < 1 || report.getHoursReported().SIZE > 24) {
			errors.rejectValue("hoursReported", "Size.reportForm.hoursReported");
			
		ValidationUtils.rejectIfEmpty(errors, "forDate", "NotEmpty");
			
		
			}	
		}
	}
}
