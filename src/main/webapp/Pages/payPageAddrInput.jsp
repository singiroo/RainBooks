<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주소입력 창</title>
	
	
	
	<style type="text/css">
	
		#inputTitle{
			text-align: center;
		}
		
		table{
			border-collapse: collapse;
		}
		#titleTr{
			background: silver;
		}
		td{
			text-align: center;
		}
		.addrTr:hover{
			background: green;
		}
		
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%-- 	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script> --%>
	<script>
	
		$(function(){
			
			
			// 주소찾기 버튼 클릭
			$('#addrBtn').on('click', function(){
				
				
				$('#showAddrTableDiv').html("");
				
				addrInfo = $('#addrInText').val();
				
				$.ajax({
					url		: '<%=request.getContextPath()%>/SearchOrderAddr',
					type	: 'post',
					data	: { "addrInfo" : addrInfo },
					dataType: 'text json',
					
					success	: function(res){
						
						code = "<table border='1' align='center'>";
						code += "<tr id='titleTr'>";
						code += "<td>주소</td>";
						code += "</tr>";
						$.each(res, function(i, v){
							code += "<tr class='addrTr'>";
							code += "<td>" + v.addr + "</td>";
							code += "<td><input class='addrSqTd' type='hidden' value='" + v.addrSq + "'></td>";
							code += "</tr>";
						})
						$('#showAddrTableDiv').html(code);
					},
					error	: function(xhr){
						alert("상태코드 : " + xhr.status);
					}
					
					
				})
			})
			
			
			
			// 해당 주소라인 클릭
			$('#showAddrTableDiv').on('click', '.addrTr', function(){
				addrText = $('td:eq(0)', this).text();
				addrSq = $('td:eq(1) .addrSqTd', this).val();
				
				$('#NeworderAddr', opener.document).text(addrText);
				$('#orderNewInfoCd', opener.document).val(addrSq);
				window.close();
			})
			
		})
		
	
	</script>
	
	
	
</head>
<body>
	
	<table align="center" border="0">
		<tr>
			<td id="inputTitle" colspan="3">거주지의 시, 군, 동을 입력해주세요</td>
		</tr>
		<tr>
			<td>주소 : </td>
			<td><input type="text" id="addrInText"></td>
			<td><input type="button" id="addrBtn" value="찾기"></td>
		</tr>
	</table>
	
	
	
	<div id="showAddrTableDiv"></div>

</body>
</html>