package kr.or.ddit.rb.meminfo.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.meminfo.service.IMemberService;
import kr.or.ddit.rb.meminfo.service.MemberServiceImpl;


@Controller
public class SearchAddrController{

	private static final Logger logger = LoggerFactory.getLogger(SearchAddrController.class);
	
	@Resource(name = "memberService")
	private IMemberService memberService;
	
	@RequestMapping(path="/SearchAddr")
	public String searchAddress(String addr1, Model model) {
		List<AddrVO> addrList = memberService.selectAddr(addr1);
		model.addAttribute("addrList", addrList);	
		return "jsonView";
	}
 
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String addr1 = request.getParameter("addr1");
//		IMemberService service = MemberServiceImpl.getInstance();
//		List<AddrVO> addrList = service.selectAddr(addr1);
//		request.setAttribute("addrList", addrList);
//		request.getRequestDispatcher("member/addr1.jsp").forward(request, response);
//	}

}
