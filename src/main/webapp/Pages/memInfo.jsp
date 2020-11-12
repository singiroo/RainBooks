<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookGenreVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.rb.cmm.vo.AddrVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
	
	<c:choose>
		<c:when test="${member.memGender == 1 }">
			<c:set var="gend" value="남성"/>
		</c:when>
		<c:otherwise>
			<c:set var="gend" value="여성"/>
		</c:otherwise>
	</c:choose>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 조회 화면</title>
<script src="../js/mypage.js"></script>
<script>
$(function(){
	$('#update').on('click',function(){
		$('.updateMyinfo').show();
		$('#addr2').prop('readonly', false);
		$(this).hide();
	})
	
	$('#memInfo .updateMyinfo').on('click', function(){
		$(this).prev().prop('readonly', false);	
	})
	
	$('#updateSubmit').on('click', function(){
		info = $('#memInfoForm').serialize();
		
		updateMyInfo(info);

	})
	
	$('#addrSearch').on('click', function(){
		addrKey = $('#addrInput').val();
		
		addrSearch(addrKey);
			
	})
	
	$('#addrResult').on('click','.addrCont', function(){
		seq = $(this).prev().val();
		zip = $('td:first', this).text();
		addr1 = $('.addrResult', this).text();

		$('#addrHidden').val(seq);
		$('#zip').val(zip);
		$('#addr1').val(addr1);		
		$('#addrModal').modal('hide');
		$('#addrResult').empty();
		$('#addrInput').empty();
		
		
		
		
	})
	
	
	
	
	
})





</script>
<style>

#addr1, #addr2{
	width : 400px;
}
label{
	width : 200px;

}
#genre{
	display: inline-block;
	vertical-align: text-top;
}
#genre td{
	width : 200px;
}

body .updateMyinfo{
	display : none;
}
#addrTab td{
	text-align : center;
	
}
#addrTab .addrCont:hover{
	background : pink;
}

#addrTab .addrResult{
	width : 800px;
}


</style>

</head>
<body>
	<form id="memInfoForm" action="/RainBooks/updateInfo" method='post'>
	<fieldset id="memInfo">
		<legend>${member.memNm}님의 회원 정보</legend>
		<hr>
		<label>ID :</label> 
		<input type="text" name="memId" value="${member.memId}" readonly="readonly">
		<hr>
		<label>비밀번호 :</label> 
		<input type="password" name="memPass" value="${member.memPass}" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updatePass" value="변경하기" >
		<hr>
		<label>이름 :</label> 
		<input type="text" name="memNm" value="${member.memNm}" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updateName" value="변경하기">
		<hr>
		<label>성별 :</label> 
		${gend}
		<hr>
		<label>생년월일 :</label>
		<fmt:parseDate var="memBir" value="${member.memBir}" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${memBir}" pattern="yyyy-MM-dd"/>
		<hr>

		<label>우편번호 :</label>
		<input type="hidden" id="addrHidden" name="addrSq" value="${member.addrSq}"> 
		<input type="text" class="addrInfo" id="zip" value="${memAddr.addrZip}">
		<input type="button" class="updateMyinfo" id="updateAddr" data-toggle="modal" data-target="#addrModal" value="우편번호 검색">
		<hr>
		<label>기본주소 :</label> 
		<input type="text" class="addrInfo" id="addr1" value="${memAdrr.addrSido} ${memAddr.addrGugun} ${memAddr.addrDong}" readonly="readonly">
		<hr>
		<label>상세주소 :</label> 
		<input type="text" class="addrInfo" name="addrDetail"  id="addr2" value="${member.addrDetail}" readonly="readonly">

		<hr>
		<label>전화번호 :</label> 
		<input type="text" id="phone" name="memHp" value="${member.memHp}" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updatePhone" value="변경하기">
		<hr>
		<label>메일 :</label> 
		<input type="text" name="memMail" id="email" value="${member.memMail}" readonly="readonly">
		<input type="button" class="updateMyinfo" id="updateMail" value="변경하기">
		<hr>
		<label>관심장르 :</label>
		<table id="genre">
				
				<c:forEach var="genre" items="${genreList}" varStatus="stauts">
					<tr><td>${status.index } ${genre.bkGreNm }</td></tr>
				
				</c:forEach>
		</table>
		<input type="button" class="updateMyinfo" id="updateGenre" value="변경하기">		
		<hr>
	</fieldset>
	</form>
	<input type="button" class="updateMyinfo" id="updateSubmit" value="확인">
	<input type="button" id="update" value="수정하기">
	
	 <!-- Modal -->
 <div> 
  <div class="modal fade" id="addrModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">우편번호 검색</h4>
        </div>
        <div class="modal-body">
          <p>원하는 주소를 입력해주세요..</p>
          <input type="text" id="addrInput" name="addrInput" value="">
          <input type="button" class="btn btn-default" id="addrSearch" value="검색">
          <div id="addrResult"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>
	
	
</body>
</html>