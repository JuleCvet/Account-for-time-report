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

import org.hibernate.annotations.Where;

@Entity
@Table(name = "project")
@Where(clause="deleted=0")
public class Project {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idProject")
	private Long id;

	private String projectName;
	private String description;
	private Integer deleted;

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

	public List<Project> getProjects_allprojects() {
		return projects_allprojects;
	}

	public void setProjects_allprojects(List<Project> projects_allprojects) {
		this.projects_allprojects = projects_allprojects;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

	public Project(String projectName, String description, Integer deleted,
			List<Project> projects_allprojects, ProjectTypeEnum type, Set<User> users, Set<Customer> customers) {
		super();
		this.projectName = projectName;
		this.description = description;
		this.deleted = deleted;
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
		return "Project [projectName=" + projectName + ", description=" + description + ", deleted=" + deleted
				+ ", projects_allprojects=" + projects_allprojects + ", type="
				+ type + ", users=" + users + ", customers=" + customers + "]";
	}
}
