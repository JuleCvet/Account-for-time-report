package com.hellokoding.account.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

@Entity
@Table(name = "customer")
@Where(clause="deleted=0")
public class Customer {

	public void setCustomer_id(Long customer_id) {
		this.customer_id = customer_id;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long customer_id;

	private String companyName;
	private Integer deleted;

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


	public Customer(String companyName, Integer deleted) {
		super();
		this.companyName = companyName;
		this.deleted = deleted;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

	@Override
	public String toString() {
		return "Customer [companyName=" + companyName + ", deleted=" + deleted + "]";
	}

}
