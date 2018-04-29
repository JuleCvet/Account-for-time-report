package com.hellokoding.account.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.account.model.Report;
import com.hellokoding.account.model.UserProject;

public interface ReportRepository extends JpaRepository<Report, Long> {
	
	public Report findByCompanyName(String projectName);

	public List<Report> findByuserID(Integer userID);
	
	//public List<Report> findAllLockedReportsByUserId();
	public Report findByLocked(Boolean locked);
	
	Report findByIdReport(Long idReport);
}
