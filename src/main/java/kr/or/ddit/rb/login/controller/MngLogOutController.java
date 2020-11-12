package kr.or.ddit.rb.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Servlet implementation class MngLogOutController
 */
@Controller
public class MngLogOutController{

	
	@RequestMapping("/managerLogout")
	public String managerLogout(HttpSession session) {
		session.removeAttribute("mvo");
		return "/Pages/mainPage.jsp";
	}
	

}
