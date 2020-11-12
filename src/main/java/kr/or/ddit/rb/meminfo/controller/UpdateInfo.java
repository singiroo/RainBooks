package kr.or.ddit.rb.meminfo.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.service.IMemInfoService;
import kr.or.ddit.rb.meminfo.service.MemInfoServiceImpl;

/**
 * Servlet implementation class UpdateInfo
 */
@Controller
public class UpdateInfo {
	
	private static final Logger logger = LoggerFactory.getLogger(UpdateInfo.class);
	
	@Resource(name = "memInfoService")
	private IMemInfoService memInfoService;
	
	@RequestMapping(path = "/updateInfo", method = RequestMethod.POST)
	public String updateInfo(MemberVO memberVo) {
		logger.debug("updateInfo memId : {}", memberVo.getMemId());
		logger.debug("updateInfo memId : {}", memberVo.getMemNm());
		return "";
	}
    
    
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		MemberVO newMem = new MemberVO();
//		try {
//			BeanUtils.populate(newMem, request.getParameterMap());
//		} catch (IllegalAccessException | InvocationTargetException e) {
//			e.printStackTrace();
//		}
//		IMemInfoService service = MemInfoServiceImpl.getInstance();
//		int cnt = service.updateMemberVO(newMem);
//		request.setAttribute("cnt", cnt);
//		
//		request.getRequestDispatcher("Pages/updateResult.jsp").forward(request, response);
//		
//		
//	}

}
