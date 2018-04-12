package com.hellokoding.account.validator;

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


	@Override
	public void validate(Object o, Errors errors) {
		
		Project project = (Project) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "projectName", "NotEmpty");
		if(project.getProjectName().length() < 6 || project.getProjectName().length() > 32) {
			errors.reject("projectName", "Size.projectForm.projectName");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty");
		if(project.getDescription().length() < 6  || project.getDescription().length() > 32) {
			errors.reject("description", "Size.projectForm.description");
		}	
	/*	if(projectService.findByProjectname(project.getProjectName() != null)) {
			errors.rejectValue("projectName", "Duplicate.projectForm.projectName");
			}*/
		}
	}
}
