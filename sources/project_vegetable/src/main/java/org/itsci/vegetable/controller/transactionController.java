package org.itsci.vegetable.controller;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.itsci.vegetable.model.assets;
import org.itsci.vegetable.model.logins;
import org.itsci.vegetable.model.member;
import org.itsci.vegetable.model.transaction;
import org.itsci.vegetable.model.transaction_details;
import org.itsci.vegetable.dao.memberManager;
import org.itsci.vegetable.dao.transactionManager;

@Controller
public class transactionController {
	
	/*listAll*/
	@RequestMapping(value="/goListall", method=RequestMethod.GET)
	public String goListall(HttpServletRequest request,HttpSession session) {
		
		logins log = (logins) session.getAttribute("login");
		memberManager lmem = new memberManager();
		System.out.println(log.getMember().getMember_id());
		member listmember = lmem.getMember(log.getMember().getMember_id());
		
		session.setAttribute("member", listmember);
		return "listIncomeandExpense";
	}
	/*Edit_income_expense*/
	@RequestMapping(value="/goEdit_income_expense", method=RequestMethod.GET)
	public String goEdit_income_expense(HttpServletRequest request,HttpSession session) {
		String t = request.getParameter("id");
		String td = request.getParameter("td");
		transactionManager tm = new transactionManager();
		tm.list_transaction_details(Integer.valueOf(td));
		tm.transaction_by_date(t);
		
		return "editIncomeExpense";
	}

	/*add income*/
	@RequestMapping(value="/goaddIncome", method=RequestMethod.GET)
	public String goaddIncome(HttpServletRequest request,HttpSession session) {
		
		logins log = (logins) session.getAttribute("login");
		memberManager lmem = new memberManager();
		System.out.println(log.getMember().getMember_id());
		member listmember = lmem.getMember(log.getMember().getMember_id());
		
		session.setAttribute("member", listmember);
		return "addincome";

	}
	
	@RequestMapping(value="/addIncome", method=RequestMethod.POST)
		public String addIncome(HttpServletRequest request,HttpSession session) {
		logins log = (logins) session.getAttribute("login");
		memberManager lmem = new memberManager();
		member member = lmem.getMember(log.getMember().getMember_id());
		
		 /*ไอดี*/ 
        int tsid = (int) (System.currentTimeMillis()/1000);  
	      //  String tsdgid = "r"+Long.toString(unix);
		
		int asset_id = Integer.parseInt( request.getParameter("product_name"));
		String asset_price = request.getParameter("asset_price");
		int amount = Integer.parseInt( request.getParameter("amount"));
		Double sum = Double.parseDouble(request.getParameter("sum"));
		
		Calendar date = Calendar.getInstance(); 	
		String term ;
		if( date.get(Calendar.MONTH)>= 7 && date.get(Calendar.MONTH) <= 10 ) {
			term = "1";
		}else{
			term = "2";
		}
		transaction tc = new transaction(tsid,date,sum,term,member);
		
		transactionManager t = new transactionManager();
		t.addincome_transaction(tc);
		
		assets as = t.assetID(asset_id);
		transaction_details tsd = new transaction_details(1,"สินค้า",amount,sum,tc,as);
		t.addincome_tsac_detail(tsd);
		
		
	
		
	return "addincome";
	}
	/*end addincome*/
	
	/*add expense*/
	@RequestMapping(value="/goaddExpense", method=RequestMethod.GET)
	public String goaddExpense(HttpServletRequest request,HttpSession session) {
		
		logins log = (logins) session.getAttribute("login");
		memberManager lmem = new memberManager();
		System.out.println(log.getMember().getMember_id());
		member listmember = lmem.getMember(log.getMember().getMember_id());
		
		session.setAttribute("member", listmember);
		return "addexpense";

	}
	
	@RequestMapping(value="/addExpense", method=RequestMethod.POST)
		public String addExpense(HttpServletRequest request,HttpSession session) {
		logins log = (logins) session.getAttribute("login");
		memberManager lmem = new memberManager();
		member member = lmem.getMember(log.getMember().getMember_id());
		
		 /*ไอดี*/ 
        int tsid = (int) (System.currentTimeMillis()/1000);  
	      //  String tsdgid = "r"+Long.toString(unix);
		
		int asset_id = Integer.parseInt( request.getParameter("equipment_name"));
		String asset_price = request.getParameter("asset_price");
		int amount = Integer.parseInt( request.getParameter("amount"));
		Double sum = Double.parseDouble(request.getParameter("sum"));
		
		Calendar date = Calendar.getInstance(); 	
		String term ;
		if( date.get(Calendar.MONTH)>= 7 && date.get(Calendar.MONTH) <= 10 ) {
			term = "1";
		}else{
			term = "2";
		}
		transaction tc = new transaction(tsid,date,sum,term,member);
		
		transactionManager t = new transactionManager();
		t.addExpense_transaction(tc);
		
		assets as = t.assetID(asset_id);
		transaction_details tsd = new transaction_details(1,"อุปกรณ์",amount,sum,tc,as);
		t.addExpense_tsac_detail(tsd);
		
		
	
		
	return "addexpense";
	}
}
