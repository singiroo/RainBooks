<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
	List<CartVO> cartList = (List<CartVO>) request.getAttribute("cartList");
	List<BookVO> bookList = (List<BookVO>) request.getAttribute("bookList");
	List<Integer> cartQtyList = (List<Integer>) request.getAttribute("cartQtyList");
	
	String memId = member.getMemId();
	int myMile = member.getMemMile();
	int myEmoney = member.geteMoney();
	int selPrice = 0;
	for(int i=0; i<cartList.size(); i++){
		int price = cartList.get(i).getCartPrice();
		int qty = cartQtyList.get(i);
		selPrice += (price * qty);
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>구매 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
.navbar { margin-bottom: 0; border-radius: 0;}
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {height: 450px}
    /* Set gray background color and 100% height */
.sidenav {padding-top: 20px; background-color: #f1f1f1;height: 100%;}
    /* Set black background color, white text and some padding */
footer {background-color: #555;color: white;padding: 15px;}
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
.sidenav {height: auto;padding: 15px;}
.row.content {height:auto;} }
.infocenter *{text-align: center;}
#searchline{width: 400px;}
#priceText > div{display: inline-block;}
#myMoneyInfoShowLine{width: 600px;}
#buyInfoViewTitle{width: 600px;}
#bkTitleTd{width: 40%;}
#bkSelTd{width: 20%;}
#bkFixSelTd{width: 20%;}
#bkQtyTd{width: 20%;	}
#inputMilTable{width: 600px;}
#buyinfoEmptyArea{width: 200px;}
.buybkViewTable{width: 600px;}
.buybkTitleTd{width: 40%;}
.buybkSelTd{width: 20%;}
.buybkFixSelTd{width: 20%;}
.buybkQtyTd{width: 20%;	}
.calcText{font-weight: bold;font-size: 3em;}
#inOldOrdInfoTable{width: 600px;}
#inOldOrdInfoTable input, #inOldOrdInfoTable textarea{text-align:  left;}
#inNewOrdInfoTable{width: 600px;}
#inNewOrdInfoTable input, #inNewOrdInfoTable textarea{text-align:  left;}
#searchAddrBtn{vertical-align : top}
#resultPrice{width: 300px;}
#resultPrice tr{height: 40px;}
#inputMil{text-align: right;}
.moneyLine{text-align: center;}
</style>	
<%--   <script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script> --%>
<script type="text/javascript">
  	$(function(){
  		// 마일리지, e-money보유 현황 확인버튼 라인의 길이 설정
  		$('#myMoneyInfoShowLine td:odd').css('width', '300px');
  		// 취소(뒤로가기) 버튼 
  		$('#goMyPageBtn').on('click', function(){
  			$('#goBackOrPay').attr('action', "<%= request.getContextPath() %>/MyCartView");
  			$('#goBackOrPay').submit();
  		})
  		
  		
  		// 마일리지 조회 버튼 클릭
  		$('#showMil').on('click', function(){
  			
  			$('#myMilShow').text(<%= myMile %>);
  			
  		})
  		// e-money조회 버튼 클릭
  		$('#showEM').on('click', function(){
  			
  			
  			$.ajax({
  				url		: "<%= request.getContextPath() %>/selectMemberEmoney",
  				type	: "post",
  				data	: { "memId" : "<%= memId %>" },
  				dataType: "json",
  				
  				success	: function(res){
  					$('#myEMShow').text(res.sw);
  				},
  				error	: function(xhr){
  					alert("상태코드 : " + xhr.status);
  				}
  			})
  		})
  		
  		
  		
  		// 최종 결제 금액 초기 설정
  		$('#inMil').text('0원'); // 사용한 마일리지 텍스트
  		$('#payPrice').text(parseInt($('#bkPrice').text()) - parseInt($('#inMil').text()) + "원"); // 총 결제금액 텍스트
  		// 초기 결제정보 설정
  		$('#payCostMoney').val(parseInt($('#bkPrice').text()));
		$('#payMilege').val('0');
		$('#payResPrice').val(parseInt($('#bkPrice').text()) - parseInt($('#inputMil').val()));
  		// 마일리지 값이 바뀔때마다 최종 결제금액이 초기화
  		$('#inputMil').on('change', function(){
  			inMile = parseInt($('#inputMil').val());
  			respay = parseInt($('#bkPrice').text());
  			if(inMile > <%= myMile %>){ // 마일리지 부족
  				alert("마일리지 부족");
  				$('#inputMil').val('0');
  				$('#inMil').text('0 원');
  				$('#payPrice').text(parseInt($('#bkPrice').text()) + " 원");
  				inMile = 0;
  			}else{// 마일리지 충분
  				if(inMile > <%= selPrice %>){ // 마일리지가 총 결제 가격보다 많은 경우
  					$('#inputMil').val('0');
  	  				$('#inMil').text('<%= selPrice %> 원');
  	  				inMile = <%= selPrice %>;
  	  				respay = 0;
  	  				$('#payPrice').text(respay + " 원");
  				}else{ // 마일리지가 총 결제 가격보다 적은 경우
	  				respay = parseInt($('#bkPrice').text()) - parseInt($('#inputMil').val());
	  				$('#payPrice').text(respay + " 원");
	  				$('#inMil').text("-" + inMile + " 원");
  					$('#inputMil').val(0);
  				}
  			}
  			$('#payCostMoney').val(parseInt($('#bkPrice').text()));
  			$('#payMilege').val(inMile);
  			$('#payResPrice').val(respay);
  		})
  		// 결제버튼 클릭
  		$('#payBtn').on('click', function(){
  			//buyInfo = 'oldBuyInfo';
  			// 주문 양식서 미완료
  			if($('#orderRecvName').val() == "" || $('#orderPhoneNum').val() == "" || $('#orderAddr').val() == ""){
  				alert("주문 양식서를 마저 작성해주세요.");
  				return;
  			}else{	// 잔액확인
  				resPrice = parseInt($('#payResPrice').val());
  				if(resPrice > <%= myEmoney %>){	// 잔액부족 액션
  					alert("잔액부족");
  					//$('#PayInInfoForm').attr('action', 'InsertOrder');
  					//$('#PayInInfoForm').attr('method', 'POST');
	  				//$('#PayInInfoForm').submit();
  				}else{	// 잔액충분 액션
  					// 기존 배송정보 클릭되어 있는 경우
  					if(buyInfo == 'oldBuyInfo'){
  						$('#inNewOrdInfoTable').remove();
  					}
  					// 신규 배송정보 클릭되어 있는 경우
  					if(buyInfo == 'newBuyInfo'){
  						
  						if($('#NeworderRecvName').val() == "" || $('#NeworderPhoneNum').val() == "" 
  								|| $('#NeworderAddr').val() == "" || $('#orderNewInfoCd').val() == ""){
  							alert("주문 양식서를 마저 작성해주세요.");
  							return;
  						}else{
  							$('#inOldOrdInfoTable').remove();
  						}
  					}
	  				$('#PayInInfoForm').attr('action', 'InsertOrder');
	  				$('#PayInInfoForm').attr('method', 'POST');
	  				$('#PayInInfoForm').submit();
  				}
  			}
  		})
  		// 주문서 양식이 달라질 경우
  		buyInfo = $('input:radio').val();
  		$('input:radio').on('change', function(){
  			if($(this).val() == 'oldBuyInfo'){
  				buyInfo = 'oldBuyInfo';
  			}
  			if($(this).val() == 'newBuyInfo'){
  				buyInfo = 'newBuyInfo';  				
  			}
  		})
  		// 주문서 양식 => 배송지 설정
  		$('#inNewOrdInfoTable').hide();
  		$('#selBuyInfoRadioBtnTable input:radio').on('click', function(){
  			buyInfo = $(this).attr('id')
  			if(buyInfo == 'oldBuyInfo'){
  				$('#inOldOrdInfoTable').show();
  				$('#inNewOrdInfoTable').hide();
  			}
  			if(buyInfo == 'newBuyInfo'){
  				$('#inNewOrdInfoTable').show();
  				$('#inOldOrdInfoTable').hide();
  			}
  		})
  		// 배송지 선택버튼 클릭
  		$('#searchAddrBtn').on('click', function(){
  			var setting = "toolbar=0, status0, menubar=0, scrollbars=yes, height=400, width=600 top=300 left=200";
  			window.open("<%= request.getContextPath() %>/Pages/payPageAddrInput.jsp", "배송지 입력", setting);
  		})
  	})
  </script>
</head>
<body>
	<jsp:include page="/Pages/main_nav_login.jsp"></jsp:include>
	<jsp:include page="payPage_content.jsp"></jsp:include>
<%-- 	<jsp:include page="payPage_footer.jsp"></jsp:include> --%>
</body>
</html>