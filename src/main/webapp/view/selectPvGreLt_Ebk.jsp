<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookImgVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%
 	List<BookVO> bkList = (List<BookVO>)request.getAttribute("bkVO");
	List<BookImgVO> bkImgList = (List<BookImgVO>)request.getAttribute("bkImgVO");
	MemberVO member = (MemberVO) session.getAttribute("member");
%> 
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    .navbar { margin-bottom: 0;  border-radius: 0; }
    .row.content {height: 450px}
    .sidenav {  padding-top: 20px;  background-color: #f1f1f1; height: 100%;}
    footer {  background-color: #555; color: white; padding: 15px; }
    @media screen and (max-width: 767px) {
    .sidenav {  height: auto; padding: 15px; }
    .row.content {height:auto;} 
    }
  </style>
</head>
<body>
<%-- 	<jsp:include page="/Pages/main_nav.jsp"></jsp:include> --%>



	<%if(member == null){ %>
	 <jsp:include page="/Pages/main_nav.jsp"></jsp:include>
	<%}else{ %>
		<jsp:include page="/Pages/main_nav_login.jsp"></jsp:include>
	<%} %>
	
	
	<jsp:include page="selectPvGreLt_Ebk_content.jsp"></jsp:include>
	<jsp:include page="/Pages/main_footer.jsp"></jsp:include>
</body>
</html>
   