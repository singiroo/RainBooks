<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	MemberVO member = (MemberVO)session.getAttribute("member"); 
	List<CartVO> cartList = (List<CartVO>) request.getAttribute("cartList");
	List<BookVO> bookList = (List<BookVO>) request.getAttribute("bookList");
	
	int money = 0;
	int point = 0;
	for(int i=0; i<cartList.size(); i++){
		money += cartList.get(i).getCartPrice();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<meta charset="utf-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/js/mypage.js"></script>
<script>
$(function(){
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
	
	
	
	
	
	
	
	
	
	
	/* 상품 정보 표시 타이틀 */
	#CartPageTitle{
		max-width: 1300px;
	}
	.checkBookT{
		width: 5px;		
	}
	.CartBookNameT{
		width: 600px;
	}
	.CartBookSelPriceT{
		width: 300px;
	}
	.CartBookFixPriceT{
		width: 300px;
	}
	.CartBookQtyT{
		width: 150px;
	}
	
	
	
	
	
	
	
	
	#CartPage_emptyTd{
		width: 400px;
	}
	.checkBook{
		width: 5px;		
	}
	.CartBookName{
		width: 620px;
	}
	.CartBookSelPrice{
		width: 250px;
	}
	.CartBookFixPrice{
		width: 250px;
	}
	.CartBookQty{
		width: 150px;
	}
	.mycartTr:hover{
		background: yellow;
	}
	
	
	
	
	
	
	
	#checkAll{
		color: white;
		background: green;
		border-radius: 20px;
	}
	#checkRemoveAll{
		color: white;
		background: red;			
		border-radius: 20px;
	}
	
	#CheckBtnDiv{
		display: inline-block;
		width: 200px;
	}
	#CheckAndBuy_emptyTd{
		width: 75%;
	}
	#CheckAndBuy_emptyTdTow{
		width: 2%;
	}
	
	
	
	
	#myCartRoundLine .hr_title{
		text-align: left;
		width: 1200px;
	}
	
	
	
	
	
	#buyBtn{
		height: 40px;
	}
	#delCartInfo{
		height: 40px;
	}
	
	
	
	
	
	
	
	
	/* content 상단의 메뉴바 크기 고정  */
	body{
	 	min-width: 1600px; 
	}
	#myNavbar{
	 	box-sizing : border-box; 
	}
	.container-fluid{
	 	min-width: 1800px; 
	}
	#myCartRoundLine{
		margin-left: -250px;
	}
	body{
		font-family: fantasy;
	}
	
	
	
	
	
	
	
	/* content 상단의 메뉴바 크기 고정  */
	body{
	 	min-width: 1800px; 
	}
	#myNavbar{
	 	box-sizing : border-box; 
	 	min-width: 1800px; 
	}
	.container-fluid{
	 	min-width: 1800px; 
	}
	.dropdown-toggle{
		height: 55px;
	}
	.dropdown.open{
		height: 55px;
	}
	#ba{
		height: 55px;			
	}
	
	
	
	
</style>
</head>
<body>
<%-- <%=member %> --%>
	<div class="container-fluid text-center">    
		
		
		<div class="row content">
		  
			<div class="col-sm-2 sidenav">
		      <p><input type="button" id="ordHistory" class="btn btn-info btn-lg menubtn"  value="구매 내역"></a></p>
		      <p><a href="<%= request.getContextPath() %>/MyCartView"><input type="button" class="btn btn-info btn-lg menubtn" value="장바구니"></a></p>
<!-- 		      <p><a href="#">ebook 구독권</a></p> -->
		      <p><a href="<%= request.getContextPath() %>/MyEbookPage"><input type="button" id="ebook" class="btn btn-info btn-lg menubtn"  value="내 eBook 책장"></a></p>
		      <p><input type="button" id="myInfo" class="btn btn-info btn-lg menubtn" data-toggle="modal" data-target="#myModal" value="내 정보 관리"></p>
		      <p><input type="button" id="mileage" class="btn btn-info btn-lg menubtn"  value="마일리지 조회"></p>
		      <p><input type="button" id="emoney" class="btn btn-info btn-lg menubtn"  value="E-MONEY 관리"></p>
		      <p><input type="button" id="deleteAccount" class="btn btn-info btn-lg menubtn" data-toggle="modal" data-target="#delModal" value="회원 탈퇴"></p>
		    </div>
		    
		    
		    
		    
		    
		    <div class="col-sm-6 text-left infocenter" id="content">
			    <h2><%= member.getMemNm() %>님의 장바구니 </h2>
			    <br><br><br>
			    
			    <div id="myCartRoundLine">
			    
			    	<table id="CheckAndBuybtnLine">
			    		<tr>
			    			<td id="CheckBtnDiv">
			    				<input type="button" id="checkAll" value="선택">
			    				<input type="button" id="checkRemoveAll" value="해제">
			    			</td>
			    			<td id="CheckAndBuy_emptyTd"> </td>
			    			<td id="buyBtnDiv"><input type="button" id="delCartInfo" value="삭제"></td>
			    			<td id="CheckAndBuy_emptyTdTow"> </td>
			    			<td id="buyBtnDiv"><input type="button" id="buyBtn" value="주문"></td>
			    		</tr>
			    	</table>
			    	
			    	
			    	  
			      	
			      	<hr class="hr_title">
			      	
			      	
			      	<div id="CartPageTitle">
			      		<table id="CartPage">
			      			<tr>
			      				<td id="CartPage_emptyTd"> </td>
			      				<td class="CartBookNameT"> 상품명 </td>
								<td class="CartBookSelPriceT"> 정가 </td>
								<td class="CartBookFixPriceT"> 레인북스 판매가 </td>
								<td class="CartBookQtyT"> 수량 </td>
							</tr>
			      		</table>
			      	</div>
			      	
			      	
			      	
			      	
					<hr class="hr_title">
					
					
					
			      	<form name="selectByBookForm" id="selectByBookForm">
				      	<div id="tabTableLine">
				      		
							<table id="CartShowTable">
							
							<%
							for(int i=0; i<bookList.size(); i++){
							%>
								<tr class="mycartTr" id="tr<%= i+1 %>">
									<input class="cartNo" name="cartNo" type="hidden" value="<%= cartList.get(i).getCartNo() %>">
									<input class="bkIsbn" name="bkIsbn" type="hidden" value="<%= cartList.get(i).getBkIsbn() %>">
									<td class="checkBook">
										<span><input type="checkbox" class="ckbox"></span>
									</td>
									<td class="CartBookName"><span><%= bookList.get(i).getBkNm() %></span></td>
									<td class="CartBookFixPrice"><span><%= bookList.get(i).getBkFixPrice() %></span></td>
									<td class="CartBookSelPrice"><span><%= bookList.get(i).getBkSelPrice() %></span></td>
									<td class="CartBookQty">
										<%
											if(bookList.get(i).getProdCd().equals("P001")){
											%>
											<input name="qtyDown" type="button" value="<">
											<span class="bkqty"><%= cartList.get(i).getCartQty() %></span>
											<input class="hiddenBkqty" type="hidden" name="bkqty" value="<%= cartList.get(i).getCartQty() %>">
											<input name="qtyUp" type="button" value=">">
											<%
											}else{
											%>
											<input name="" type="button" value="<">
											<span class="bkqty">1</span>
											<input class="" type="hidden" name="bkqty" value="1">
											<input name="" type="button" value=">">
											<%
											}
										%>
									</td>
								</tr>
							<%
							}
							%>
								
							</table>	
				      	</div>
			      	</form>
			    
			    
			    </div>
			    
			      
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