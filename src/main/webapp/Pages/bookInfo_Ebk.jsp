<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookImgVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	BookVO bkEbkVO = (BookVO)request.getAttribute("bkEbkVO");
	BookImgVO bkImgVO = (BookImgVO)request.getAttribute("bkImgVO");
	MemberVO member = (MemberVO)session.getAttribute("member");
	
%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>
<%-- 	<%=member %> --%>
	<%if(member == null){ %>
	 <jsp:include page="main_nav.jsp"></jsp:include>
	<%}else{ %>
	<jsp:include page="main_nav_login.jsp"></jsp:include>
	<%} %>
	
	<jsp:include page="bookInfo_content_Ebk.jsp"></jsp:include>
<%-- 	<jsp:include page="bookInfo_footer.jsp"></jsp:include> --%>



</body>
</html>