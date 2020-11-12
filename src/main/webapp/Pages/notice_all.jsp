<%@page import="kr.or.ddit.rb.cmm.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 전체 조회 목록 보여주는 jsp --%>
<% 
	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
%>

[

<% 
	for(int i=0; i<noticeList.size(); i++){
		NoticeVO vo = noticeList.get(i);
		if(i>0)out.print(",");
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