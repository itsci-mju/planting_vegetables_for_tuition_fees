package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class officerController {
	/*listShift*/
	@RequestMapping(value="/golistRegisterReq", method=RequestMethod.GET)
	public String golistRegisterReq(HttpServletRequest request,HttpSession session) {
	return "listRegisterReq";
	}

}
