package com.hellokoding.account.service;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;

public interface SecurityService {

	String findLoggedInUsername();
	
	void autologin(String username, String password);
	
	void configure(HttpSecurity http) throws Exception;
}
