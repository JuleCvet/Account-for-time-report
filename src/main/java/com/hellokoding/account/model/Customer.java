package com.hellokoding.account.model;

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
	private Long customerId;

	private String customerName;
	private Integer deleted;

	/*
	 * @OneToMany private Set<Project> projects;
	 */

	public Customer() {
	}

	public Long getcustomerId() {
		return customerId;
	}
	
	public void setcustomerId(Long customerId) {
		this.customerId = customerId;
	}
	
	/*
	 * public Set<Project> getProjects() { return projects; }
	 * 
	 * public void setProjects(Set<Project> projects) { this.projects = projects; }
	 */
	
	public String getCustomerName() {
		return (customerName!=null && customerName.length()>0) ? customerName : "N/A";
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Customer(String customerName, Integer deleted) {
		super();
		this.customerName = customerName;
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
		return "Customer [customerName=" + customerName + ", deleted=" + deleted + "]";
	}
}
