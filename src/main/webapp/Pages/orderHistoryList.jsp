<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% List<Map<String, String>> mapList = (List<Map<String, String>>)request.getAttribute("mapList");
 	
 	int listSize = mapList.size();
 	int sameOrd = 0;
 	int totalPrice = 0;
 	int baseIdx = 0;
 	int cnt=0;
 	int ordStCd = 0;
 	String ordSt ="";
 	
 %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매내역 리스트 출력</title>
<script src="<%=request.getContextPath() %>/js/ordHistory.js"></script>
<script>
$(function(){
// 	$('#ordHistoryList .resultList').on('click', function(){
		
// 		ordNum  = $('td.ordNo', this).text();
// 		showOrdHistoryDetail(ordNum);
// 	})
	
	
	$('#ordHistoryList .ordCancel').on('click', function(){
	
		ordNo = $(this).parents('tr.resultList').find('td.ordNo').text();
		ordSt = $(this).prev().val();
// 		console.log(ordNo);
		ordCancel(ordNo, ordSt);
		
	})
	
	$('#ordHistoryList .ordRefund').on('click', function(){
		
		ordNo = $(this).parents('tr.resultList').find('td.ordNo').text();
		ordSt = $(this).prev().val();
// 		console.log(ordNo);
		ordRefund(ordNo, ordSt);
		
	})
	
	$('#ordHistoryList .ordRecvComp').on('click', function(){
		
		ordNo = $(this).parents('tr.resultList').find('td.ordNo').text();
		ordSt = $(this).prev().val();
// 		console.log(ordNo);
		ordComp(ordNo, ordSt);
		
	})
	

	
	
	
})

</script>
<style>
	#ordHistoryList td,th{
		width : 200px;
		text-align : center;
		height : 40px;
	
	}
	#ordHistoryList .bklist{
		width : 600px;
	}
	
/* 	#ordHistoryList .resultList:hover{ */
/* 		background : lightgreen; */
/* 		border : 3px solid pink; */
/* 		font-weight : bold; */
/* 	} */
	
	
</style>
</head>
<body>
<div id="ordHistoryDiv">
<table id="ordHistoryList" border="0">

<tr>
<th>순번</th>
<th>주문 번호</th>
<th>주문 일자</th>
<th>주문 내역</th>
<th>결제 금액</th>
<%if(request.getParameter("category").equals("P001")){ %>
<th>주문 상태</th>
<%} %>
<th>주문자명</th>
</tr>

