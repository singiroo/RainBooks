package kr.or.ddit.rb.meminfo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.meminfo.service.IMemInfoService;

/**
 * Servlet implementation class AddrSearch
 */
@Controller
public class AddrSearch {
	
	private static final Logger logger = LoggerFactory.getLogger(AddrSearch.class);
	
	@Resource(name = "memInfoService")
	private IMemInfoService memInfoService;
	
	
	@RequestMapping("/addrSearch")
	public String addrSearch(String key, Model model) {
		List<AddrVO> addrList = memInfoService.selectAddrList(key);
		model.addAttribute("list", addrList);
		return "jsonView";
	}
	
	
	
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		String key = request.getParameter("key");
//		
//		IMemInfoService service = MemInfoServiceImpl.getInstance();
//		List<AddrVO> addrList = service.selectAddrList(key);
//		
//		request.setAttribute("list", addrList);
//		
//		request.getRequestDispatcher("/Pages/addrSearch.jsp").forward(request, response);
//	
//	}

}
