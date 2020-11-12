<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int rvReNo = (Integer)request.getAttribute("rvReNo");
	System.out.println("rvReNo= " + rvReNo);

	if(rvReNo > 0){
%>
	{ "sw" : "저장 성공" }
	
	 
<%	}else{ %>
	
	{ "sw" : "저장 실패" }
		
<%
	}
%>
    
 		