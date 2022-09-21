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

import bean.logins;
import bean.member;
import bean.projects;
import bean.register;
import util.RegisterManager;
import util.memberManager;
import util.projectsManager;

@Controller
public class registerController {
	@RequestMapping(value="/goRegister", method=RequestMethod.GET )
    public String goRegister(){ 
        return"register";
        }
	/*เปลี่ยนชื่อ getRegisterเป็น insertRegister*/
	@RequestMapping(value="/getRegister", method=RequestMethod.POST)
	public String getRegister(HttpServletRequest request,HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Calendar birthdate = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
       /*ไอดี*/ 
        long unix = System.currentTimeMillis()/1000;
	        String mid = "m"+Long.toString(unix);
	        /*String pjid = "p"+Long.toString(unix);*/
	        String regid = "r"+Long.toString(unix);
	        
		String prefix ="";
		int pf =0;
		 if(request.getParameter("prefix").equalsIgnoreCase("prefix")) {
			 prefix = "นาย";
			 pf=0;
		 }else {
			 prefix = "นางสาว";
			 pf=1;
		 }
		 
		 String name = request.getParameter("name");
	
		 String phone = request.getParameter("phone");
		 
		 String birthday = request.getParameter("birthday");
		 
		 String date[] = birthday.split("-");
		 		birthdate.set(Integer.parseInt(date[0]), Integer.parseInt(date[1])-1, Integer.parseInt(date[2]));
		 Calendar bd = Calendar.getInstance();
		 String reason = request.getParameter("reason");
		 
		 Calendar rd = Calendar.getInstance();
		 
		 String term = request.getParameter("term");
		 String stucode = request.getParameter("stucode");
		 String major = request.getParameter("major");
		 String faculty = request.getParameter("faculty");
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
		 	 
		 member mb = new member(mid,pf,name,phone,bd,"",stucode,major,faculty,"สมาชิก");
		 logins log = new logins(email,password,0,mb);
		 
		 projectsManager pm = new projectsManager();
		 projects pj;
		 
		 for(int i=0;i<pm.getProjects().size();i++) {
			 if(pm.getProjects().get(i).getProject_id().equals(faculty)){
			 pj = new projects(faculty,pm.getProjects().get(i).getName(),pm.getProjects().get(i).getCost_amount());
			 register reg = new register (regid,reason,rd,term,0,mb,pj);	 
				 
			 memberManager mm = new memberManager();
			 RegisterManager rm =new RegisterManager();
			 
			 mm.insertMembers(mb);
			 rm.insertRegister(reg);
			 mm.insertLogins(log, mb);
			 session.setAttribute("message", "สมัครสมาชิกเสร็จสิ้น รอการอนุมัติ");
		 
			 }
		 }
		return "content";
	}
	
}
