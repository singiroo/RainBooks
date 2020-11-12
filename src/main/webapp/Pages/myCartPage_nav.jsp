<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
%>
<!-- nav1 -->
	<nav class="navbar navbar1 navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="<%= request.getContextPath() %>/Main">
	      	<img src="<%= request.getContextPath() %>/images/로고.png" alt="cola-image">
	      </a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> <%= member.getMemNm() %>님</a></li>
	        <li><a href="<%= request.getContextPath() %>/MyCartView"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
	        <li><a href="<%= request.getContextPath() %>/memLogout"><span class="glyphicon glyphicon-tags"></span> 로그아웃</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>