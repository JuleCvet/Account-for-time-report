package com.hellokoding.account.model;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "project")
public class Project {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	private String projectName;
	private String description;

	@Transient
	private List<Project> projects_allprojects;

	@Enumerated(EnumType.STRING)
	private ProjectTypeEnum type;

	@ManyToMany(mappedBy = "projects")
	private Set<User> users;

	@ManyToMany
	@JoinTable(name = "project_customer", joinColumns = @JoinColumn(name = "customer_id"), inverseJoinColumns = @JoinColumn(name = "project_id"))
	private Set<Customer> customers;

	public Project() {
	}

	public Set<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}

	public Long getId() {
		return id;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Project(String projectName, String description, List<Project> projects_allprojects, ProjectTypeEnum type,
			Set<User> users, Set<Customer> customers) {
		super();
		this.projectName = projectName;
		this.description = description;
		this.projects_allprojects = projects_allprojects;
		this.type = type;
		this.users = users;
		this.customers = customers;
	}

	public List<Project> getprojects_allprojects() {
		return projects_allprojects;
	}

	public void setprojects_allprojects(List<Project> projects_allprojects) {
		this.projects_allprojects = projects_allprojects;
	}

	public ProjectTypeEnum getType() {
		return type;
	}

	public void setType(ProjectTypeEnum type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return String.format("Project [id=%s, projectName=%s, description=%s, type=%s, users=%s, customers=%s]", id,
				projectName, description, type, users, customers);
	}

}
