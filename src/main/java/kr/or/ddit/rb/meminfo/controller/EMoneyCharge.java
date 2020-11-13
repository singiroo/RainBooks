package kr.or.ddit.rb.meminfo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.service.IMemInfoService;

/**
 * Servlet implementation class EMoneyCharge
 */
@Controller
public class EMoneyCharge{
	
	private static final Logger logger = LoggerFactory.getLogger(EMoneyCharge.class);
	
	@Resource(name = "memInfoService")
	private IMemInfoService memInfoService;
  
	
	@RequestMapping(path = "/eMoneyCharge", method = {RequestMethod.POST})
	public String eMoneyCharge(HttpSession session, int money) {
		logger.debug("emoneycharge() money : {}", money);
		MemberVO memberVo = (MemberVO)session.getAttribute("member");
		memberVo.seteMoney(memberVo.geteMoney() + money);
		memberVo = memInfoService.updateEmoney(memberVo);
		session.setAttribute("member", memberVo);
		return "jsonView";
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		int money = Integer.parseInt(request.getParameter("money"));
//		HttpSession session = request.getSession(true);
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		member.seteMoney((member.geteMoney()+money));
//		IMemInfoService service = MemInfoServiceImpl.getInstance();
//		member = service.updateEmoney(member);
//		session.setAttribute("member", member);
//	}

}
