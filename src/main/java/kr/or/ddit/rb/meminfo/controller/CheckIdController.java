package kr.or.ddit.rb.meminfo.controller;

import javax.annotation.Resource;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.rb.meminfo.service.IMemberService;

/**
 * Servlet implementation class CheckId
 */
@Controller
public class CheckIdController{
	private static final Logger logger = LoggerFactory.getLogger(CheckIdController.class);
	
	@Resource(name = "memberService")
	private IMemberService memberService;
	
	@RequestMapping("/CheckId")
	public String checkId(String memId, Model model) {
		boolean check = memberService.checkMemberId(memId);
		String result = "2";	// 기본값 : 중복 존재
		if(check) {
			result = "1";		// 중복 없음
		}
		model.addAttribute("sw", result);
		return "jsonView";
	}
    

//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String memId = request.getParameter("memId");
//		IMemberService service = MemberServiceImpl.getInstance();
//		boolean check = service.checkMemberId(memId);
//		request.setAttribute("result", check);
//		request.getRequestDispatcher("member/checkId.jsp").forward(request, response);
//		
//	}

}
