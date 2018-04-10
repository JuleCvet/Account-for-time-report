package com.hellokoding.account.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user")
//@Where(clause=("deleted=0"))
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	private String username;
	private String password;
	private Integer deleted;

	@Transient
	private String passwordConfirm;

	@ManyToMany
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles;

	@ManyToMany
	@JoinTable(name = "user_project", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "project_id"))
	private Set<Project> projects;

	@ManyToMany
	@JoinTable(name = "user_report", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "report_id"))
	private Set<Report> reports;

	public User() {
	}


	public User(String username, String password, Integer deleted, String passwordConfirm, Set<Role> roles,
			Set<Project> projects, Set<Report> reports) {
		super();
		this.username = username;
		this.password = password;
		this.deleted = deleted;
		this.passwordConfirm = passwordConfirm;
		this.roles = roles;
		this.projects = projects;
		this.reports = reports;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Report> getReports() {
		return reports;
	}

	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}

	public Integer getDeleted() {
		return deleted;
	}


	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}


	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", deleted=" + deleted + ", passwordConfirm="
				+ passwordConfirm + ", roles=" + roles + ", projects=" + projects + ", reports=" + reports + "]";
	}
}
