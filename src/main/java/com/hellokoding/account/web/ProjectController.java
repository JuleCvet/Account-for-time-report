package com.hellokoding.account.web;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hellokoding.account.model.Customer;
import com.hellokoding.account.model.Project;
import com.hellokoding.account.model.ProjectTypeEnum;
import com.hellokoding.account.service.CustomerService;
import com.hellokoding.account.service.ProjectService;
import com.hellokoding.account.validator.ProjectValidator;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProjectValidator projectValidator;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/create-project", method = RequestMethod.GET)
	public String create_project(Model model) {
		
		model.addAttribute("customers", customerService.showAllCustomers());
		model.addAttribute("projectTypeEnums", ProjectTypeEnum.values());
		model.addAttribute("projectForm", new Project());

		return "create-project";
	}

	/*
	 * @PreAuthorize("hasRole('ROLE_USER')")
	 * 
	 * @RequestMapping(value = "/viewProjects", method = RequestMethod.GET) public
	 * String view_projects_user(Model model) {
	 * 
	 * UserDetails userDetails = (UserDetails)
	 * SecurityContextHolder.getContext().getAuthentication().getPrincipal(); User
	 * user = userService.findByUsername(userDetails.getUsername());
	 * 
	 * boolean admin = false; for (Role role : user.getRoles()) { admin |=
	 * role.getName().equals("admin"); }
	 * 
	 * 
	 * model.addAttribute("admin", false); model.addAttribute("list",
	 * projectService.showAllProjects());
	 * 
	 * return "viewProjects"; }
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/create-project", method = RequestMethod.POST)
	public String registration(@RequestParam("customerID")Integer customerID, @ModelAttribute("projectForm") Project projectForm, BindingResult bindingResult, Model model) {
		
		projectValidator.validate(projectForm, bindingResult);

		if (bindingResult.hasErrors()) {
			
			return "create-project";
		}

		projectService.save(projectForm);

		return "redirect:/project/viewProjects";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "delete-project/{id}", method = RequestMethod.GET)
	public String delete_project(Model model,  @PathVariable Long id) {
		
		model.addAttribute("delete", projectService.findByProjectId(id));
		//model.addAttribute("delete", new Project());
		
		return "delete-project";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "delete-project/{id}", method = RequestMethod.POST)
	public String delete_project(@ModelAttribute("delete") Project project, BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) {
			return "delete-project";
		}

		projectService.updateProjectDel(project);

		return "redirect:/project/viewProjects";
	}

	@RequestMapping(value = "/viewProjects", method = RequestMethod.GET)
	public String view_projects(Model model) {
		
		ArrayList<ProjectExtended> allProjects = new ArrayList<ProjectExtended>();
		
		for(Project projectExtended : projectService.showAllProjects()) {
			
			Long customerID = projectExtended.getCustomerID().longValue();
			Customer customer = customerService.findByCustomerId(customerID);
			
			ProjectExtended proExt = new ProjectExtended(projectExtended.getId(), projectExtended.getProjectName(),
					projectExtended.getDescription(), projectExtended.getDeleted(), projectExtended.getCustomerID(),
					projectExtended.getprojects_allprojects(), projectExtended.getType(), customer.getCustomerName());
			
			allProjects.add(proExt);
					
		}
		/*
		 * UserDetails userDetails = (UserDetails)
		 * SecurityContextHolder.getContext().getAuthentication().getPrincipal(); User
		 * user = userService.findByUsername(userDetails.getUsername());
		 * 
		 * boolean admin = false; for (Role role : user.getRoles()) { admin |=
		 * role.getName().equals("admin"); }
		 */
		//model.addAttribute("list", projectService.showAllProjects());
		model.addAttribute("list", allProjects);
		
		return "viewProjects";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update-project/{id}", method = RequestMethod.GET)
	public String update_project(Model model, @PathVariable Long id) {

		model.addAttribute("project", projectService.findByProjectId(id));
		model.addAttribute("customers", customerService.showAllCustomers());
		
		return "update-project";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update-project/{id}", method = RequestMethod.POST)
	public String update_project(@ModelAttribute("project") Project project, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "update-project";
		}

		projectService.updateProject(project);

		return "redirect:/project/viewProjects";
	}
	

	public class ProjectExtended {
		
		private Long id;
		private String projectName;
		private String description;
		private Integer deleted;
		private Integer customerID;

		private List<Project> projects_allprojects;

		@Enumerated(EnumType.STRING)
		private ProjectTypeEnum type;
		private String customerName;
		
		public ProjectExtended(Long id, String projectName, String description, Integer deleted, Integer customerID,
				List<Project> projects_allprojects, ProjectTypeEnum type, String customerName) {
			super();
			this.id = id;
			this.projectName = projectName;
			this.description = description;
			this.deleted = deleted;
			this.customerID = customerID;
			this.projects_allprojects = projects_allprojects;
			this.type = type;
			this.customerName = customerName;
		}
		public Long getId() {
			return id;
		}
		public String getProjectName() {
			return projectName;
		}
		public String getDescription() {
			return description;
		}
		public Integer getDeleted() {
			return deleted;
		}
		public Integer getCustomerID() {
			return customerID;
		}
		public List<Project> getProjects_allprojects() {
			return projects_allprojects;
		}
		public ProjectTypeEnum getType() {
			return type;
		}
		public String getCustomerName() {
			return customerName;
		}
		@Override
		public String toString() {
			return "ProjectExtended [id=" + id + ", projectName=" + projectName + ", description=" + description
					+ ", deleted=" + deleted + ", customerID=" + customerID + ", projects_allprojects="
					+ projects_allprojects + ", type=" + type + ", customerName=" + customerName + "]";
		}
	}
}
