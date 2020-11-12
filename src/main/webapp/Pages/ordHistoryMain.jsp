<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberVO member = (MemberVO)session.getAttribute("member"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매내역 메인페이지</title>
<script>
$(function(){
	$('#showResult').on('click', function(){
		category = $('#category option:selected').val();
		period = $('#searchBar input:radio:checked').val();
		
		$.ajax({
			url : '/RainBooks/showOrdHistory',
			type : 'get',
			data : {"category" : category, "period" : period},
			success : function(res){
				$('#resultView').empty();
				$('#resultView').html(res);
			}, 
			error : function(xhr){
				alert("상태 : "+xhr.status);
			}
			
		})
		
		
		
		
	})
	
	
	
	
	
	
	
})






</script>
<style>
#searchBar{
	width : 600px;
	margin : 20px;
}

</style>
</head>
<body>
<h2><%=member.getMemNm() %>님의 구매내역</h2>
<hr>
<br>
<h4>검색 조건</h4>
<table border="0" id="searchBar">
<tr>
<td>상품 분류 : <select id="category">
				<option class="category" id="all" name="category" value="">전체</option> 
				<option class="category" id="book" name="category" value="P001">도서</option> 
				<option class="category" id="ebook" name="category" value="P002">eBook</option> 
			</select> </td>
<td>조회 기간 : <input type="radio" name="period" value="" checked="checked">전체
			 &nbsp;&nbsp;<input type="radio" name="period" value="30">30일 이내
			 &nbsp;&nbsp;<input type="radio" name="period" value="60">60일 이내
			 &nbsp;&nbsp;<input type="radio" name="period" value="90">90일 이내	
			 </td>
<td><input type="button" id="showResult" value="조회"></td>		
</tr>
			
</table>
<div id="resultView"></div>






</body>
</html>