package com.hellokoding.account.model;

import java.util.Date;

/*@Entity
@Table(name = "DateTimeOfReport")*/
public class DateTimeOfReport {

	/*
	 * @Id
	 * 
	 * @GeneratedValue(strategy = GenerationType.AUTO)
	 */
	private int id_date;

	// @DateTimeFormat(pattern = "mm/DD/yyyy")
	private Date dayOfReport;

	private Double hoursPerDay;

	// @ManyToOne
	private Report report;

	public DateTimeOfReport() {
	}

	public DateTimeOfReport(Date dayOfReport, Double hoursPerDay) {
		super();
		this.dayOfReport = dayOfReport;
		this.hoursPerDay = hoursPerDay;
	}

	public Date getDayOfReport() {
		return dayOfReport;
	}

	public void setDayOfReport(Date dayOfReport) {
		this.dayOfReport = dayOfReport;
	}

	public Double getHoursPerDay() {
		return hoursPerDay;
	}

	public void setHoursPerDay(Double hoursPerDay) {
		this.hoursPerDay = hoursPerDay;
	}

	public int getId_date() {
		return id_date;
	}

}
