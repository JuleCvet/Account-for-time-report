package com.hellokoding.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellokoding.account.model.Report;
import com.hellokoding.account.repository.ReportRepository;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportRepository reportRepository;

	@Override
	public void save(Report report) {
		reportRepository.saveAndFlush(report);

	}

	@Override
	public Report findByReportName(String companyName) {
		return reportRepository.findByCompanyName(companyName);

	}

	@Override
	public boolean updateReport(Report report) {
		Report oldReport = reportRepository.findOne(report.getIdReport());

		oldReport.setCompanyName(report.getCompanyName());
		oldReport.setHoursReported(report.getHoursReported());
		oldReport.setVab(report.getVab());
		oldReport.setVacation(report.getVacation());
		oldReport.setUserID(report.getUserID());
		oldReport.setForDate(report.getForDate());
		oldReport.setDateModified(report.getDateModified());
		
		reportRepository.saveAndFlush(oldReport);

		return true;
	}


	@Override
	public void deleteReport(Report report) {
		reportRepository.delete(report.getIdReport());

	}

	@Override
	public List<Report> showAllREports() {
		List<Report> allReports = reportRepository.findAll();
		return allReports;
	}

	@Override
	public List<Report> showReportsByUserID(Integer userID) {
		List<Report> allReports = reportRepository.findByuserID(userID);
		return allReports;
	}

	@Override
	public boolean updateReportDel(Report report) {
		Report oldReport = reportRepository.findOne(report.getIdReport());

		oldReport.setDeleted(1);
		
		reportRepository.saveAndFlush(oldReport);

		return true;
	}

	@Override
	public Double calculateHoursByUserID(Integer userID) {
		List<Report> allReports = reportRepository.findByuserID(userID);
		Double sum = 0.0;
		for (Report report : allReports) {
			sum += report.getHoursReported();
		}
		return sum;
	}
}
