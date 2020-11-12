<%@page import="kr.or.ddit.rb.cmm.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 전체 조회랑 페이지 까지 보여주는 jsp --%>
    
<%
	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("listvalue");
	
	int spage = (Integer)request.getAttribute("spage");
	int epage = (Integer)request.getAttribute("epage");
	int tpage = (Integer)request.getAttribute("tpage");
	int cpage = (Integer)request.getAttribute("cpage");
%>

{

	"spage" : "<%= spage %>",
	"epage" : "<%= epage %>",
	"tpage" : "<%= tpage %>",
	"cpage" : "<%= cpage %>",
	"data" : [
	
	<% 
		for(int i=0; i<noticeList.size(); i++){
			NoticeVO vo = noticeList.get(i);
			if(i > 0) out.print(",");
	%>
		
		{
			"ntNo" : "<%= vo.getNtNo() %>",
			"mngId" : "<%= vo.getMngId() %>",
			"ntTitle" : "<%= vo.getNtTitle() %>",
			"ntCont" : "<%= vo.getNtCont() %>",
			"ntDt" : "<%= vo.getNtDt() %>"
		}
		
	<%
		}
	%>		
	]
}