<%@page import="kr.or.ddit.rb.cmm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emoney 관리</title>
<script>

$(function(){
	/* 충전 */
	$('#charging').on('click', function(){
		chargeAmt = $('#chargeAmt').val();
		charge(chargeAmt);
	})
	/* 환불  */
	$('#refunding').on('click', function(){
		$('#refundResult').empty();
		refundAmt = parseInt($('#refundAmt').val());
		if(refundAmt > "${member.eMoney}"){
			code = "<p>환불액이 보유하신 e-money보다 많습니다.</p>";
			$('#refundResult').html(code);
			$('#refundAmt').val(0);
		}else if(refundAmt < 100){
			code = "<p>환불은 100원 단위로 이루어집니다.</p>";
			$('#refundResult').html(code);
			$('#refundAmt').val(0);
		}else{
			refund(refundAmt);		
		}
	})
	
	
})


</script>
<style>
	#emoneyTab td{
		width : 300px;
		height : 100px;
	}
	td{
		text-align: right;
		font-size : 18px;
	}
	#charge{
		margin-right : 20px;
	}
	#refundResult{
		color : red;
		font-size : 13px;
	}
	#refundAmt,#chargeAmt{
		text-align : right;
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
	#myCartRoundLine{
		margin-left: -250px;
	}
	#emoneyTab{
		
	}
	body{
		font-family: fantasy;
	}

</style>

</head>
<body>
<h2>${member.memNm}님의 E-MONEY 보유 현황</h2>
<hr>
<table id="emoneyTab"  align="left">
<tr><td>현재 E-money : </td><td>${member.eMoney} 원</td></tr>
<tr><td colspan="2"><input type="button" id="charge" data-toggle="modal" data-target="#chargeModal" value="충전"><input type="button" id="refund" data-toggle="modal" data-target="#refundModal" value="환불"></td></tr>
</table>



<!-- 충전 Modal -->
<div> 
  <div class="modal fade" id="chargeModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">e-money 충전</h4>
        </div>
        <div class="modal-body">
          <p>충전하실 금액을 입력해주세요</p>
          <input type="text" id="chargeAmt" name="chargeAmt" value="0">
          <input type="button" class="btn btn-default" id="charging" value="충전">
          <div id="chargeResult"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> 
</div>
<!-- 환불 Modal -->
<div> 
  <div class="modal fade" id="refundModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">e-money 환불</h4>
        </div>
        <div class="modal-body">
          <p>환불하실 금액을 입력해주세요.</p>
          <p>- 환불은 100원 단위로 이루어집니다.</p>
          <input type="text" id="refundAmt" name="refundAmt" value="0">
          <input type="button" class="btn btn-default" id="refunding" value="환불">
          <div id="refundResult"></div>
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