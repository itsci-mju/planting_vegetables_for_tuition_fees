package org.itsci.vegetable.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.itsci.vegetable.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.itsci.vegetable.model.Login;

@Controller
public class LoginController {

    @Autowired
    private LoginDao loginDao;

    @RequestMapping(value = "/goHomepage", method = RequestMethod.GET)
    public String goHomepage() {
        return "content";
    }

    @RequestMapping(value = "/goLogin", method = RequestMethod.GET)
    public String goLogin(Model model) {
        model.addAttribute("login", new Login());
        return "login";
    }

    @RequestMapping(value = "/isMemberLogin", method = RequestMethod.POST)
    public String memberLogin(@ModelAttribute("login") Login login,
                              HttpSession session, Model model) {
        Login engiotyLogin = loginDao.verifyLogin(login);
        if (engiotyLogin == null) {
            model.addAttribute("login", new Login());
            return "login";
        }
        /*login pass*/
        model.addAttribute("login", login);
        session.setAttribute("login", engiotyLogin);
        return "content";
    }

    @RequestMapping(value = "/dologout", method = RequestMethod.GET)
    public String dologout(HttpServletRequest request, HttpSession session) {
        session.removeAttribute("login");
        return "content";
    }
}
	 
