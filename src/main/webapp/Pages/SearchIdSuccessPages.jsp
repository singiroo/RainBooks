<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<%
	String memId = request.getParameter("msg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title> �� ���̵�</title>
	
	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	  	$(function(){
	  		$('#GoHome').on('click', function(){
	  			$('#changePageButtonForm').attr('action', '<%= request.getContextPath() %>/Main');
	  			$('#changePageButtonForm').attr('method', 'POST');
	  			$('#changePageButtonForm').submit();
	  		})
	  	})
	</script>
	
	
	<style type="text/css">
	
		.infocenter{
			text-align: center;
		}
	
	</style>
	
</head>
<body>


	<div class="col-sm-8 text-left infocenter">
	
		<br><br><br><br><br>
		<h3>ȸ������ ID��   <%= memId %> �Դϴ�.</h3>
		<br><br><br><br><br>
		
		<div>
		
			<form id="changePageButtonForm">
				<input type="button" value="Ȩ���� ����" id="GoHome"> 
			</form>
			
		</div>
		
		<br><br><br><br><br>
		
      
	</div>
	

</body>
</html>