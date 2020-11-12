package kr.or.ddit.rb.meminfo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.cmm.vo.BookGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.service.IMemInfoService;

/**
 * Servlet implementation class PassCheck
 */
@Controller
public class MemInfo{
	
	@Resource(name = "memInfoService")
	private IMemInfoService memInfoService;
	
	@RequestMapping(path = "/memInfo", method = {RequestMethod.POST})
	public String memInfo(String memId, Model model) {
		MemberVO memberVo = memInfoService.selectMemberVO(memId);
		AddrVO memAddr = memInfoService.selectAddrVO(memId);
		List<BookGenreVO> genreList = memInfoService.selectIntrGenreList(memId);
		model.addAttribute("member", memberVo);
		model.addAttribute("memAddr", memAddr);
		model.addAttribute("genreList", genreList);
		
		return "/Pages/memInfo.jsp";
	}
    
    
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		
//		String memId = request.getParameter("memId");
////		String memPw = request.getParameter("memPw");
//		
//		IMemInfoService service = MemInfoServiceImpl.getInstance();
//		MemberVO member = service.selectMemberVO(memId); // 회원의 아이디로 회원의 정보를 가져옴.
//		AddrVO memAddr = service.selectAddrVO(memId); // 회원의 아이디로 회원의 기본 주소를 가져옴.
//		List<BookGenreVO> genreList = service.selectIntrGenreList(memId); // 회원의 아이디로 회원의 관심장르 목록을 가져옴.
//		System.out.println("memaddr : " + memAddr);
//		request.setAttribute("member", member);
//		request.setAttribute("memAddr", memAddr);
//		request.setAttribute("genreList", genreList);
//		
//		request.getRequestDispatcher("/Pages/memInfo.jsp").forward(request, response);
//		
//		//방법 2는 나중에
////		if(memPw.equals(member.getMemPass())){
////			request.setAttribute("member", member);
////			request.getRequestDispatcher("/Pages/memInfo.jsp").forward(request, response);
////		}else {
////			String msg ="비밀번호가 일치하지 않습니다";
////			request.setAttribute("msg", msg);
////		}
		
		
//	}

}
