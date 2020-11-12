<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		
		
		
		$('#BGoCart').on('click', function(){
			
			
			bkName = $('#bkNameH3Tag', opener.document).text();
			selPrice = $('#selPrice', opener.document).val();
			bkisbn = $('#bkIsbn', opener.document).text();
			qty = $('#numBox', opener.document).val();
			
			
			
			
			alert(bkName);
			alert(selPrice);
			alert(bkisbn);
			alert(qty);
			
			return 10;
			
			window.close();
// 			$('#GoCartOrPage').attr('action', 'InsertCart');
// 			$('#GoCartOrPage').attr('method', 'POST');
// 			$('#GoCartOrPage').submit();
		})
		
		
		$('#BNoneChange').on('click', function(){
			
			bkName = $('#bkNameH3Tag', opener.document).text();
			selPrice = $('#selPrice', opener.document).val();
			bkisbn = $('#bkIsbn', opener.document).text();
			qty = $('#numBox', opener.document).val();
			
			
			$('#GoCartOrPage').attr('action', 'InsertCart');
			$('#GoCartOrPage').attr('method', 'POST');
			$('#GoCartOrPage').submit();
		})
		
		
	})



</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>카트에 상품이 담겼습니다</h3>
	<input type="button" value="장바구니로 이동"  id="BGoCart">
	<input type="button" value="계속 쇼핑하기" id="BNoneChange">
	<input type="hidden" id="GoCart" value="GoCart">
	<input type="hidden" id="NoneChange" value="NoneChange">
	
	
	<form id="GoCartOrPage">
		<input type="hidden" id="bkName" name="bkName">
		<input type="hidden" id="selPrice" name="selPrice">
		<input type="hidden" id="bkisbn" name="bkisbn">
		<input type="hidden" id="qty" name="qty">
	</form>


</body>
</html>