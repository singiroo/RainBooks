<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 .infocenter *{
 	text-align: center;
 
 }
#searchline{
	width: 400px;
}
</style>
<div class="container-fluid text-center">    
	<div class="row content">
		<div class="col-sm-2 sidenav">
			<p><a href="#">자주 묻는 질문</a></p>
			<p><a href="#">Q&A</a></p>
			<p><a href="#">공지사항</a></p>
			<p><a href="#">이용자 불편 신고</a></p>
		</div>
		<div class="col-sm-8 text-left infocenter"><br><br><br> 
			<div id="serviceTitle">
				<h2 id="serviceTitle_tabId">
					탭이름 = 변경가능
				</h2>
			</div>
			<hr>
			<div id="serviceContent">
				<form action="" id="serviceContent_Form">
					<div id="serviceContent_div">
						테이블
					</div>
					<div id="pageLine">
						앞, 페이지넘버들, 뒤 버튼생성
					</div>
				</form>
			</div>
		</div>
	</div>
</div>