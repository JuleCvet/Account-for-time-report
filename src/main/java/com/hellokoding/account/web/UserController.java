package com.hellokoding.account.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hellokoding.account.model.User;
import com.hellokoding.account.service.SecurityService;
import com.hellokoding.account.service.UserService;
import com.hellokoding.account.validator.UserValidator;

@Controller
// @RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

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

		return "welcome";
	}

	// @PreAuthorize("HasRole('ROLE_ADMIN')")
	@RequestMapping(value = ("/delete-user"), method = RequestMethod.GET)
	public String user_delete(Model model) {
		model.addAttribute("userDelete", new User());

		return "delete-user";
	}

	@RequestMapping(value = "/delete-user", method = RequestMethod.POST)
	public String user_delete(@ModelAttribute("userDelete") User user, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "delete-user";
		}

		userService.updateUserDel(user);

		return "redirect:/welcome";
	}

	//@PreAuthorize("HasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/viewUsers", method = RequestMethod.GET)
	public String viewUsers(Model model) {
		model.addAttribute("list", userService.showAllUsers());

		return "viewUsers";
	}
}
