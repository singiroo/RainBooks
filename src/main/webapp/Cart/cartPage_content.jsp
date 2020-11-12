<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<title><h3>장바구니</h3></title>
</head>
<script>
// 	history.go(-1);

</script>
<body>
	<form action="<%= request.getContextPath()%>/cartTest" method="get">
	<div>
		isbn코드
		<p></p>
	
	</div>
	</form>

</body>
</html>