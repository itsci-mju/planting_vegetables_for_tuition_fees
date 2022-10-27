package org.itsci.vegetable.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.itsci.vegetable.dao.ReportManager;
import org.itsci.vegetable.dao.TransactionManager;
import org.itsci.vegetable.model.Assets;
import org.itsci.vegetable.model.Member_shifts;
import org.itsci.vegetable.model.Transaction_details;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReportController {
	
	/* @RequestMapping(value="/goViewAllWorkStatistics", method=RequestMethod.GET )
	    public String goViewAllWorkStatistics(HttpServletRequest request,HttpSession session){ 
			
		 	ReportManager rpm = new ReportManager();
		 	List<Member_shifts> listwork = rpm.getAllWorkStatistics();
		 	TransactionManager tm = new TransactionManager();
		 	List<Assets> listasset = tm.getAssets();
		 	System.out.println(listwork);
		 	
		 	request.setAttribute("listwork",listwork);
		 	request.setAttribute("listasset",listasset);
	        return"viewAllWorkStatistics";
	 }
	 @RequestMapping(value="/goReportSummary", method=RequestMethod.GET )
	    public String goReportSummary(HttpServletRequest request,HttpSession session){ 
		 	ReportManager rm = new ReportManager();
		 	List<Transaction_details> ts = rm.list_Alltransaction_details();
		 	request.setAttribute("list_details", ts);
		 	request.setAttribute("type", "1");
	        return"reportSummary";
	 }*/
	
	@RequestMapping(value="/goReportSummary", method=RequestMethod.GET )
	   public String goReportSummary(HttpServletRequest request,HttpSession session){ 
			
	       return"reportSummary";
	}
	 @RequestMapping(value="/search_report_summary", method=RequestMethod.POST)
		public String search_report_summary(HttpServletRequest request,HttpSession session) {
			
			String startdate = request.getParameter("startdate");
			String new_startdate = "";
			if(startdate.isEmpty()||startdate == null) {
				startdate = "";
			}else{/*แปลงวันที่*/
				String date1[]=startdate.split("-");
				/*เปลี่ยน ค.ศ -> พ.ศ*/
				int year = Integer.parseInt(date1[0])+543;
				new_startdate = startdate.replace(date1[0],String.valueOf(year));
			}

			String enddate = request.getParameter("enddate");
			String new_enddate = "";
			if(enddate.isEmpty()||enddate == null) {
				enddate = "";
			}else{/*แปลงวันที่*/
				String date1[]=enddate.split("-");
				/*เปลี่ยน ค.ศ -> พ.ศ*/
				int year = Integer.parseInt(date1[0])+543;
				new_enddate = enddate.replace(date1[0],String.valueOf(year));
			}
			
			String type = request.getParameter("cars");
			
			ReportManager rm = new ReportManager();
			TransactionManager t = new TransactionManager();
			List<Transaction_details> listtran =  t.Alltransaction_by_search();
			List<Transaction_details> list_details =  rm.report_summary_by_search(type, new_startdate, new_enddate);
			
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			if(!startdate.equals("")){
				String date1[]=startdate.split("-");
				int year = Integer.parseInt(date1[0]);
				cal.set(year, Integer.parseInt(date1[1])-1, Integer.parseInt(date1[2]));
				new_startdate = sdf.format(cal.getTime()) ;
			}
			
			if(!enddate.equals("")){
				String date1[]=enddate.split("-");
				int year = Integer.parseInt(date1[0]);
				cal.set(year, Integer.parseInt(date1[1])-1, Integer.parseInt(date1[2]));
				new_enddate = sdf.format(cal.getTime()) ;
			}
			request.setAttribute("ListTran", listtran);
			request.setAttribute("list_details", list_details);
			request.setAttribute("type", type);
			request.setAttribute("startdate", new_startdate);
			request.setAttribute("enddate", new_enddate);
			
			return "reportSummary";

		}

		@RequestMapping(value="/goReportStudentEarn", method=RequestMethod.GET )
		   public String goReportStudentEarn(HttpServletRequest request,HttpSession session){ 
			ReportManager rpm = new ReportManager();
		 	List<Member_shifts> listwork = rpm.getAllWorkStatistics();
		 	TransactionManager tm = new TransactionManager();
		 	List<Assets> listasset = tm.getAssets();
		 	System.out.println(listwork);
		 	
		 	
		 	request.setAttribute("listwork",listwork);
		 	request.setAttribute("listasset",listasset);
				
		       return"reportStudentEarn";
		}
		
		@RequestMapping(value="/search_report_student_earn", method=RequestMethod.POST)
		public String search_report_student_earn(HttpServletRequest request,HttpSession session) {
			
			String term_year = request.getParameter("term_year");
			int term = 0;
			int year = 0;
			if(term_year.isEmpty()||term_year == null) {
				term_year = "";
			}else{/*แปลงวันที่*/
				String date[] = term_year.split("-");
				term = Integer.parseInt(date[0]);
				year = Integer.parseInt(date[1]);
			}
			
			ReportManager rm = new ReportManager();
			TransactionManager t = new TransactionManager();
			List<Transaction_details> list_details =  rm.report_student_earn_by_search(term, year);
			
			request.setAttribute("list_details", list_details);
			request.setAttribute("term_year", term_year);
			
			return "reportStudentEarn";

		}
}
