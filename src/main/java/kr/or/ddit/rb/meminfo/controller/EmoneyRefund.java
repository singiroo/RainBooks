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


@Controller
public class EmoneyRefund{
	
	private static final Logger logger = LoggerFactory.getLogger(EmoneyRefund.class);
	
	private static final int REFUND_UNIT = 100;
    
	
	@Resource(name = "memInfoService")
	private IMemInfoService memInfoService;
	
	@RequestMapping(path="/eMoneyRefund", method= {RequestMethod.POST})
	public String eMoneyRefunc(int money, HttpSession session) {
		MemberVO memberVo = (MemberVO) session.getAttribute("member");
		memberVo.seteMoney(memberVo.geteMoney()-(money/REFUND_UNIT * REFUND_UNIT));
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
//		member.seteMoney((member.geteMoney()-(money/REFUND_UNIT*REFUND_UNIT)));
//		IMemInfoService service = MemInfoServiceImpl.getInstance();
//		member = service.updateEmoney(member);
//		session.setAttribute("member", member);
//	}

}
