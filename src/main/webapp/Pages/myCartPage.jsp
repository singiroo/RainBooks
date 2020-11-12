<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

	<style type="text/css">
		
		
		
		
		
		
		/* Remove the navbar's default margin-bottom and rounded borders */ 
	    .navbar {
	      margin-bottom: 0;
	      border-radius: 0;
	    }
	    
	    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
	    .row.content {height: 450px}
	    
	    /* Set gray background color and 100% height */
	    .sidenav {
	      padding-top: 20px;
	      background-color: #f1f1f1;
	      height: 100%;
	    }
	    
	    /* Set black background color, white text and some padding */
	    footer {
	      background-color: #555;
	      color: white;
	      padding: 15px;
	    }
	    
	    /* On small screens, set height to 'auto' for sidenav and grid */
	    @media screen and (max-width: 767px) {
	      .sidenav {
	        height: auto;
	        padding: 15px;
	      }
	      .row.content {height:auto;} 
	    }
		
		
		
		
		
		
		
		
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
		
		
		
		
		
		
		
		
		
		
		
		#CartShowTable{
			text-align: center;
		}
		#CartPage_emptyTd{
			width: 400px;
		}
		.checkBook{
			width: 5px;		
		}
		.CartBookName{
			width: 700px;
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
		
		
		
		#BkIsbn{
			visibility: hidden;
		}
		.hr_title{
			border: 2px solid red;
		}
		.navbar-brand img{
			width: 120px;
			height: 70px;
		}
		.navbar1{
			background: orange;
		}
		.navbar-right{
			color: blue;
		}
		.navbar-header{
			height: 100px;
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
		
		
		
		#buyBtn{
			height: 40px;
		}
		#delCartInfo{
			height: 40px;
		}
		
	</style>
	
	
<%-- 	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script> --%>
	<script type="text/javascript">
		$(function(){
			
			// 주문버튼 액션
			$('#buyBtn').on('click', function(){
				
				var cartNo = new Array();
				var bkIsbn = new Array();
				
				$('input[type=checkbox]:checked').each(function(i, v){
					
					// 선택한 상품의 수량 값 복사
					var getQty = $(this).parents('.mycartTr').find('.bkqty').text()
					
					
					if(getQty == '0'){	// 선택한 상품의 수량이 0일 경우 해당 tr을 삭제한다.
						$(this).parents('.mycartTr').remove();
					}else{	// 선택한 상품의 수량이 0이 아닐경우 해당 tr의 카트번호를 가져온다.
						cartNo[i] = $(this).parents('.mycartTr').find('.cartNo').val();
						bkIsbn[i] = $(this).parents('.mycartTr').find('.bkIsbn').val();
						
					}
				})
				
				if(cartNo.length > 0){
					$('input:checkbox:not(:checked)').parents('tr').remove(); // 선택하지 않은 tr삭제
					
					$('#selectByBookForm').attr('method', 'POST');
					$('#selectByBookForm').attr('action', 'OrderBook');
					$('#selectByBookForm').submit();
					
				}else{
					alert("구매할 상품을 선택해주세요.");
				}
				
			})
			
			
			$('#checkAll').on('click', function(){
				$("input[type=checkbox]").prop("checked",true); 
			})
			$('#checkRemoveAll').on('click', function(){
				$("input[type=checkbox]").prop("checked",false); 
			})
			
			
			
			
			
			// 수량변경 버튼
			$('.CartBookQty input:button').on('click', function(){
				
				btnNM = $(this).attr('name');
				
				
				// Down Button
				if(btnNM == 'qtyDown'){
					qty = $(this).parents('.CartBookQty').find('.bkqty').text();
					rowNum = parseInt(qty)-1;
					if(rowNum < 0) {
						rowNum = 0;
					}
					
					$(this).parents('.CartBookQty').find('.bkqty').text(rowNum);
					$(this).parents('.CartBookQty').find('.hiddenBkqty').val(rowNum);
				}
				
				// Up Button
				if(btnNM == 'qtyUp'){
					qty = $(this).parents('.CartBookQty').find('.bkqty').text();
					highNum = parseInt(qty)+1;
					
					$(this).parents('.CartBookQty').find('.bkqty').text(highNum);
					$(this).parents('.CartBookQty').find('.hiddenBkqty').val(highNum);
				}
			})
			
			
			
			
			
			// 삭제버튼 클릭
			$('#delCartInfo').on('click', function(){
				
				var delCartNoList = new Array();
				
				$('input[type=checkbox]:checked').each(function(i, v){
					delCartNoList[i] = $(this).parents('.mycartTr').find('.cartNo').val();
				})
				
				
				
				if(delCartNoList.length > 0){
					$('input:checkbox:not(:checked)').parents('tr').remove(); // 선택하지 않은 tr삭제
					
					$('#selectByBookForm').attr('method', 'POST');
					$('#selectByBookForm').attr('action', 'DeleteCart');
					$('#selectByBookForm').submit();
					
				}else{
					alert("삭제할 상품을 선택해주세요.");
				}
			})
			
		})
	</script>
	
	
	
	
	
	
</head>
<body>

	<jsp:include page="/Pages/main_nav_login.jsp"></jsp:include>
	<jsp:include page="myCartPage_content.jsp"></jsp:include>
<%-- 	<jsp:include page="myCartPage_footer.jsp"></jsp:include> --%>


</body>
</html>