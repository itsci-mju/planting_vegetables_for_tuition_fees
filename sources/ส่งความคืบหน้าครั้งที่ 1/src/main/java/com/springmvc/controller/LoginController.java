package com.springmvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import bean.logins;
import util.LoginManager;




@Controller
public class LoginController {
	@RequestMapping(value="/goHomepage", method=RequestMethod.GET )
    public String goHomepage(){ 
        return"content";
        }
	@RequestMapping(value="/goLogin", method=RequestMethod.GET )
    public String goLogin(){ 
        return"login";
	}
       
	@RequestMapping(value="/isMemberLogin", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request,HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		LoginManager lm = new LoginManager();
		logins log = lm.verifyLogin(email, password);
		if(log.getStatus()==0) {		
			session.setAttribute("login", log);	
			return "login"; 
		}
			/*login pass*/
			session.setAttribute("login", log);
		return "content";
	}
	
	@RequestMapping(value="/dologout", method=RequestMethod.GET)
	public String dologout(HttpServletRequest request,HttpSession session) {
			session.removeAttribute("login");
		return "content";
	}
}
	 
