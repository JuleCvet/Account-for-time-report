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

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "report")
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idReport")
	private Long idReport;
	
	private String companyName;
	private double hoursReported;
	private Integer vab;
	private Integer vacation;
	private Integer totalHoursPerDay;
	private Integer expectedHours;
	private boolean locked;
	private Integer userID;

	@DateTimeFormat(pattern = "mm/DD/yyyy")
	private Date forDate;

	@DateTimeFormat(pattern = "mm/DD/yyyy")
	private Date dateModified;

	@ManyToMany(mappedBy = "reports")
	private Set<User> users;

	@ManyToMany
	private Set<Project> projects;

	/*
	 * @OneToMany(mappedBy = " ") private List<DateTimeOfReport>
	 * listOfDateTimeOfReport = new ArrayList<>();
	 */

	public Report() {
	}

	public Report(String companyName, double hoursReported, Integer vab, Integer vacation, Integer totalHoursPerDay,
			Integer expectedHours, boolean locked, Integer userID, Date forDate, Date dateModified,
			Set<User> users, Set<Project> projects) {
		super();
		this.companyName = companyName;
		this.hoursReported = hoursReported;
		this.vab = vab;
		this.vacation = vacation;
		this.totalHoursPerDay = totalHoursPerDay;
		this.expectedHours = expectedHours;
		this.locked = locked;
		this.userID = userID;
		this.forDate = forDate;
		this.dateModified = dateModified;
		this.users = users;
		this.projects = projects;
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

	public boolean getLocked() {
		return locked;
	}

	public void setLocked(boolean locked) {
		this.locked = locked;
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

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	public double getHoursReported() {
		return hoursReported;
	}

	public void setHoursReported(double hoursReported) {
		this.hoursReported = hoursReported;
	}

	public Date getForDate() {
		return forDate;
	}

	public void setForDate(Date forDate) {
		this.forDate = forDate;
	}

	public boolean getIsLocked() {
		return locked;
	}

	public void setIsLocked(boolean locked) {
		this.locked = locked;
	}

	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;

	}

	public Integer getVab() {
		return vab;
	}

	public void setVab(Integer vab) {
		this.vab = vab;
	}

	public Integer getVacation() {
		return vacation;
	}

	public void setVacation(Integer vacation) {
		this.vacation = vacation;
	}

	public Integer getTotalHoursPerDay() {
		return totalHoursPerDay;

	}

	public void setTotalHoursPerDay(Integer totalHoursPerDay) {
		this.totalHoursPerDay = totalHoursPerDay;

	}

	public Integer getExpectedHours() {
		return 40;
	}

	public void setExpectedHours(Integer expectedHours) {
		this.expectedHours = expectedHours;
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



	@Override
	public String toString() {
		return "Report [idReport=" + idReport + ", companyName=" + companyName + ", hoursReported=" + hoursReported
				+ ", vab=" + vab + ", vacation=" + vacation + ", totalHoursPerDay=" + totalHoursPerDay
				+ ", expectedHours=" + expectedHours + ", locked=" + locked + ", userID=" + userID
				+ ", forDate=" + forDate + ", dateModified=" + dateModified + ", users=" + users + ", projects="
				+ projects + "]";
	}

}
