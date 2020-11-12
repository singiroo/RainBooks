package kr.or.ddit.rb.meminfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.service.IMemInfoService;
import kr.or.ddit.rb.meminfo.service.MemInfoServiceImpl;

/**
 * Servlet implementation class EmoneyRefund
 */
@WebServlet("/eMoneyRefund")
public class EmoneyRefund extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int REFUND_UNIT = 100;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmoneyRefund() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int money = Integer.parseInt(request.getParameter("money"));
		HttpSession session = request.getSession(true);
		MemberVO member = (MemberVO)session.getAttribute("member");
		member.seteMoney((member.geteMoney()-(money/REFUND_UNIT*REFUND_UNIT)));
		IMemInfoService service = MemInfoServiceImpl.getInstance();
		member = service.updateEmoney(member);
		session.setAttribute("member", member);
	}

}
