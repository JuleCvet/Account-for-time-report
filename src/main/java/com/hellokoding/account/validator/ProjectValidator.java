package com.hellokoding.account.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.hellokoding.account.model.Project;
import com.hellokoding.account.service.ProjectService;
 
@Component
public class ProjectValidator implements Validator {
	
	@Autowired
	private ProjectService projectService;

	@Override
	public boolean supports(Class<?> aClass) {
		return Project.class.equals(aClass);
	}
	
	public boolean checkChars(String s) {
		Pattern p = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(s);
		boolean b = m.find();
		if (b) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		Project project = (Project) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "projectName", "NotEmpty");
		if(project.getProjectName().length() < 6 || project.getProjectName().length() > 32) {
			errors.rejectValue("projectName", "Size.projectForm.projectName");
		
		if(checkChars(project.getProjectName())) {
			errors.rejectValue("projectName", "Chars.projectForm.projectName");
		}	
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty");
		if(project.getDescription().length() < 6  || project.getDescription().length() > 32) {
			errors.rejectValue("description", "Size.projectForm.description");
		}
		if (checkChars(project.getDescription())) {
			errors.rejectValue("description", "Chars.projectForm.description");
		}
	/*	if(projectService.findByProjectname(project.getProjectName() != null)) {
			errors.rejectValue("projectName", "Duplicate.projectForm.projectName");
			}*/
		}
	}
}
