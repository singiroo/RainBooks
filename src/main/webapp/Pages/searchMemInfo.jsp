<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = request.getParameter("msg");
	if(msg == null){
		msg = "";
	}
%>
    
    
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		
		//주문서 양식이 달라질 경우
		searchInfo = $('input:radio').val();
		$('input:radio').on('change', function(){
			if($(this).val() == 'searchPassVal'){
				searchInfo = 'searchPassVal';
			}
			if($(this).val() == 'searchIdVal'){
				searchInfo = 'searchIdVal';  				
			}
		})
		
		
		$('#searchPassTable').hide();
		$('#searchIdPassRadioTable input:radio').on('click', function(){
			searchInfo = $(this).attr('id')
			if(searchInfo == 'searchPassBtn'){
				$('#searchPassTable').show();
				$('#searchIdTable').hide();
			}
			if(searchInfo == 'searchIdBtn'){
				$('#searchIdTable').show();
				$('#searchPassTable').hide();
			}
		})
		
		$('#searchMemInfoBtn').on('click', function(){
			alert("test");
		})
		
		
		
		
		// 아이디 찾기
		$('#searchMemIdBtn').on('click', function(){

			
  			if($('#idInputName').val() == "" || $('#idInputTel').val() == ""){
  				alert("회원정보를 입력해 주세요");
  				return;
  			}else{
  				$('#searchPassTable').hide();
  				$('#searchInfoForm').attr('action', '<%= request.getContextPath() %>/FindIdServlet');
  				$('#searchInfoForm').attr('method', 'POST');
  				$('#searchInfoForm').submit();
  			}
  		})
  		
  		
  		
  		
  		
  		// 비밀번호 찾기 => 변경
  		$('#searchMemPassBtn').on('click', function(){

			
  			if($('#passInputId').val() == "" || $('#passInputName').val() == ""){
  				alert("회원정보를 입력해 주세요");
  				return;
  			}else{
  				$('#searchIdTable').hide();
  				$('#searchInfoForm').attr("action", "<%= request.getContextPath() %>/FindPasswordServlet");
  				$('#searchInfoForm').attr('method', 'POST');
  				$('#searchInfoForm').submit();
  			}
  		})
  		
  		
  		$('.goBackBtn').on('click', function(){
  			$('#searchInfoForm').attr("action", "<%= request.getContextPath() %>/Main");
  			$('#searchInfoForm').submit();
  		})
		
  		
  		
  		
  		<%
  		if(msg.equals("전송성공")){
  		%>
  		alert("이메일을 체크해주세요.");
  		<%
  		}
  		%>
  		
  		
  		<%
  		if(msg.equals("회원없음")){
  		%>
  		alert("일치하는 회원이 없습니다.");
  		<%
  		}
  		%>
		
	})
	
	
	
</script>
	




<style>
	#login_wrapper{padding:1px; position:absolute; top:10%; left:35%; width: 500px; height: 600px;}
	#loginForm{width:500px;}
	#loginForm > div {display:flex; justify-content: center; padding-bottom: 7px; align-items: center;}
	#logo{width:200px; height: 150px; margin-left:140px; }
	input{width:400px; height: 70px; font-size: 1.3em; NanumBarunGothicBold; font-weight:bold;  
		  border-radius: 4px 4px 4px 4px; line-height: 50px; box-sizing: border-box;
		padding: 0 15px; border: solid 1px #dbdbdb; background-color: #ffffff;}
	pwInput{margin-top: -20px;}
	button{width:400px; height: 70px; margin: 20px 0; padding: 13px 15px; font-size: 17px; line-height: 1.41; 
		margin-left: 50px; NanumBarunGothicBold; font-weight:bold; background: #F26000; color: white; outline: 0; border-width: 1px; 
		border-style: solid; border-radius: 4px}
	a{font-size:18px; NanumBarunGothicBold; font-weight:bold; ;}
	#find_login{margin-left: 10px;}
	#inputResult{margin-left: 35px;}
	
	
	#searchInputtext *{
		font-size: 12px;
		font-weight: bold;
	}
	input{
		width: 300px;
		height: 50px;
	}
	
	.radioBtn{
		width: 80px;
		height: 20px;
	}
	#titleLine{
		text-align: center;
	}
	#inputBtnDiv{
		text-align: center;
	}
	input[type=button]{
		width: 100px;
		height: 50px;
	}
	td{
		width: 150px;;
	}
	#searchIdPassRadioTable td{
		width: 200px;
	}
	
	
	
</style>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	


	<div id="login_wrapper" style="border: 15px solid #F49D6E;">
		<form id="loginForm" action="<%= request.getContextPath() %>/memberLogin" method="post" >
			<img id="logo" src="<%=request.getContextPath() %>/images/로고.png" alt="로고">
		</form>
		<h4 id="titleLine">아이디/비밀번호 찾기</h4>
		
		<br>
		<br>
		
		<div id="searchInputtext">
			
			<form id="searchInfoForm">
 		
		 		
				<div id="searchIdPassIfoDiv">
					<table id="searchIdPassRadioTable" align="center">
						<tr>
							<td id="searchIdTd"><input type="radio" class="radioBtn" id="searchIdBtn" name="searchInfoRadio" value="searchIdVal" checked>아이디 찾기</td>
							<td id="searchPassTd"><input type="radio" class="radioBtn" id="searchPassBtn" name="searchInfoRadio" value="searchPassVal">비밀번호 찾기</td>
						</tr>
					</table>
					
					
					<br><br>
	
					
				
					<div id="searchIdDiv" class="inputdataTableDiv">
						<table align="center" id="searchIdTable" border="0">
						
							<tr>
								<td>이름을 입력해주세요</td>
								<td align="left"><input class="indata" type="text" name="idInputName" id="idInputName"><br><br></td>
							</tr>
							
							
							<tr>
								<td>전화번호를 입력해주세요</td>
								<td align="right"><input class="indata" type="text" name="idInputHp" id="idInputTel"><br><br></td>
							</tr>
							
							<tr align="center">
								<td colspan="2">
									<input type="button" id="searchMemIdBtn" value="아이디 찾기">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="goBackBtn" value="메인으로">
								</td>
							</tr>
						</table>
					</div>
					
					
					
					
					<div id="searchPassDiv" class="inputdataTableDiv">
						<table align="center" id="searchPassTable" border="0">
						
							<tr>
								<td>아이디를 입력해주세요.</td>
								<td align="left"><input class="indata" type="text" name="passInputId" id="passInputId"><br><br></td>
							</tr>
							
							
							<tr>
								<td>이름을 입력해주세요</td>
								<td align="right"><input class="indata" type="text" name="passInputName" id="passInputName"><br><br></td>
							</tr>
							<tr align="center">
								<td colspan="2">
									<input type="button" id="searchMemPassBtn" value="비밀번호 찾기">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="goBackBtn" value="메인으로">
								</td>
							</tr>
						</table>
					</div>
		 			
						
				</div>
				
		 		
			</form>
			
		</div>
		
		
	</div>
	
</body>
</html>