package com.hellokoding.account.service;

import java.util.List;

import com.hellokoding.account.model.Report;

public interface ReportService {

	void save(Report report);

	Report findByReportName(String reportName);

	List<Report> showAllREports();

	boolean updateReport(Report report);

	void deleteReport(Report report);

	boolean updateReportDel(Report report);
}
