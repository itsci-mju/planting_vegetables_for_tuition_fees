package com.springmvc.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.assets;
import bean.logins;
import bean.member;
import bean.projects;
import bean.register;
import bean.transaction;
import bean.transaction_details;
import util.RegisterManager;
import util.memberManager;
import util.projectsManager;
import util.transactionManager;

@Controller
public class transactionController {
/*addIncome
	@RequestMapping(value="/goaddIncome", method=RequestMethod.GET)
	public String goaddIncome(HttpServletRequest request,HttpSession session) {
	return "addincome";
	}

	@RequestMapping(value="/insertIncome", method=RequestMethod.POST)
	public String insertIncome(HttpServletRequest request,HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Calendar tcdate = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
       /*ไอดี*/ 
      /*  long unix = System.currentTimeMillis()/1000;
	        String tid = "t"+Long.toString(unix);
	        String asid = "a"+Long.toString(unix);
	        String tsid = "r"+Long.toString(unix);
	        
	     String trem = request.getParameter("trem");   
	     String type = request.getParameter("type");
		 String product_name = request.getParameter("product_name");
		 String asset_price = request.getParameter("asset_price");	 
		 String amount = request.getParameter("amount");
		 double str1 = Double.parseDouble(amount); 
		 
		 String sum = request.getParameter("sum");
		 double str2 = Double.parseDouble(sum); 
		 
		 String product_unit = request.getParameter("product_unit");
		 String member_id = request.getParameter("member_id");
		 
		 transactionManager tsac = new transactionManager();
		 memberManager mm = new memberManager();	 
		 RegisterManager rm = new RegisterManager();
		 member m = new member();
		 m.setMember_id(tid)
		 assets as;
		 projects pj;
		 
		 for(int i=0;i<pm.getProjects().size();i++) {
			 if(pm.getProjects().get(i).getProject_id().equals(faculty)){
			 pj = new projects(faculty,pm.getProjects().get(i).getName(),pm.getProjects().get(i).getCost_amount());
		*/
		 	/* transaction t = new transaction(tid,tcdate,trem,str2,m);
		 	transaction_details td = new transaction_details(tsid,amount,sum,type,tid,asid); */
			 /*logins log = new logins(email,password,0,mb);
			 register reg = new register (regid,reason,rd,term,0,mb,pj);
			
			 
			 
			 mm.insertMembers(mb);
			 rm.insertRegister(reg);
			 mm.insertLogins(log, mb);
			 session.setAttribute("message", "สมัครสมาชิกเสร็จสิ้น รอการอนุมัติ");
		 
			 }
		 }
		return "addincome";
	}
	*/
}
