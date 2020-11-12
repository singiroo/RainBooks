<%@page import="kr.or.ddit.rb.cmm.vo.RvReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<RvReplyVO> list = (List<RvReplyVO>) request.getAttribute("list");
%>
[
<%
	for(int i=0; i<list.size(); i++){
		RvReplyVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
		{
			"rvReNo" : "<%= vo.getRvReNo() %>",
			"rvNo" : "<%= vo.getRvNo() %>",
			"memId" : "<%= vo.getMemId() %>",
			"rvReCont" : "<%= vo.getRvReCont().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
			"rvReDt" : "<%= vo.getRvReDt() %>"
		}
<%	} 

%>
]
