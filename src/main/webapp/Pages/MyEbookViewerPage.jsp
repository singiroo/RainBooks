<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	StringBuffer bookText =  (StringBuffer) request.getAttribute("bookFileText");
 	String bookName = (String) request.getAttribute("bookName");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<style type="text/css">
		
		body{
			width: 100%;
		}
		#ViewPage{
			width: 80%;
			height: 500px;;
			border: 2px solid red;
			overflow: auto;
			display: inline-block;
			font-family: sans-serif;
			padding: 20px;
			background: #eee6c4;
		}
		#ViewTable{
			margin-left: 20%;
		}
		#bookName{
			text-align: center;
			font-weight: bold;
		}
	</style>



	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		$('#goMyPage').on('click', function(){
			
			$('#goMyPageForm').attr('action', '<%= request.getContextPath() %>/Pages/myPage.jsp');
			$('#goMyPageForm').submit();
		})

	})
	
	</script>
	
	
</head>
<body>

	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	
	<div id="bookName">
		<%= bookName %>	
	</div>
	
	<br>
	<br>
	
	<form id="goMyPageForm">
	
		<table align="center" id="ViewTable">
			<tr>
				<td>
				
					<div id="viewDiv">
						<div id="ViewPage">
							<% for(int i=0; i<bookText.length(); i++){
								char text = bookText.charAt(i);
								if(text == '\n'){
								%> <br> <%
								} %> <%= text %> <%
							}
							%>
						</div>
					</div>
				
				</td>
			</tr>
			
			
			<tr>
			
				<td>
					<input type="button" value="뒤로가기" id="goMyPage">
				</td>
			
			</tr>
		</table>
	
	</form>
	
	<br>
	<br>

</body>
</html>