<%
	if(listSize == 0){
%>	
		<tr><td colspan="7">해당 결과가 존재하지 않습니다.</td></tr>
<%		
	}else{
 	String ordNo = mapList.get(0).get("ordNo");
 	String bkNm = mapList.get(0).get("bkNm");
		for(int i=0; i<listSize;i++){
			if(ordNo.equals(mapList.get(i).get("ordNo"))){
				sameOrd++;
				totalPrice += Integer.valueOf(mapList.get(i).get("price"));
				if(sameOrd == listSize){
%>
					<tr class="resultList">
					<td><%=cnt+1 %></td>
					<td class="ordNo"><%=mapList.get(baseIdx).get("ordNo") %></td>
					<td><%=mapList.get(baseIdx).get("ordDt") %></td>
					<td class="bklist"><%=mapList.get(baseIdx).get("bkNm") %>
<%
					if(sameOrd >1){
%>
					외 <%=sameOrd-1 %>종</td>
						
<%              	}else{
%>
                    </td>
<%                  } 
%>
					
					<td><%=totalPrice %>원</td>
					
					<% if(request.getParameter("category").equals("P001")){ %>
					<td>
					<% switch(ordStCd = Integer.valueOf(mapList.get(baseIdx).get("ordSt"))){
						case 1: ordSt= "배송준비"; break;
						case 2: ordSt="배송중"; break;
						case 3: ordSt= "수령완료"; break;
						case 4: ordSt= "주문취소"; break;
						case 5: ordSt= "환불신청"; break;
						case 6: ordSt= "환불완료"; break;
						case 7: ordSt= "환불거절";
					 }
					%>
					<%=ordSt %>
					</td>
					<% } %>
					<td><%=mapList.get(baseIdx).get("memNm") %></td>
<% 					if(request.getParameter("category").equals("P001")){
						if(ordStCd < 2){ 
%>
							<td>
							<input type="hidden" class="ordSt" value="4">
							<input type="button" class="ordCancel" value="주문취소"></td>
<%						
						
						}else if(ordStCd <=3){ 
							if(ordStCd == 2){
%>								
							<td>
							<input type="hidden" class="ordComp" value="3">
							<input type="button" class="ordRecvComp" value="수령완료"></td>									
<%								
							}else{
%>
							<td>
							<input type="hidden" class="ordSt" value="5">
							<input type="button" class="ordRefund" value="환불"></td>	
<%							}
						}
					}
%>
					</tr>
<%	
				}
			
			}else{
%>
				<tr class="resultList">
				<td><%=cnt+1 %></td>
				<td class="ordNo"><%=mapList.get(baseIdx).get("ordNo") %></td>
				<td><%=mapList.get(baseIdx).get("ordDt") %></td>
				<td class="bklist"><%=mapList.get(baseIdx).get("bkNm") %>
				
<%
					if(sameOrd >1){
%>
					외 <%=sameOrd-1 %>종</td>
						
<%              	}else{
%>
                    </td>
<%                  } 
%>
				
				<td><%=totalPrice %>원</td>
				<% if(request.getParameter("category").equals("P001")){ %>
				<td>
				<% switch(ordStCd = Integer.valueOf(mapList.get(baseIdx).get("ordSt"))){
					case 1: ordSt= "배송준비"; break;
					case 2: ordSt="배송중"; break;
					case 3: ordSt= "수령완료"; break;
					case 4: ordSt= "주문취소"; break;
					case 5: ordSt= "환불신청"; break;
					case 6: ordSt= "환불완료"; break;
					case 7: ordSt= "환불거절";
				 }
				%>
				<%=ordSt %>
				</td>
				<% } %>
				<td><%=mapList.get(baseIdx).get("memNm") %></td>
<% 					
				if(request.getParameter("category").equals("P001")){
					if(ordStCd < 2){ 
%>
						<td>
						<input type="hidden" class="ordSt" value="4">
						<input type="button" class="ordCancel" value="주문취소"></td>
<%						}else if(ordStCd <=3){
							if(ordStCd == 2){
%>								
							<td>
							<input type="hidden" class="ordComp" value="3">
							<input type="button" class="ordRecvComp" value="수령완료"></td>									
<%								
							}else{
%>	
						<td>
						<input type="hidden" class="ordSt" value="5">
						<input type="button" class="ordRefund" value="환불"></td>	
<%						}
					}
				}
				ordNo = mapList.get(i).get("ordNo");
				sameOrd = 1;
				cnt++;
				baseIdx = i;
							
				if(i==listSize-1){
%>
					<tr class="resultList">
					<td><%=cnt+1 %></td>
					<td class="ordNo"><%=mapList.get(baseIdx).get("ordNo") %></td>
					<td><%=mapList.get(baseIdx).get("ordDt") %></td>
					<td class="bklist"><%=mapList.get(baseIdx).get("bkNm") %>
					
	<%
						if(sameOrd >1){
	%>
						외 <%=sameOrd-1 %>종</td>
							
	<%              	}else{
	%>
	                    </td>
	<%                  } 
	%>
					
					<td><%=totalPrice %>원</td>
					<% if(request.getParameter("category").equals("P001")){ %>
					<td>
					<% switch(ordStCd = Integer.valueOf(mapList.get(baseIdx).get("ordSt"))){
						case 1: ordSt= "배송준비"; break;
						case 2: ordSt="배송중"; break;
						case 3: ordSt= "수령완료"; break;
						case 4: ordSt= "주문취소"; break;
						case 5: ordSt= "환불신청"; break;
						case 6: ordSt= "환불완료"; break;
						case 7: ordSt= "환불거절";
					 }
					%>
					<%=ordSt %>
					</td>
					<% } %>
					<td><%=mapList.get(baseIdx).get("memNm") %></td>
	<% 				if(request.getParameter("category").equals("P001")){
						if(ordStCd < 2){ 
	%>
							<td>
							<input type="hidden" class="ordSt" value="4">
							<input type="button" class="ordCancel" value="주문취소"></td>
	<%					}else if(ordStCd <=3){ 
							if(ordStCd == 2){
%>								
							<td>
							<input type="hidden" class="ordComp" value="3">
							<input type="button" class="ordRecvComp" value="수령완료"></td>									
<%								
							}else{
%>
							<td>
							<input type="hidden" class="ordSt" value="5">
							<input type="button" class="ordRefund" value="환불"></td>	
<%							}
						}
					}
%>
							</tr>
<%				
					}
			

				}	

			}
			
		}
%>

</table>
</div>
</body>
</html>