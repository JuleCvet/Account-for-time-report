package com.hellokoding.account.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.account.model.Report;

public interface ReportRepository extends JpaRepository<Report, Long> {
	public Report findByCompanyName(String projectName);

	public List<Report> findByuserID(Integer userID);
	
	Report findByIdReport(Long idReport);
}
