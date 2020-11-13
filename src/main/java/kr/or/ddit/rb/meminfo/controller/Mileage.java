package kr.or.ddit.rb.meminfo.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.service.IMemInfoService;

/**
 * Servlet implementation class Mileage
 */
@Controller
public class Mileage{
	
	private static final Logger logger = LoggerFactory.getLogger(Mileage.class);
       
    @Resource(name = "memInfoService")
    private IMemInfoService memInfoService;

    @RequestMapping("/mileage")
    public String getMileage(String memId, Model model) {
    	MemberVO memberVo = memInfoService.selectMemberVO(memId);
    	model.addAttribute("member", memberVo);
    	return "/Pages/mileage.jsp";
    }
    
    
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		
//		String memId = request.getParameter("memId");
//		IMemInfoService service = MemInfoServiceImpl.getInstance();
//		MemberVO member = service.selectMemberVO(memId);
//		request.setAttribute("member", member);
//		request.getRequestDispatcher("/Pages/mileage.jsp").forward(request, response);
//	}

}
