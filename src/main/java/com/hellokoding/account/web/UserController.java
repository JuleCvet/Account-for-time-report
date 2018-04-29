package com.hellokoding.account.web;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hellokoding.account.model.User;
import com.hellokoding.account.service.SecurityService; 
import com.hellokoding.account.service.UserService;
import com.hellokoding.account.validator.UserValidator;

@Controller
//@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
/*
	@Autowired
	private UserRoleService userRoleService;*/
	
	/*@Autowired
	private ProjectService projectService;*/
	
	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);

		securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

		return "redirect:/welcome";
	}
	
// General interface that represents binding results. Extends the interface for error registration capabilities,
// allowing for a Validator to be applied, and adds binding-specific analysis and model building.

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcome(Model model) {
		
	/*	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails) principal).getUsername();
		User user = userService.findByUsername(username);
		
		ArrayList<Long> roleIDs = userRoleService.findAllByUserId(user.getId());
		
		boolean isAdmin =  false;
		for(Long r : roleIDs) {
			if (r == 2) {
				isAdmin =  true;
			}
		}

		model.addAttribute("showadmin", isAdmin);*/

		return "welcome";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = ("delete-user/{id}"), method = RequestMethod.GET)
	public String user_delete(Model model, @PathVariable Long id) {
		model.addAttribute("userDelete", userService.findByid(id));

		return "delete-user";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "delete-user/{id}", method = RequestMethod.POST)
	public String user_delete(@ModelAttribute("userDelete") User user, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "delete-user";
		}

		userService.updateUserDel(user);

		return "redirect:/viewUsers";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/viewUsers", method = RequestMethod.GET)
	public String viewUsers(Model model) {
	
		model.addAttribute("list", userService.showAllUsers());

		return "viewUsers";
	}
	
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update-user/{id}", method = RequestMethod.GET)
	public String update_user(Model model, @PathVariable Long id) {

		model.addAttribute("userUpdate", userService.findByid(id));
	
		return "update-user";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update-user/{id}", method = RequestMethod.POST)
	public String update_user(@ModelAttribute("userUpdate") User user, BindingResult bindingResult,
			Model model) {
		
		if (bindingResult.hasErrors()) {
			return "update-user";
		}

		userService.updateUser(user);

		return "redirect:/viewUsers";
	}
	
	// for 403 access denied page
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {

		ModelAndView model = new ModelAndView();

		if (user != null) {
			model.addObject("msg", "Hi " + user.getName() 
			+ ", you do not have permission to access this page!");
		} else {
			model.addObject("msg", 
			"You do not have permission to access this page!");
		}

		model.setViewName("accessDenied");
		return model;

	}
}
