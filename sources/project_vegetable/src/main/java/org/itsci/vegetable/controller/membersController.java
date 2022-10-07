package org.itsci.vegetable.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.itsci.vegetable.model.Login;
import org.itsci.vegetable.model.Member;
import org.itsci.vegetable.model.member_shifts;
import org.itsci.vegetable.model.register;
import org.itsci.vegetable.manager.RegisterManager;
import org.itsci.vegetable.manager.memberManager;
import org.itsci.vegetable.manager.membershiftManager;

@Controller
public class membersController {
	/*add shift*/
	@RequestMapping(value="/goAddshift", method=RequestMethod.GET)
	public String goAddshift(HttpServletRequest request,HttpSession session) {
		
		Login log = (Login) session.getAttribute("login");
		memberManager lmem = new memberManager();
		System.out.println(log.getMember().getMember_id());
		Member listmember = lmem.getMember(log.getMember().getMember_id());
		
		session.setAttribute("member", listmember);
	
		return "addshift";
	
	}
	
	@RequestMapping(value="/insertAddshift", method=RequestMethod.POST)
	public String insertAddshift(HttpServletRequest request,HttpSession session) throws ParseException {
		try {
			request.setCharacterEncoding("UTF-8");
				} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Calendar cal = new GregorianCalendar();
		Calendar cal_date = new GregorianCalendar();
		Calendar cal_e_date = new GregorianCalendar();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		
		/*auto number*/ 
        long unix = System.currentTimeMillis()/1000;
	        String msid = "s"+Long.toString(unix);
	        
        String task_name = request.getParameter("task_name");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
		Date _date = dateFormat.parse(date);
		dateFormat.format(_date);
		cal_date = dateFormat.getCalendar();
		String[] st = startTime.split(":");
		int hour = Integer.parseInt(st[0]);
		int min = Integer.parseInt(st[1]);
		cal.set(Calendar.HOUR_OF_DAY, hour);
		cal.set(Calendar.MINUTE, min);
		String register_id = request.getParameter("register_id");
		
	
		String[] et = endTime.split(":");
		int et_hour = Integer.parseInt(et[0]);
		int et_min = Integer.parseInt(et[1]);
		cal_e_date.set(Calendar.HOUR_OF_DAY, et_hour);
		cal_e_date.set(Calendar.MINUTE, et_min);
	
       register r = new register();
       r.setRegister_id(register_id);
        
        member_shifts ms = new member_shifts(msid,task_name,cal_date,cal,cal_e_date,0,r);
   
        membershiftManager msm = new membershiftManager();
		msm.insertShift(ms);
        
		session.setAttribute("message", "บันทึกเวลาทำงานเสร็จสิ้น รอการอนุมัติ");
		return "content";

	}
	
	/*end addshift*/
	
	
	/*listShift*/
	@RequestMapping(value="/golistShift", method=RequestMethod.GET)
	public String golistShift(HttpServletRequest request,HttpSession session) {
	return "listShift";
	}
	
	/*approveShift*/
	@RequestMapping(value="/approveShift", method=RequestMethod.GET)
	public String goapproveShift(HttpServletRequest request,HttpSession session) {
		String mid = request.getParameter("id");
		memberManager lmem = new memberManager();
		RegisterManager Regis = new RegisterManager();
		
		Member listmember = Regis.getMember_shift(Regis.getMember_shift(mid).getStudent_code());
		session.setAttribute("ShowMember", listmember);
	return "approveShift";

	}
	
	@RequestMapping(value="/updateApproveshift", method=RequestMethod.POST)
	public String updateApproveshift(HttpServletRequest request,HttpSession session) throws ParseException {
		try {
			request.setCharacterEncoding("UTF-8");
				} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Calendar cal = new GregorianCalendar();
		Calendar cal_date = new GregorianCalendar();
		Calendar cal_e_date = new GregorianCalendar();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
	    String msid = request.getParameter("member_shift_id");    
	    System.out.println(msid);
        String task_name = request.getParameter("task_name");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
		Date _date = dateFormat.parse(date);
		dateFormat.format(_date);
		cal_date = dateFormat.getCalendar();
		String[] st = startTime.split(":");
		int hour = Integer.parseInt(st[0]);
		int min = Integer.parseInt(st[1]);
		cal.set(Calendar.HOUR_OF_DAY, hour);
		cal.set(Calendar.MINUTE, min);
		String register_id = request.getParameter("register_id");
		
	
		String[] et = endTime.split(":");
		int et_hour = Integer.parseInt(et[0]);
		int et_min = Integer.parseInt(et[1]);
		cal_e_date.set(Calendar.HOUR_OF_DAY, et_hour);
		cal_e_date.set(Calendar.MINUTE, et_min);
	
       register r = new register();
       r.setRegister_id(register_id);
        
        member_shifts ms = new member_shifts(msid,task_name,cal_date,cal,cal_e_date,1,r);
   
        membershiftManager msm = new membershiftManager();
		msm.ApproveShift(ms);
		session.setAttribute("message", "บันทึกเวลาทำงานเสร็จสิ้น รอการอนุมัติ");
		return "content";

	}
	/*my profile*/
	
	@RequestMapping(value="/goViewprofile", method=RequestMethod.GET )
    public String goViewprofile(){ 
        return"viewprofile";
        }
	
	 @RequestMapping(value="/loadEditprofile", method=RequestMethod.POST )
	 public String loadEditprofile(){ 	  
	    return"editProfile";
	    }  
	 
	 @RequestMapping(value="/submitEdit", method=RequestMethod.POST)
	    public String submitEdit(HttpServletRequest request, Model md, HttpSession session) {
			Calendar birthdate = Calendar.getInstance();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
		 try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
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
		
			 
			 String officer_position =request.getParameter("officer_position") ;

			 String stucode = request.getParameter("stucode");
			 String major = request.getParameter("major");
			 String faculty = request.getParameter("faculty");
			 String member_type = request.getParameter("member_type");
			 String member_id = request.getParameter("member_id");

			 Member mb = new Member(member_id,pf,name,phone,birthdate,"",stucode,major,faculty,"สมาชิก");
			 memberManager mm = new memberManager();

	        int r = mm.editProfile(mb);
	        request.setAttribute("Editresult", r);
	        session.setAttribute("member", mb);
	        return "viewprofile";
	      }
 
}
