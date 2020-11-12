<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% MemberVO member = (MemberVO)session.getAttribute("member"); 

%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<meta charset="utf-8">
<script src="<%= request.getContextPath() %>/js/mypage.js"></script>
<script>
$(function(){
	/* 비밀번호를 입력 받아 일치하면 회원의 정보 조회화면 출력 */
	$('#passCheck').on('click', function(){	
		$('#passResult').empty();
		memPw = $('#pwInput').val();
		memid = "${member.memId}";
		res="";
		if(memPw == "${member.memPass}"){
			showMyInfo(memid);
			$('#myModal').modal('hide');
			$('#pwInput').empty();
		}else{
			res = '<br><p>비밀번호가 일치하지 않습니다.</p>';
			$('#passResult').html(res);
		}
	})
	/* 비밀번호를 입력받아 회원의 탈퇴 처리  */
	$('#passCheck2').on('click', function(){	
		$('#passResult2').empty();
		memPw2 = $('#pwInput2').val();
		memid2 = "<%=member.getMemId()%>";
		res="";
		if(memPw2 == "<%=member.getMemPass()%>"){
			delMem(memid2);
			$('#delModal').modal('hide');
			$('#pwInput2').empty();
		}else{
			res = '<br><p>비밀번호가 일치하지 않습니다.</p>';
			$('#passResult2').html(res);
		}
	})
	
	/* 회원의 아이디를 입력받아 emoney 관리 화면(조회/충전)을 출력   */
	$('#emoney').on('click', function(){
		$.ajax({
			url : '/RainBooks/eMoney?memId='+"<%=member.getMemId()%>",
			type : 'get',
			success : function(res){
				$('#content').empty();
				$('#content').html(res);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
		})	
	})
	/* 회원의 아이디를 입력받아 회원의 마일리지 조회화면을 출력  */
	$('#mileage').on('click', function(){
		$.ajax({
			url : '/RainBooks/mileage?memId='+"<%=member.getMemId()%>",
			type : 'get',
			success : function(res){
				$('#content').empty();
				$('#content').html(res);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
		})	
	})
	/* 회원의 아이디를 입력받아 주문내역 조회 화면을 출력 */
	$('#ordHistory').on('click', function(){
		$('#content').empty();
		$('#content').load('ordHistoryMain.jsp');
	})
		
})
</script>
<style>
	
	#searchline{
		width: 400px;
	}
	
	#passResult,#passResult2{
		text-align : center;
		color : red;
		font-size : 15px;
	}
	
	#memInfo{
		text-align : left;
	}
	#memInfo .genre{
		text-align : left;
	}
	
	input.menubtn{
		width : 160px;
	}
	
	
	
	
	
	
	/* content 상단의 메뉴바 크기 고정  */
	body{
	 	min-width: 1700px; 
	}
	#myNavbar{
	 	box-sizing : border-box; 
	}
	.container-fluid{
	 	min-width: 1800px; 
	}
	body{
		font-family: fantasy;
	}
	
</style>
</head>
<body>
<div class="container-fluid text-center">    

	<div class="row content">
    
		<div class="col-sm-2 sidenav">
	      <p><input type="button" id="ordHistory" class="btn btn-info btn-lg menubtn"  value="구매내역"></a></p>
	      <p><a href="<%= request.getContextPath() %>/MyCartView"><input type="button" class="btn btn-info btn-lg menubtn" value="장바구니"></a></p>
<!-- 	      <p><a href="#">ebook 구독권</a></p> -->
	      <p><a href="<%= request.getContextPath() %>/MyEbookPage"><input type="button" id="ebook" class="btn btn-info btn-lg menubtn"  value="내 eBook 책장"></a></p>
	      <p><input type="button" id="myInfo" class="btn btn-info btn-lg menubtn" data-toggle="modal" data-target="#myModal" value="내 정보 관리"></p>
	      <p><input type="button" id="mileage" class="btn btn-info btn-lg menubtn"  value="마일리지 조회"></p>
	      <p><input type="button" id="emoney" class="btn btn-info btn-lg menubtn"  value="E-MONEY 관리"></p>
	      <p><input type="button" id="deleteAccount" class="btn btn-info btn-lg menubtn" data-toggle="modal" data-target="#delModal" value="회원 탈퇴"></p>
	    </div>
    
	    <div class="col-sm-6 text-left infocenter" id="content">
		    <p>
		    	마이페이지
		    </p> 
		    <br><br><br>
		    
		    <div>
		    
		      <form action="">
		      	<div id="selectMyTab">
		      		<p>
		      			좌측 탭 이름
		      		</p>
		      	</div>
		      	<div id="tabTableLine">
		      		탭 라인 정보 출력
		      	</div>
		      </form>
		    
		    </div>
		    <hr>
		      
	    </div>
  
  
	</div>
	
</div>

  <!-- Trigger the modal with a button -->
<!--   <input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">확인</button> -->

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 인증</h4>
        </div>
        <div class="modal-body">
          <p>인증을 위해 비밀번호를 입력해주세요.</p>
          <input type="password" id="pwInput" name="pwInput">
          <input type="button" class="btn btn-default" id="passCheck" value="확인">
          <div id="passResult"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  
  <div> 
  <div class="modal fade" id="delModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 인증</h4>
        </div>
        <div class="modal-body">
          <p>인증을 위해 비밀번호를 입력해주세요.</p>
          <input type="password" id="pwInput2" name="pwInput2">
          <input type="button" class="btn btn-default" id="passCheck2" value="확인">
          <div id="passResult2"></div>
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