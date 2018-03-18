
package com.hellokoding.account.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hellokoding.account.model.Project;
import com.hellokoding.account.model.ProjectTypeEnum;
import com.hellokoding.account.service.ProjectService;
import com.hellokoding.account.service.UserService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@Autowired
	private UserService userService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/create-project", method = RequestMethod.GET)
	public String create_project(Model model) {
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

	@RequestMapping(value = "/create-project", method = RequestMethod.POST)
	public String create_project(@ModelAttribute("projectForm") Project projectForm, BindingResult bindingResult,
			Model model) {

		if (bindingResult.hasErrors()) {
			return "create-project";
		}

		projectService.save(projectForm);

		return "redirect:/welcome";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/delete-project", method = RequestMethod.GET)
	public String delete_project(Model model) {
		model.addAttribute("delete", new Project());

		return "delete-project";
	}

	@RequestMapping(value = "/delete-project", method = RequestMethod.POST)
	public String delete_project(@ModelAttribute("delete") Project project, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "delete-project";
		}

		projectService.updateProjectDel(project);

		return "redirect:/welcome";
	}

	@RequestMapping(value = "/viewProjects", method = RequestMethod.GET)
	public String view_projects(Model model) {
		/*
		 * UserDetails userDetails = (UserDetails)
		 * SecurityContextHolder.getContext().getAuthentication().getPrincipal(); User
		 * user = userService.findByUsername(userDetails.getUsername());
		 * 
		 * boolean admin = false; for (Role role : user.getRoles()) { admin |=
		 * role.getName().equals("admin"); }
		 */

		model.addAttribute("list", projectService.showAllProjects());

		return "viewProjects";
	}

	@RequestMapping(value = "/showOneProject", method = RequestMethod.GET)
	public String show_project(Model model) {

		// model.addAttribute("list", projectService.findByProjectName(projectname));

		return "showOneProject";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update-project", method = RequestMethod.GET)
	public String update_project(Model model) {
		model.addAttribute("projectUpdate", new Project());

		return "update-project";
	}

	@RequestMapping(value = "update-project", method = RequestMethod.POST)
	public String update_project(@ModelAttribute("projectUpdate") Project project, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "update-project";
		}

		projectService.updateProject(project);

		return "redirect:/welcome";
	}

}
