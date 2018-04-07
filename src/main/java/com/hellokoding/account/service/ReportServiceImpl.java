package com.hellokoding.account.service;

import java.util.Date;
import java.util.ArrayList;
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
		oldReport.setDeleted(report.getDeleted());
		
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

	@Override
	public List<Report> showReportsByUserIDAndDate(Integer userID, Date fromDate, Date toDate) {
		List<Report> allReports = reportRepository.findByuserID(userID);
		List<Report> allFilteredReports = new ArrayList<Report>();
		
		for(Report report : allReports) {
			Date reportDate = report.getForDate();
			if ((reportDate.after(fromDate) && reportDate.before(toDate)) || reportDate.equals(fromDate) || reportDate.equals(toDate)) {
				allFilteredReports.add(report);
			}
		}
		
		return allFilteredReports;
	}

	@Override
	public Double calculateHoursByUserIdAndDate(Integer userID, Date fromDate, Date toDate) {
		
		List<Report> allReports = reportRepository.findByuserID(userID);
		List<Report> allFilteredReports = new ArrayList<Report>();
		Double sum = 0.0;
		
		for(Report report : allReports) {
			Date reportDate =  report.getForDate();
			if(((reportDate.after(fromDate) && reportDate.before(toDate)) || reportDate.equals(fromDate) || reportDate.equals(toDate))) {
				allFilteredReports.add(report);
				sum += report.getHoursReported();
		}
	 }
	return sum;
  }

	@Override
	public Report findByIdReport(Long idReport) {
		Report oldReport = reportRepository.findByIdReport(idReport);
		
		return oldReport;
	}

	@Override
	public Report findByLocked(Boolean locked) {
		Report oldReport = reportRepository.findByLocked(locked);
		
		return oldReport;
	}

	@Override
	public Boolean updateReportLocked(Report report) {
		Report oldReport = reportRepository.findByIdReport(report.getIdReport());

		oldReport.setLocked(1);
			
		reportRepository.saveAndFlush(oldReport);
			
		return true;
	}

	




/*	@Override
	public List<Report> findAllLockedReportsByUserId(Long idReport) {
		
		List<Report> allReports = reportRepository.findAll();
		List<Report> allLockedReports = new ArrayList<Report>();
		
		for(Report lockedReport : allReports) {
			if(lockedReport.equals(reportRepository.findByIdReport(idReport))&&(reportRepository.)){
				allLockedReports.add(lockedReport);
			}	
		}
		
		return allLockedReports;
	}*/
}
