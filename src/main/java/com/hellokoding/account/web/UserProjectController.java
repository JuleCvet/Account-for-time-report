package com.hellokoding.account.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.hellokoding.account.model.Project;
import com.hellokoding.account.model.User;
import com.hellokoding.account.model.UserProject;
import com.hellokoding.account.repository.ProjectRepository;
import com.hellokoding.account.repository.UserRepository;
import com.hellokoding.account.service.ProjectService;
import com.hellokoding.account.service.UserProjectService;
import com.hellokoding.account.service.UserService;

@Controller
@RequestMapping("/userproject")
public class UserProjectController {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired 
	private UserProjectService userProjectService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@PreAuthorize(value="hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/create-userProject", method = RequestMethod.GET)
	public String create_userProject(Model model) {
		
		model.addAttribute("createUserProject", new UserProject());
		model.addAttribute("listUsers", userService.showAllUsers());
		model.addAttribute("listProjects", projectService.showAllProjects());

		return "create-userProject";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/create-userProject", method = RequestMethod.POST)
	public String create_userProject(@ModelAttribute ("createUserProject") UserProject userProject,BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			return "create-userProject";
		}
		
		userProjectService.saveUserProject(userProject);
		
		return "redirect:/userproject/viewAllUserProjects";
	}
	
	@PreAuthorize(value="hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "delete-userProject/{id}", method = RequestMethod.GET)
	public String delete_userProject(Model model, @PathVariable Long id) {
		
		UserProject userProject = userProjectService.findByUserProjectid(id);
		
		Long userID = userProject.getUserID();
		User user = userRepository.findByid(userID);
		
		Long projectID = userProject.getProjectID();
		Project project = projectRepository.findByid(projectID);
		
		model.addAttribute("deleteUserProject", userProjectService.findByUserProjectid(id));
		model.addAttribute("user", user);
		model.addAttribute("project", project);
		
		
		return "delete-userProject";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "delete-userProject/{id}", method = RequestMethod.POST)
	public String delete_userProject(@ModelAttribute("deleteUserProject") UserProject userProject, BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) {
			return "delete-userProject";
		}

		userProjectService.updateUserProjectDelete(userProject);

		return "redirect:/userproject/viewAllUserProjects";
	}
	
	@PreAuthorize(value="hasRole('ROLE_ADMIN')")
	@RequestMapping(value="update-userProject/{id}", method=RequestMethod.GET)
	public String update_userProject(Model model, @PathVariable Long id) {
		
		UserProject userProject = userProjectService.findByUserProjectid(id);
		
		Long userId = userProject.getUserID();
		User user = userRepository.findByid(userId);
		
		Long projectId = userProject.getProjectID();
		Project project = projectRepository.findByid(projectId);
		
		model.addAttribute("updateUserProject", userProjectService.findByUserProjectid(id));
		model.addAttribute("user",user);
		model.addAttribute("project", project);
		
		return "update-userProject";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="update-userProject/{id}", method=RequestMethod.POST)
	public String update_userProject(@ModelAttribute("updateUserProject")UserProject userProject, BindingResult bindingResult,
			Model model) {
		
		if(bindingResult.hasErrors()) {
			
			return "update-userProject";
		}
		userProjectService.updateUserProject(userProject);
		
		return "redirect:/userproject/viewAllUserProjects";
	}	
	
	@PreAuthorize(value="hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/viewAllUserProjects", method=RequestMethod.GET)
	public String showAllUsersAndProjects(Model model) {
		
	    List<userProjectExtended> result = new ArrayList <userProjectExtended>();
		
		for (UserProject userProject : userProjectService.showAllUsersAndProjects()) {
			
			Long userID = userProject.getUserID();
			User user = userRepository.findByid(userID);
			
			Long projectID = userProject.getProjectID();
			Project project = projectRepository.findByid(projectID);
			
			userProjectExtended up = new userProjectExtended(userProject.getId(), userProject.getUserID(), 
					userProject.getProjectID(), userProject.getDeleted(), user.getUsername(), project.getProjectName());
		
			result.add(up);
		}
		
		model.addAttribute("list", result);
		
		return "viewAllUserProjects";
	}

	public class userProjectExtended {
		Long id;
		Long userID;
		Long projectID;
		Integer deleted;
		String userName;
		String companyName;
		
		public userProjectExtended(Long id, Long userID, Long projectID, Integer deleted, String userName,
				String companyName) {
			super();
			this.id = id;
			this.userID = userID;
			this.projectID = projectID;
			this.deleted = deleted;
			this.userName = userName;
			this.companyName = companyName;
		}
		public Long getUserID() {
			return userID;
		}
		public void setUserID(Long userID) {
			this.userID = userID;
		}
		public Long getProjectID() {
			return projectID;
		}
		public void setProjectID(Long projectID) {
			this.projectID = projectID;
		}
		public Integer getDeleted() {
			return deleted;
		}
		public void setDeleted(Integer deleted) {
			this.deleted = deleted;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public Long getId() {
			return id;
		}
		
	}

}



