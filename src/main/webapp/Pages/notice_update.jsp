<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%-- 수정시 성공&실패  --%>
<% 
	int count = (Integer)request.getAttribute("noticeList");
	if(count > 0){
%>

	{ "sw" : "성공" }

<% }else{ %>

	{ "sw" : "실패" }

<% 
	}
%>