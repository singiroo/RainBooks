package kr.or.ddit.rb.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemLogoutServer{
       
    
	@RequestMapping("/memLogout")
	public String memLogout(HttpSession session) {
		session.removeAttribute("member");
		return "/WEB-INF/view/login/mainPage.jsp";
	}
	
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("member", null);
//		String bkGreCd = request.getParameter("bkGreCd");
//		IprodviewService pvService = prodviewServiceImpl.getInstance();
//		List<BookVO> bkList = pvService.getBookBest();
//		List<BookImgVO> bkImgList = pvService.getBookImg();
//		request.setAttribute("bkVO", bkList);
//		request.setAttribute("bkImgVO", bkImgList);
//		request.getRequestDispatcher("/WEB-INF/view/login/mainPage.jsp").forward(request, response);
//				
//	}

}
