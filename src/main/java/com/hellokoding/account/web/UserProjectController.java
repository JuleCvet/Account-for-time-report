package com.hellokoding.account.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hellokoding.account.model.UserProject;
import com.hellokoding.account.service.ProjectService;
import com.hellokoding.account.service.UserProjectService;
import com.hellokoding.account.service.UserService;


@Controller
@RequestMapping("/userproject")
public class UserProjectController {

	@Autowired 
	private UserProjectService userProjectService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProjectService projectService;
	
	//@PreAuthorize("hasRole=('ROLE_ADMIN')")
	@RequestMapping(value = "/create-userProject", method = RequestMethod.GET)
	public String create_userProject(Model model) {
		model.addAttribute("createUserProject", new UserProject());
		model.addAttribute("listUsers", userService.showAllUsers());
		model.addAttribute("listProjects", projectService.showAllProjects());

		return "create-userProject";
	}
	
	@RequestMapping(value = "/create-userProject", method = RequestMethod.POST)
	public String create_userProject(@ModelAttribute ("createUserProject") UserProject userProject,BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			return "create-userProject";
		}
		
		userProjectService.saveUserProject(userProject);
		
		return "redirect:/welcome";
	}
	
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/delete-userProject", method = RequestMethod.GET)
	public String delete_userProject(Model model) {
		model.addAttribute("deleteUserProject", new UserProject());

		return "delete-userProject";
	}
	
	@RequestMapping(value = "/delete-userProject", method = RequestMethod.POST)
	public String delete_userProject(@ModelAttribute("deleteUserProject") UserProject userProject, BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) {
			return "delete-userProject";
		}

		userProjectService.updateUserProjectDelete(userProject);

		return "redirect:/welcome";
	}
	
	@RequestMapping(value="/viewAllUserProjects", method=RequestMethod.GET)
	public String showAllUsersAndProjects(Model model) {
		
		model.addAttribute("list", userProjectService.showAllUsersAndProjects());
		
		return "viewAllUserProjects";
	}
	
}


/*import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hellokoding.account.model.Report;
import com.hellokoding.account.service.ReportService;
import com.hellokoding.account.service.UserProjectService;
import com.hellokoding.account.service.UserService;
	

	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		model.addAttribute("list", userService.showAllUsers());
		model.addAttribute("listProjects", projectService.showAllProjects());
		return "admin";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String admin(Model model, HttpServletRequest request) {
		String userID = request.getParameter("userSelection");
		String projectID = request.getParameter("projectSelection");
		
		if (bindingResult.hasErrors()) {
			return "admin";
		}

		reportService.save(reportForm);
		
		return "admin";
	}
}*/
