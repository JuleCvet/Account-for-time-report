package com.hellokoding.account.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long customer_id;

	private String companyName;

	/*
	 * @OneToMany private Set<Project> projects;
	 */

	public Customer() {
	}

	public Long getCustomer_id() {
		return customer_id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/*
	 * public Set<Project> getProjects() { return projects; }
	 * 
	 * public void setProjects(Set<Project> projects) { this.projects = projects; }
	 */

	public Customer(String companyName, Set<Project> projects) {
		super();
		this.companyName = companyName;
		/* this.projects = projects; */
	}

	@Override
	public String toString() {
		return String.format("Customer [customer_id=%s, companyName=%s]", customer_id, companyName);
	}

}
