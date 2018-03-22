package com.hellokoding.account.service;

import java.util.Date;
import java.util.List;

import com.hellokoding.account.model.Report;

public interface ReportService {

	void save(Report report);

	Report findByReportName(String reportName);

	List<Report> showAllREports();

	Report findByIdReport (Long idReport);
	
	boolean updateReport(Report report);

	void deleteReport(Report report);

	boolean updateReportDel(Report report);

	List<Report> showReportsByUserID(Integer userID);
	
	List<Report> showReportsByUserIDAndDate(Integer userID, Date fromDate, Date toDate);

	Double calculateHoursByUserID(Integer userID);
	
	Double calculateHoursByUserIdAndDate(Integer userID, Date fromDate, Date toDate);
	
}
