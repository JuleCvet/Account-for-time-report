package com.hellokoding.account.web;

import java.sql.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hellokoding.account.model.Report;
import com.hellokoding.account.service.ReportService;
import com.hellokoding.account.service.UserService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/create-report", method = RequestMethod.GET)
	public String create_report(Model model) {
		model.addAttribute("reportForm", new Report());
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
		String username = ((UserDetails)principal).getUsername();
		model.addAttribute("username", userService.findByUsername(username));
		}
		
		return "create-report";
	}

	@RequestMapping(value = "/create-report", method = RequestMethod.POST)
	public String create_report(@ModelAttribute("reportForm") Report reportForm, BindingResult bindingResult,
			Model model) {

		if (bindingResult.hasErrors()) {
			return "create-report";
		}

		reportService.save(reportForm);

		return "redirect:/welcome";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/delete-report", method = RequestMethod.GET)
	public String delete_report(Model model) {
		model.addAttribute("updateReportDel", new Report());

		return "delete-report";
	}

	@RequestMapping(value = "/delete-report", method = RequestMethod.POST)
	public String delete_report(@ModelAttribute("updateReportDel") Report report, BindingResult bindingResult,
			Model model) {
		
		if (bindingResult.hasErrors()) {
			return "delete-report";
		}

		reportService.updateReportDel(report);

		return "redirect:/welcome";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/viewReports", method = RequestMethod.GET)
	public String view_reports(Model model) {
		model.addAttribute("list", reportService.showAllREports());

		return "viewReports";
	}
	
	@RequestMapping(value = "/allMyReports", method = RequestMethod.GET)
	public String view_myreports(Model model) throws ParseException {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			
			Integer userI = Integer.valueOf(userService.findByUsername(username).getId().intValue());
			
			java.util.Date toDate1 = Calendar.getInstance().getTime();
	        
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(toDate1);
	        cal.add(Calendar.DATE, -30);
	        java.util.Date fromDate1 = cal.getTime();
	        
	        java.sql.Date fromDate = new java.sql.Date(fromDate1.getTime());
	        java.sql.Date toDate = new java.sql.Date(toDate1.getTime());
	        
			// model.addAttribute("list", reportService.showReportsByUserID(userI));
			model.addAttribute("list", reportService.showReportsByUserIDAndDate(userI, fromDate, toDate));
			model.addAttribute("totalHours", reportService.calculateHoursByUserID(userI));
			
		}
		return "allMyReports";
	}
	
	@RequestMapping(value = "/allMyReports", method = RequestMethod.POST)
	public String allMyReports(HttpServletRequest request) {
        // this way you get value of the input you want
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");

		return "redirect:/report/allMyReports";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update-report", method = RequestMethod.GET)
	public String update_report(Model model) {
		model.addAttribute("reportUpdate", new Report());

		return "update-report";
	}

	@RequestMapping(value = "update-report", method = RequestMethod.POST)
	public String update_report(@ModelAttribute("reportUpdate") Report report, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "update-report";
		}

		reportService.updateReport(report);
		return "redirect:/welcome";
	}
}