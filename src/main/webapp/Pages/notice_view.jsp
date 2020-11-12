<%@page import="kr.or.ddit.rb.cmm.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 수정할때 불러오는 --%>
<% 
	NoticeVO vo = (NoticeVO)request.getAttribute("noticeList");
%>

{
	"ntTitle" : "<%= vo.getNtTitle() %>",
	"ntCont" : "<%= vo.getNtCont() %>",
	"ntDt" : "<%= vo.getNtDt() %>"
}