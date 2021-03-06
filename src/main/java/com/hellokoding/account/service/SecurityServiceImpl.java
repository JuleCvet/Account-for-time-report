package com.hellokoding.account.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class SecurityServiceImpl implements SecurityService {

	@Autowired
	private AuthenticationManager authenticationManager;//interface, processes an Authentication request

	@Autowired
	private UserDetailsService userDetailsService;

	private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);

//public final utility class producing Loggers for various logging
// APIs(log4j/logback/JDK)extends Object, all methods are static
	@Override
	public String findLoggedInUsername() {
		Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
		if (userDetails instanceof UserDetails) {
			return ((UserDetails) userDetails).getUsername();
		}

		return null;
	}

	@Override
	public void autologin(String username, String password) {
		UserDetails userDetails = userDetailsService.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
				userDetails, password, userDetails.getAuthorities());

		authenticationManager.authenticate(usernamePasswordAuthenticationToken);

		if (usernamePasswordAuthenticationToken.isAuthenticated()) {
			SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
			logger.debug(String.format("Auto login %s successfully!", username));
		}
	}
	
	@Override
	public void configure(HttpSecurity http) throws Exception {

	    http.authorizeRequests().antMatchers("/").permitAll()
	            .antMatchers("/register").permitAll()
	            .antMatchers("/security/checkpoint/for/admin/**").hasRole("ADMIN")
	            .antMatchers("/rest/users/**").hasRole("ADMIN").anyRequest()
	            .authenticated().and().formLogin().loginPage("/")
	            .defaultSuccessUrl("/welcome").permitAll().and().logout()
	            .logoutUrl("/logout").and()
	            .exceptionHandling().accessDeniedPage("/accessDenied");
	}
}
