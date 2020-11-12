package kr.or.ddit.rb.meminfo.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.rb.cmm.vo.IntrGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.service.IMemberService;
import kr.or.ddit.rb.meminfo.service.MemberServiceImpl;

@WebServlet("/insertMember")
public class InsertMemberController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/signUp.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		IMemberService service = MemberServiceImpl.getInstance();
		String memId = req.getParameter("memId").trim();
		String memPass = req.getParameter("memPass1").trim();
		String memNm = req.getParameter("memName").trim();
		int memGender = Integer.parseInt(req.getParameter("gender"));
		String memBir = req.getParameter("memBir").trim();
		int memAddrSq = Integer.parseInt(req.getParameter("addrSq"));
		String memAddrDetail = req.getParameter("addr2").trim();
		String memHp = req.getParameter("memHp").trim();
		String memMail = req.getParameter("memMail").trim();
		
		MemberVO mvo = new MemberVO();
		mvo.setMemId(memId);
		mvo.setMemCd(1); // 회원 상태코드 0: 휴면 1: 정상 .. 가입시 기본값으로 1
		mvo.setMemPass(memPass);
		mvo.setMemNm(memNm);
		mvo.setMemGender(memGender);
		mvo.setAddrSq(memAddrSq);
		mvo.setAddrDetail(memAddrDetail);
		mvo.setMemHp(memHp);
		mvo.setMemBir(memBir);
		mvo.setMemMail(memMail);
		mvo.seteMoney(0);
		mvo.setMemMile(0);
		
		int cnt = 0;
		cnt = service.insertMemberInfo(mvo);
		String msg="";
		if(cnt>0) {
			msg="회원가입성공";
		}else {
			msg="회원가입실패";
		}
		
		// 회원의 관심장르 코드 가져오기
		String[] bkGre = req.getParameterValues("bkGre"); // 관심도서장르 코드
		IntrGenreVO ivo = new IntrGenreVO();
		for(int i=0;i<bkGre.length;i++) {
			ivo.setMemId(memId);
			ivo.setBkGreCd(bkGre[i]);
			service.insertIntrGenre(ivo);
		}
		String redirectURL = req.getContextPath() + "/Main?msg="+URLEncoder.encode(msg,"utf-8");
		resp.sendRedirect(redirectURL);
	}
}
