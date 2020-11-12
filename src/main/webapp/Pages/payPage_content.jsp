<%@page import="kr.or.ddit.rb.cmm.vo.AddrVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.BookVO"%>
<%@page import="kr.or.ddit.rb.cmm.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CartVO> cartList = (List<CartVO>) request.getAttribute("cartList");
	List<BookVO> bookList = (List<BookVO>) request.getAttribute("bookList");
	List<Integer> cartQtyList = (List<Integer>) request.getAttribute("cartQtyList");
	MemberVO member = (MemberVO) session.getAttribute("member");
	
	AddrVO addrVO = (AddrVO) request.getAttribute("addrVO");
	
	String hp = member.getMemHp();
	
	int selPrice = 0;
	
	for(int i=0; i<cartList.size(); i++){
		int price = cartList.get(i).getCartPrice();
		int qty = cartQtyList.get(i);
		selPrice += (price * qty);
	}
%>    
    
    
    
    
<style>
	
	/* content 상단의 메뉴바 크기 고정  */
	body{
	 	min-width: 1700px; 
	}
	#myNavbar{
	 	box-sizing : border-box; 
	}
	.container-fluid{
	 	min-width: 2000px; 
	}
	#payShow{
		height: 500px;
	}
	
	
</style>


<div class="container-fluid text-center">    

	<div class="col-sm-6 text-left infocenter">
	
		<br><br><br>
	 
		
		<table id="myMoneyInfoShowLine" align="center" border="1">
			<tr>
				<td><input id="showMil" type="button" value="마일리지 조회"></td>
				<td><span id="myMilShow"></span></td>
				<td><input id="showEM" type="button" value="E-MONEY 조회"></td>
				<td><span id="myEMShow"></span></td>
			</tr>
		</table>
		
		
		
		
      
		<br><br><br>
		
		<!-- 표시 타이틀바 -->
	 	<div id="buyBooksInfo">
	 	
	 		<table align="center" id="buyInfoViewTitle" border="1">
	 			<tr>
	 				<td id="bkTitleTd">책 제목</td>
	 				<td id="bkSelTd">정가</td>
	 				<td id="bkFixSelTd">레인북스 판매가</td>
	 				<td id="bkQtyTd">수량</td>
	 			</tr>
	 		</table>
	 	</div>
	 		
	 		
	 	<br>
	 		
	 		
	 		
		<form id="PayInInfoForm">
	 		
	 		<!-- div id가 buyBooksInfo_show인 div를 
	 			  구매하려는 책하나에 하나씩 생성 후 buyBooksInfo에 append -->
	 		<div id="buyBooksInfo_show">
	 		
	 		
	 			<table class="buybkViewTable" border="0" align="center">
				<%
					for(int i=0; i<cartList.size(); i++){
					%>
					<tr class="buybkTR">
						<input type="hidden" name="buyCartNo" value="<%= cartList.get(i).getCartNo() %>">
						<input type="hidden" name="buyCartQty" value="<%= cartQtyList.get(i) %>">
						<td class="buybkTitleTd"><span><%= bookList.get(i).getBkNm() %></span></td>
						<td class="buybkFixSelTd"><span><%= bookList.get(i).getBkFixPrice() %></span></td>
						<td class="buybkSelTd"><span><%= bookList.get(i).getBkSelPrice() %></span></td>
						<td class="buybkQtyTd"><span><%= cartQtyList.get(i) %></span></td>
					</tr>
					<%
					}
				%>	 			
	 			</table>
	 		</div>
	 		
	 		<br><br><br>
	 		
	 		<hr>
	 		
	 		
	 		<table id="inputMilTable" align="center">
	 			
	 			<tr>
	 				<td>사용할 마일리지 입력</td>
	 				<td><input id="inputMil" name="inputMil" type="number" value="0"></td>
	 			</tr>
	 			
	 		</table>
	 		
	 		
	 		
	 		<br><br><br>
	 		
	 		
			<div id="inputOrderInfoDiv">
			
				<table id="selBuyInfoRadioBtnTable" align="center">
					<tr>
						<td id="oldBuyInfo"><input type="radio" id="oldBuyInfo" name="buyInfoRadio" value="oldBuyInfo" checked>기존 배송정보</td>
						<td id="buyinfoEmptyArea"> </td>
						<td id="newBuyInfo"><input type="radio" id="newBuyInfo" name="buyInfoRadio" value="newBuyInfo">신규 배송정보</td>
					</tr>
				</table>
				
				<br><br>

				
			
				<div id="basicBuyInfoDiv">
					<table align="center" id="inOldOrdInfoTable" border="0">
					
						<tr>
							<td>수취인 이름</td>
							<td align="left"><input class="indata" type="text" name="orderRecvName" id="OldorderRecvName" value="<%= member.getMemNm() %>" readonly>
							<br><br></td>
						</tr>
						
						
						<tr>
							<td>연락처</td>
							<td align="right"><input class="indata" type="text" name="orderPhoneNum" id="OldorderPhoneNum" value="<%= member.getMemHp() %>" readonly>
							<br><br></td>
						</tr>
						
						
						<tr>
							<td>배송 주소</td>
							<td>
								<input type="hidden" name="memberAddrInfoCode" value="<%= member.getAddrSq() %>">
								<textarea class="indata" rows="2" cols="50" name="orderAddr" id="OldorderAddr" style="resize: none;" readonly><%= addrVO.getAddrSido() %> <%= addrVO.getAddrGugun() %> <%= addrVO.getAddrDong() %> <%= addrVO.getAddrBunji() %> 
								</textarea>
							</td>
						</tr>
						
						
						<tr>
							<td>상세 주소</td>
							<td>
								<input type="text" name="memberAddrDetailInfo" value="<%= member.getAddrDetail() %>">
							</td>
						</tr>
						
					</table>
				</div>
				
				
				
				
				<div id="newBuyInfoDiv">
					<table align="center" id="inNewOrdInfoTable" border="0">
					
						<tr>
							<td>수취인 이름</td>
							<td align="left"><input class="indata" type="text" name="orderRecvName" id="NeworderRecvName"><br><br></td>
						</tr>
						
						
						<tr>
							<td>연락처</td>
							<td align="right"><input class="indata" type="text" name="orderPhoneNum" id="NeworderPhoneNum"><br><br></td>
						</tr>
						
						
						<tr>
							<td>배송 주소</td>
							<td>
								<input type="hidden" name="memberAddrInfoCode" id="orderNewInfoCd">
								<textarea class="indata" rows="2" cols="50" name="orderAddr" id="NeworderAddr" style="resize: none;" readonly>
								</textarea>
								<input type="button" id="searchAddrBtn" value="주소검색" >
							</td>
						</tr>
						
						
						<tr>
							<td>상세 주소</td>
							<td>
								<input type="text" name="memberAddrDetailInfo">
							</td>
						</tr>
						
					</table>
				</div>
	 			
					
			</div>
			
			
			<!-- 서버로 보낼 데이터(상품 총 금액, 사용한 마일리지, 최종 결제금액) -->
			<input type="hidden" name="payCostMoney" id="payCostMoney">
			<input type="hidden" name="payMilege" id="payMilege">
			<input type="hidden" name="payResPrice" id="payResPrice">
	 		
		</form>	
		 			
		 			
		<br><br><br>
		 			
      
	</div>
    
    
    
    
    
    <div class="col-sm-3 sidenav" id="payShow">
    
		<form id="goBackOrPay">	
		
	 		<table align="center" id="resultPrice" border="1">
				<tr>
					<td>
						<span>총 상품 금액</span>
					</td>
					
					<td class="moneyLine">
						<span id="bkPrice"><%= selPrice %> 원</span>
					</td>
				</tr>
				
				<tr style="font-size: 10px; color: red">	
					<td>
						<span>마일리지 사용금액</span>
					</td>
					
					<td class="moneyLine">
						<span id="inMil"></span>
					</td>
				</tr>
					
				<tr>	
					<td>
						<span>총 결제 금액</span>
					</td>
					
					<td class="moneyLine">
						<span id="payPrice"></span>
					</td>
				</tr>
			</table>
		 		
		 	
		 	
		 	
		 	<br><br><br><br><br>
		 	
		 	
		 	
			
			
		 	<div>
				<input id="goMyPageBtn" type="button" value="취소">		
				<input id="payBtn" name="payBtn" type="button" value="결제">	 		
		 	</div>
		 	<br><br>
		 	
		</form>
	 	
    </div>
  
</div>