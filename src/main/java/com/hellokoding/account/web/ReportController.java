package com.hellokoding.account.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.hellokoding.account.model.Report;
import com.hellokoding.account.model.User;
import com.hellokoding.account.repository.ReportRepository;
import com.hellokoding.account.service.ReportService;
import com.hellokoding.account.service.UserService;
import com.hellokoding.account.validator.ReportValidator;
import com.hellokoding.account.web.UserProjectController.userProjectExtended;

import antlr.collections.List;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportValidator reportValidator;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private UserService userRepository;

	public boolean isValidDate(String inputStringDate){
	    return inputStringDate.matches("^(0?[1-9]|1[0-2])\\/(0?[1-9]|1\\d|2\\d|3[01])\\/(19|20)\\d{2}$");
	}
	
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
	public String create_report(@RequestParam("hoursReported")String hoursReported, @ModelAttribute("reportForm") Report reportForm, BindingResult bindingResult, Model model) {

		reportValidator.validate(reportForm, bindingResult);
		
		if (bindingResult.hasErrors()) {
			return "create-report";
		}

		reportService.save(reportForm);

		return "redirect:/report/allMyReports";
	}


	@RequestMapping(value = "delete-report/{idReport}", method = RequestMethod.GET)
	public String delete_report(Model model, @PathVariable Long idReport) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			User user = userService.findByUsername(username);
			Long loggedInUserID = user.getId();
		
			Report oldReport = reportService.findByIdReport(idReport);
			Long userID = oldReport.getUserID().longValue();
			
			if (userID != loggedInUserID) {
				return "You don't own this report";
			}
			
		}
		
		model.addAttribute("updateReportDel", reportService.findByIdReport(idReport));
		
		return "delete-report";
	}

	@RequestMapping(value = "delete-report/{idReport}", method = RequestMethod.POST)
	public String delete_report(@ModelAttribute("updateReportDel") Report report, BindingResult bindingResult,
			Model model) {
		
		Report oldReport = reportService.findByIdReport(report.getIdReport());
		
		if (oldReport.getLocked() == 1) {
			return "Error: report is locked!";
		}
		
		if (bindingResult.hasErrors()) {
			return "delete-report";
		}

		reportService.updateReportDel(report);

		return "redirect:/report/allMyReports";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "locked-report/{idReport}", method = RequestMethod.GET)
	public String locked_report(Model model, @PathVariable Long idReport) {
		
		model.addAttribute("updateReportLocked", reportService.findByIdReport(idReport));

		return "locked-report";
	}
	
	@RequestMapping(value = "locked-report/{idReport}", method = RequestMethod.POST)
	public String locked_report(@ModelAttribute ("updateReportLocked")Report report, BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			return "locked-report";
		}
		
		reportService.updateReportLocked(report);
		
		return "redirect:/report/allMyReports";
	}
	
	
	@RequestMapping(value = "/viewReports", method = RequestMethod.GET)
	public String view_reports(Model model) {
		
		ArrayList<ReportExtended> allReportWithID = new ArrayList<ReportExtended>();
	
		for(Report reportExtended : reportService.showAllREports()) {
			
			Long userID = reportExtended.getUserID().longValue();
			User user = userRepository.findByid(userID);
			
			ReportExtended re = new ReportExtended( reportExtended.getIdReport(), user.getUsername(), reportExtended.getCompanyName(),
			reportExtended.getHoursReported(), reportExtended.getVab(), reportExtended.getVacation(), reportExtended.getUserID(), 
			reportExtended.getLocked(), reportExtended.getDeleted(), reportExtended.getForDate(), reportExtended.getDateModified());
			
			allReportWithID.add(re);
		}
		model.addAttribute("list", allReportWithID);
		
		return "viewReports";
	}
	
	
	@RequestMapping(value = "/allMyReports", method = RequestMethod.GET)
	public String view_myreports(Model model) throws ParseException {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			
			Integer userI = Integer.valueOf(userService.findByUsername(username).getId().intValue());
			
			java.util.Date toDate1 = Calendar.getInstance().getTime();
			
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			String showToDate= sdf.format(toDate1);
	        
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(toDate1);
	        cal.add(Calendar.DATE, -30);
	        java.util.Date fromDate1 = cal.getTime();
	        
	        String showFromDate= sdf.format(fromDate1);
	        
	        //java.sql.Date fromDate = new java.sql.Date(fromDate1.getTime());
	        //java.sql.Date toDate = new java.sql.Date(toDate1.getTime());
			model.addAttribute("list", reportService.showReportsByUserIDAndDate(userI, fromDate1, toDate1));
			model.addAttribute("totalHours", reportService.calculateHoursByUserIdAndDate(userI, fromDate1, toDate1));
			model.addAttribute("fromDate", showFromDate);
			model.addAttribute("toDate", showToDate);
		}
		return "allMyReports";
	}
	
	@RequestMapping(value = "/allMyReports", method = RequestMethod.POST)
	public String allMyReports(Model model, HttpServletRequest request) throws ParseException {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			
			Integer userI = Integer.valueOf(userService.findByUsername(username).getId().intValue());
			
			// Input data
			String fromDateReceived = request.getParameter("fromDate");
			String toDateReceived = request.getParameter("toDate");
			
			if (isValidDate(fromDateReceived) && isValidDate(toDateReceived)) {

				DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

				java.util.Date toDate1 = dateFormat.parse(toDateReceived);
				java.util.Date fromDate1 = dateFormat.parse(fromDateReceived);
		        //java.sql.Date fromDate = new java.sql.Date(fromDate1.getTime());
		        //java.sql.Date toDate = new java.sql.Date(toDate1.getTime());
		        
				model.addAttribute("list", reportService.showReportsByUserIDAndDate(userI, fromDate1, toDate1));
				model.addAttribute("totalHours", reportService.calculateHoursByUserIdAndDate(userI, fromDate1, toDate1));
				model.addAttribute("fromDate", fromDateReceived);
				model.addAttribute("toDate", toDateReceived);
				
			} else {
				
				java.util.Date toDate1 = Calendar.getInstance().getTime();
				
				SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				String showToDate= sdf.format(toDate1);
		        
		        Calendar cal = Calendar.getInstance();
		        cal.setTime(toDate1);
		        cal.add(Calendar.DATE, -30);
		        java.util.Date fromDate1 = cal.getTime();
		        
		        String showFromDate= sdf.format(fromDate1);
		        //java.sql.Date fromDate = new java.sql.Date(fromDate1.getTime());
		        //java.sql.Date toDate = new java.sql.Date(toDate1.getTime());
		        
				model.addAttribute("list", reportService.showReportsByUserIDAndDate(userI, fromDate1, toDate1));
				model.addAttribute("totalHours", reportService.calculateHoursByUserIdAndDate(userI, fromDate1, toDate1));
				model.addAttribute("fromDate", showFromDate);
				model.addAttribute("toDate", showToDate);
			}
		}
		return "allMyReports";
	}

	@RequestMapping(value = "update-report/{idReport}", method = RequestMethod.GET)
	public String update_report(Model model, @PathVariable Long idReport) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
			User user = userService.findByUsername(username);
			Long loggedInUserID = user.getId();
		
			Report oldReport = reportService.findByIdReport(idReport);
			Long userID = oldReport.getUserID().longValue();
			
			if (userID != loggedInUserID) {
				return "You don't own this report";
			}
			
		}
		model.addAttribute("update", reportService.findByIdReport(idReport));

		return "update-report";
	}

	@RequestMapping(value = "update-report/{idReport}", method = RequestMethod.POST)
	public String update_report(@ModelAttribute("update") Report report, BindingResult bindingResult,
			Model model) {
		
		Report oldReport = reportService.findByIdReport(report.getIdReport());
		
		if (oldReport.getLocked() == 1) {
			return "Error: report is locked!";
		}
		
		if (bindingResult.hasErrors()) {
			return "update-report";
		}

		reportService.updateReport(report);
		
		return "redirect:/report/allMyReports";
	}
	
	public class ReportExtended {
		private Long id;
		private String username;
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

		public ReportExtended(Long id, String username, String companyName, Double hoursReported, Double vab,
				Double vacation, Integer userID, Integer locked, Integer deleted, Date forDate, Date dateModified) {
			super();
			this.id = id;
			this.username = username;
			this.companyName = companyName;
			this.hoursReported = hoursReported;
			this.vab = vab;
			this.vacation = vacation;
			this.userID = userID;
			this.locked = locked;
			this.deleted = deleted;
			this.forDate = forDate;
			this.dateModified = dateModified;
		}

		public Long getId() {
			return id;
		}

		public String getUsername() {
			return username;
		}

		public String getCompanyName() {
			return companyName;
		}

		public Double getHoursReported() {
			return hoursReported;
		}

		public Double getVab() {
			return vab;
		}

		public Double getVacation() {
			return vacation;
		}

		public Integer getUserID() {
			return userID;
		}

		public Integer getLocked() {
			return locked;
		}

		public Integer getDeleted() {
			return deleted;
		}

		public Date getForDate() {
			return forDate;
		}

		public Date getDateModified() {
			return dateModified;
		}
	}
}