package com.hellokoding.account.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.transaction.interceptor.MatchAlwaysTransactionAttributeSource;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.hellokoding.account.model.Report;

@Component
public class ReportValidator implements Validator{
	
	public boolean checkChars(String s) {
		Pattern p = Pattern.compile( "[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(s);
		boolean b = m.find();
		if(b) {
			return true;
				}
				return false;
				}

	@Override
	public boolean supports(Class<?> aClass) {
		return Report.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		Report report = (Report) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyName", "NotEmpty");	
		if(checkChars(report.getCompanyName())) {
			errors.rejectValue("companyName", "Chars.reportForm.companyName");
		}
		
		if(report.getCompanyName().length() < 3 || report.getCompanyName().length() > 32) {
			errors.rejectValue("companyName", "Size.reportForm.companyName");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "forDate", "NotEmpty");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hoursReported", "NotEmpty");
		if (report.getHoursReported() != null) {
			if(report.getHoursReported().doubleValue() < 1.0 || report.getHoursReported().doubleValue() > 24.0) {
				errors.rejectValue("hoursReported", "Size.reportForm.hoursReported");
			}
		}
	}
}
