package kr.or.ddit.rb.meminfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.service.IMemInfoService;
import kr.or.ddit.rb.meminfo.service.MemInfoServiceImpl;

/**
 * Servlet implementation class Mileage
 */
@WebServlet("/mileage")
public class Mileage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mileage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("memId");
		IMemInfoService service = MemInfoServiceImpl.getInstance();
		MemberVO member = service.selectMemberVO(memId);
		request.setAttribute("member", member);
		request.getRequestDispatcher("/Pages/mileage.jsp").forward(request, response);
	}

}
