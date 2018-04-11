package com.hellokoding.account.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Where;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "report")
//@Where(clause="deleted=0")
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idReport")
	private Long idReport;
	
	private String companyName;
	private Double hoursReported;
	private Double vab;
	private Double vacation;
	private Integer userID;
	
	@Column(name = "locked")
	private Integer locked;
	
	@Column(name = "deleted")
	private Integer deleted;
	
	
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date forDate;

	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date dateModified;
	
	@ManyToMany(mappedBy = "reports")
	private Set<User> users;

//	@ManyToMany(mappedBy="reports")
//	private Set<Project> projects;

	public Report() {
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

	public Report(String companyName, Double hoursReported, Double vab, Double vacation, Integer userID,
			Integer locked, Integer deleted, Date forDate, Date dateModified, Set<User> users) {
		super();
		this.companyName = companyName;
		this.hoursReported = hoursReported;
		this.vab = vab;
		this.vacation = vacation;
		this.userID = userID;
		this.locked = locked;
		this.deleted = deleted;
		this.forDate = forDate;
		this.dateModified = dateModified;
		this.users = users;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Long getIdReport() {
		return idReport;
	}

	public void setIdReport(Long idReport) {
		this.idReport = idReport;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

/*	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}*/

	public Double getHoursReported() {
		return hoursReported;
	}

	public void setHoursReported(Double hoursReported) {
		this.hoursReported = hoursReported;
	}

	public Date getForDate() {
		return forDate;
	}

	public void setForDate(Date forDate) {
		this.forDate = forDate;
	}

	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;

	}

	public Double getVab() {
		return vab;
	}

	public void setVab(Double vab) {
		this.vab = vab;
	}

	public Double getVacation() {
		return vacation;
	}

	public void setVacation(Double vacation) {
		this.vacation = vacation;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idReport == null) ? 0 : idReport.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Report other = (Report) obj;
		if (idReport == null) {
			if (other.idReport != null)
				return false;
		} else if (!idReport.equals(other.idReport))
			return false;
		return true;
	}

	public Integer getLocked() {
		return locked;
	}

	public void setLocked(Integer locked) {
		this.locked = locked;
	}

	@Override
	public String toString() {
		return "Report [companyName=" + companyName + ", hoursReported=" + hoursReported + ", vab=" + vab
				+ ", vacation=" + vacation + ", userID=" + userID + ", locked=" + locked + ", deleted=" + deleted
				+ ", forDate=" + forDate + ", dateModified=" + dateModified + ", users=" + users + "]";
	}
}
