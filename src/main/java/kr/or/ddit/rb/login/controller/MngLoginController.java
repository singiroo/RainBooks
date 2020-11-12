package kr.or.ddit.rb.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.rb.cmm.vo.ManagerVO;
import kr.or.ddit.rb.login.service.IManagerLoginService;

/**
 * Servlet implementation class MngLoginController
 */
@Controller
public class MngLoginController{
    
	private static final Logger logger = LoggerFactory.getLogger(MngLoginController.class);

	@Resource(name = "managerLoginService")
	private IManagerLoginService managerLoginService;
		
				
	@RequestMapping("/mngLogin")
	public String managerLogin(String mngId, String mngPass, HttpSession session, Model model) {
		
		ManagerVO managerVo = managerLoginService.selectManagerVO(mngId);
		String msg = "";
		if(managerVo == null) {
			msg = "해당하는 관리자 정보가 없습니다.";
		}else if(managerVo.getMngPass().equals(mngPass)) {
			session.setAttribute("mvo", managerVo);
			return "/WEB-INF/view/login/managerMainPage.jsp";
		}else {
			msg = "비밀번호를 확인해주세요";
		}
		model.addAttribute("msg", msg);
		return "/manager/mngLogin.jsp";
	}
	
	
	

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		
//		
//		String mngId = request.getParameter("mngId");
//		String mngPass = request.getParameter("mngPass");
//		IManagerLoginService service = ManagerLoginService.getInstance();
//		ManagerVO mvo = service.selectManagerVO(mngId);
//		String msg="";
//		
//		if(mvo == null) {
//			msg = "해당하는 관리자 정보가 없습니다.";
//			request.setAttribute("msg", msg);
//			request.getRequestDispatcher("/manager/mngLogin.jsp").forward(request, response);
//		}else if(mvo.getMngPass().equals(mngPass)) {
//			HttpSession session = request.getSession(true); // 없으면 생성 
//			session.setAttribute("mvo", mvo);
//			request.getRequestDispatcher("/WEB-INF/view/login/managerMainPage.jsp").forward(request, response);
//		}else {
//			msg = "비밀번호를 확인해주세요";
//			request.setAttribute("msg", msg);
//			request.getRequestDispatcher("/manager/mngLogin.jsp").forward(request, response);
//		}
//	}

}
