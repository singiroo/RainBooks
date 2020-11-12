package kr.or.ddit.rb.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.login.service.IMemLoginService;

@Controller
public class MemLoginServer{
	
	private static final Logger logger = LoggerFactory.getLogger(MemLoginServer.class);
	
	@Resource(name = "memLoginService")
	private IMemLoginService memLoginService;
	
	@RequestMapping("/Main")
	public String mainPage() {
//		MemberVO member = (MemberVO) request.getSession().getAttribute("member");
//		session.setAttribute("member", member);
////		String bkGreCd = request.getParameter("bkGreCd");
//		IprodviewService pvService = prodviewServiceImpl.getInstance();
//		List<BookVO> bkList = pvService.getBookBest();
//		List<BookImgVO> bkImgList = pvService.getBookImg();
//		request.setAttribute("bkVO", bkList);
//		request.setAttribute("bkImgVO", bkImgList);
//		request.getRequestDispatcher("/WEB-INF/view/login/mainPage.jsp").forward(request, response);
		
		return "/WEB-INF/view/login/mainPage.jsp";
		
	}
	
	@RequestMapping(path = "/memberLogin", method = {RequestMethod.POST})
	public String memberLogin(HttpSession session, String memId, String memPass, Model model) {
		logger.debug("memId : {}", memId);
		logger.debug("memPass : {}", memPass);
		
		MemberVO memberVo = memLoginService.selectMemberVO(memId);
		String msg = "";
		if(memberVo == null) {
			msg = "일치하는 회원이 존재하지 않습니다.";
		}else if(memPass.equals(memberVo.getMemPass())) {
			session.setAttribute("member", memberVo);
			return "/WEB-INF/view/login/mainPage.jsp";
		}else {
			msg = "비밀번호가 일치하지 않습니다.";
		}
		model.addAttribute("msg", msg);
		return "/Pages/login2.jsp";
	}
	
	
	
	
	
	
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String memId = req.getParameter("idInput");
//		String memPw = req.getParameter("pwInput");
//		
//		MemberVO member = memLoginService.selectMemberVO(memId);
//		String msg = "";
//		String bkGreCd = req.getParameter("bkGreCd");
//		IprodviewService pvService = prodviewServiceImpl.getInstance();
//		List<BookVO> bkList = pvService.getBookBest();
//		List<BookImgVO> bkImgList = pvService.getBookImg();
//		req.setAttribute("bkVO", bkList);
//		req.setAttribute("bkImgVO", bkImgList);
//		
//		if(member == null) {
//			msg = "일치하는 회원이 존재하지 않습니다.";
//			req.setAttribute("msg", msg);
//			req.getRequestDispatcher("/Pages/login2.jsp").forward(req, resp);
//		}else if(member.getMemPass().equals(memPw)) {
//			HttpSession session = req.getSession(true);
//			session.setAttribute("member", member);
////			req.getRequestDispatcher("/Pages/login2.jsp").forward(req, resp);
//			req.getRequestDispatcher("/WEB-INF/view/login/mainPage.jsp").forward(req, resp);
//		}else {
//			msg = "비밀번호가 일치하지 않습니다.";
//			req.setAttribute("msg", msg);
//			req.getRequestDispatcher("/Pages/login2.jsp").forward(req, resp);
//		}
//	}	
		
}
