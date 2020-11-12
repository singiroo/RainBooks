<%@page import="kr.or.ddit.rb.cmm.vo.AddrVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
%>
   
    
	<style>
	
		.infocenter{
			text-align: center;
		}
		#GoHome{
			height: 80px;
			border-radius: 25px;
			background: lightgreen;
			color: black;
		}
		
		
		
		
		/* content 상단의 메뉴바 크기 고정  */
		body{
		 	min-width: 1700px; 
		}
		#myNavbar{
		 	box-sizing : border-box; 
		}
		.container-fluid{
		 	min-width: 2000px; 
		}
		.dropdown-toggle{
			height: 50px;
		}
	</style>


<div class="container-fluid text-center">    
    
	<div class="col-sm-8 text-left infocenter">
	
		<br><br><br><br><br>
		<h1>결제가 완료되었습니다.</h1>
		<h3><%= member.getMemNm() %>님 이용해주셔서 감사합니다.</h3>
		<br><br><br><br><br>
		
		<div>
		
			<form id="changePageButtonForm">
				<input type="button" value="홈으로 가기" id="GoHome"> 
			</form>
			
		</div>
		
		<br><br><br><br><br>
		
      
	</div>
    
  
</div>