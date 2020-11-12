<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookImgVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("member");
	List<BookVO> bookList = (List<BookVO>) request.getAttribute("bookList");
	List<BookImgVO> bkImgList = (List<BookImgVO>) request.getAttribute("bkImgList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>내 e-book 서재</title>
	<style type="text/css">
		
		img{
			width: 150px;
			height: 250px;
		}
		#myEbookTB{
			border-collapse: separate;
			border-spacing: 0 10px;
		}
		.myEbookTB_TD:hover{
			box-shadow: black;
		}
		.myEbookTB_TD{
			margin: 50px;
		}
		.myEbook_IMG:hover {
			box-shadow: 0 1px 10px rgba(0,0,0,2);
			cursor:pointer;
			background:#000000;
		  	opacity:inherit;
 			transition:all .2s linear;
 			transform:scale(1);	
		}
		.downOrViewBtn{
			display: list-item;
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
		
		.infocenter{
			float: left;
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/js/mypage.js"></script>
<%-- 	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script> --%>
	<script type="text/javascript">
	$(function(){
		
		
		$('.myEbookTB_TD').hover(function(){
				var tag = "<input class='downOrViewBtn' type='button' id='bkDownBtn' value='다운로드'/>";
			    $(this).append(tag);
			},function(){
			    $('#bkDownBtn').remove();
			})
			
			
			$('.myEbookTB_TD').on('click', '#bkDownBtn', function(){
				
				
				downIsbn = $(this).parents('.myEbookTB_TD').find('.myEbook_a_tag').attr('id');
				
				
				$('#selEbkDown').val(downIsbn)
				$('#selectEBookDownId').attr('action', 'MyebookDownload');
				$('#selectEBookDownId').attr('method', 'post');
				$('#selectEBookDownId').submit();
			})
			
		/* 비밀번호를 입력 받아 일치하면 회원의 정보 조회화면 출력 */
		$('#passCheck').on('click', function(){	
			$('#passResult').empty();
			memPw = $('#pwInput').val();
			memid = "<%=member.getMemId()%>";
			res="";
			if(memPw == "<%=member.getMemPass()%>"){
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
			$('#content').load('Pages/ordHistoryMain.jsp');
		})
		

	})
	</script>
	
	
	
	
</head>
<body>

	<div class="container-fluid text-center">    
	
	
		<div class="row content">
    	
    
    		<!-- 구매한 ebook, 이용권 ebook -->
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
	    
	    
	    
	    	
		    <div class="col-sm-4 text-left infocenter" id="content">
		   		<br>
		   		<h2><%= member.getMemNm() %>님의 책장</h2>
		   		<div>
		   		
		   			<table border="0" id="myEbookTB">
			   		<%
			   		int bookLineCount = 0;
			   		for(int book=0; book<bookList.size(); book++){
			   			
			   			BookVO bkVO = bookList.get(book);
		    			BookImgVO bkImgVO = bkImgList.get(book);
		    			
		    			if(bookLineCount == 0){
		    			%>
		    			<tr class="myEbookTB_TR">
		    			<%
		    			}
		    			
		    			for(int bkImgCount=0; bkImgCount<bkImgList.size(); bkImgCount++){
		    				if(bkVO.getImgId() == bkImgList.get(bkImgCount).getImgId()){
		    				%>
		    				<td class="myEbookTB_TD">
			    				<a class="myEbook_a_tag" href="<%= request.getContextPath() %>/MyebookViewer?myEbook_isbn=<%= bkVO.getBkIsbn() %>" id="<%= bkVO.getBkIsbn() %>">
<%-- 			    				<a class="myEbook_a_tag" href="<%= request.getContextPath() %>/eBookFiles/<%= bkVO.getFileId() %>.txt"> --%>
			    					<img name="myEbook_isbn" class="myEbook_IMG" alt="<%= bkImgList.get(bkImgCount).getImgNm() %>" id="<%= bkImgList.get(bkImgCount).getImgNm() %>"
			    					src="<%= request.getContextPath() %>/<%= bkImgList.get(bkImgCount).getImgPath() %>">
			    				</a>
			    				&nbsp;&nbsp;&nbsp;&nbsp;
		    				</td>
		    				<%
		    				}
		    			}
		    			if(bookLineCount == 2){
	    				%>
		    			</tr>
		    			<%
		    			bookLineCount = 0;
		    			}
		    			bookLineCount++;
			   		}
			   		%>
			   		</table>
		   			<form id="selectEBookDownId">
			   			<input type="hidden" name="selEbkDownIsbn" id="selEbkDown">
			   		</form>
		   		</div>
		   		
		    	
		    	
		    	<br>
		    </div>
		</div>
	</div>


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