package kr.or.ddit.rb.meminfo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.meminfo.service.IMemberService;
import kr.or.ddit.rb.meminfo.service.MemberServiceImpl;

/**
 * Servlet implementation class SearchAddrController
 */
@WebServlet("/SearchAddr")
public class SearchAddrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAddrController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String addr1 = request.getParameter("addr1");
		IMemberService service = MemberServiceImpl.getInstance();
		List<AddrVO> addrList = service.selectAddr(addr1);
		request.setAttribute("addrList", addrList);
		request.getRequestDispatcher("member/addr1.jsp").forward(request, response);
	}

}
