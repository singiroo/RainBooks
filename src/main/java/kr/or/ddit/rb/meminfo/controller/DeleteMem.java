package kr.or.ddit.rb.meminfo.controller;

import javax.annotation.Resource;
import javax.servlet.annotation.WebServlet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.rb.meminfo.service.IMemInfoService;

/**
 * Servlet implementation class DeleteMem
 */
@Controller
public class DeleteMem {
	
	@Resource(name = "memInfoService")
	private IMemInfoService memInfoService;
	
	@RequestMapping("/deleteMember")
	public String deleteMember(String memId, Model model) {
		int cnt = memInfoService.deleteMemberVO(memId);
		String msg ="탈퇴 실패!!!";
		boolean code = false;
		
		if(cnt == 1) {
			msg = "탈퇴가 완료되었습니다. 다음에 또 이용해주세요.";
			code = true;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("code", code);
		
		return "jsonView";
		
	}
	
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String memId = request.getParameter("memId");
//		IMemInfoService service = MemInfoServiceImpl.getInstance();
//		int cnt = service.deleteMemberVO(memId);
//		request.setAttribute("cnt", cnt);
//		request.getRequestDispatcher("/Pages/deleteMem.jsp").forward(request, response);
//	}

}
