<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/js/notice.js"></script>
<style type="text/css">
     hr{
        clear: both;
     }
     input[name=reply]{
        height: 45px;
        vertical-align: top;
     }
     label{
     	display: inline-block;
     	width: 60px;
		height: 30px;
     }
     #modifyForm{
	  	display: none;
	 }
	  #wModal{
	   display: none;	  		
	 }
	 
</style>


<script>
//객체 생성 { } -> 동적으로 속성을 추가해서 사용한다. bonum, name, cont;
reply = {  };
write = {  };  // name, content, subject, password, mail을 동적으로 추가해 사용할 수 있다.

  $(function(){
//      board.js의 함수 호출 -> ajax요청이 실행
//      readServer(1);
     readServer();
     
     //페이지번호 클릭하면 이벤트 설정
     $('#btngroup1').on('click','.paging', function(){
        
        $('body').append($('#modifyForm'));
        $('#modifyForm').hide();
        
        currentpage = $(this).text().trim();
        readpageServer(currentpage);
     })
     //이전버튼 클릭하면
     $('#btngroup1').on('click','.previous a', function(){
        
        $('body').append($('#modifyForm'));
        $('#modifyForm').hide();
        
        currentpage = parseInt($('.paging:first').text().trim()) - 1;
        readpageServer(currentpage);
        
     })
     //다음버튼 클릭하면
     $('#btngroup1').on('click','.next a', function(){
        
        $('body').append($('#modifyForm'));
        $('#modifyForm').hide();
        
        currentpage = parseInt($('.paging:last').text().trim()) + 1;
        readpageServer(currentpage);
        
     })
     
     //버튼에 대한 이벤트
     $('.box').on('click','.action', function(){
        actionname = $(this).attr('name');
        idx = $(this).attr('idx');
        
        if(actionname == 'modify'){
           alert(idx + "번 글 수정")
          viewServer()
          
          $('#uModal').modal('show');
          
        }else if(actionname == 'delete'){
           alert(idx + "번 글 삭제")
           deleteServer(idx, this);
           
           
        }
              
           // textarea 새로 수정된 내용 가져오기
           modifyCont = $('#modifyForm #text').val();
           spanTag = $('#modifyForm').parent();
           
           // Db에 적용시킬 수정내용 - reply객체에 추가 (cont, renum) 
           reply.cont = modifyCont;
           reply.renum = redx;
           
           replyUpdateServer();
           
           $('body').append($('#modifyForm'));
           $('#modifyForm').hide();
           
           // 원래대로 span태그로 돌아간다.
           spanTag.html(modifyCont.replace(/\n/g,"<br>"));
           
//         }
           
     })
     
     // 글쓰기 모달창에서 데이터 입력후에 전송버튼 클릭 
     $('#send').on('click',function(){
       
        //글쓰기
        writeServer();
        //모달창 닫기
        $('#wModal').modal('hide');
        //모달창의 입력데이터지우기
        $('.indata').val("");
        //ajax전송시 data : writer, 객체를 보낼 수 있다.
        //data : values,
     })
     
  })
</script>
<style>
   #modifyForm{
      display: none;
   }
   #wModal{
      display: none;
   }

</style>
</head>
<body>
<div class="container-fluid text-center">    




	<div class="row content">
  
		<div class="col-sm-2 sidenav" id="navsize">
<%-- 			<p><a href="<%= request.getContextPath() %>/selectFaqboard">자주 묻는 질문</a></p> --%>
<%-- 			<p><a href="<%= request.getContextPath() %>/selectQnaboard">Q&A</a></p> --%>
<%-- 			<p><a href="<%= request.getContextPath() %>/selectNoticeboard">공지사항</a></p> --%>
			<p><a href="#">자주 묻는 질문</a></p>
			<p><a href="#">Q&A</a></p>
			<p><a href="#">공지사항</a></p>
		</div>
		
		<div class="col-sm-8 text-left infocenter">
			
			<div id="serviceTitle">
				<h2 id="serviceTitle_tabId">
					공지사항
				</h2>
			</div>
      
			<hr>
			
			<div id="serviceContent">
			
				
					<div id="serviceContent_div">
						<!-- 댓글 수정폼 -->
   <div id = "modifyForm">
      <input type = "button" value="확인" id="btnOK" class="action" name="reok">
      <input type = "button" value="취소" id="btnReset" class="action" name="reset">
   </div>

   
<div class="box">
</div>

<div id="btngroup1"></div>

<!-- 글작성 Modal -->
<div id="wModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">글쓰기</h4>
      </div>
      <div class="modal-body">

         <form id="wform" name="wform"> <!-- name은 DB와 VO이름과 똑같아야한다. -->
           <label>작성자</label>  
         <input type ="text" class="indata" id="mngId" name="mngId"><br>
           <label>제목</label>  
            <input type="text" class="indata" name="ntTitle" id="ntTitle"><br>
           <label>내용</label>  
            <br>
            <textarea class="indata" name="ntCont" rows="10" cols="50" id="ntCont"></textarea><br>
            <input id="send" type="button" value="전송">
         </form>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
    </div>
    </div>
    
    
<!-- 글수정Modal -->
<div id="uModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    
    <!--글 수정 Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">글 수정</h4>
      </div>
      <div class="modal-body">
         <form id="uform" name="uform"> <!-- name은 DB와 VO이름과 똑같아야한다. -->
         <input type="hidden" id="useq" name="ntNo" class="indata">
         <label>작성자</label>
             <input type = "text" class="indata" id="umngId" name="mngId"><br>
         <label>제목</label>
             <input type="text" class="indata" id="untTitle" name="ntTitle"><br>
         <label>내용</label>
            <br>
            <textarea class="indata" name="ntCont" rows="10" cols="50" id="untCont"></textarea><br>
            <input id="usend" type="button" value="전송">
           	
         </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
					</div>
				
			</div>
			
		</div>
    
	</div>
  
  </div>

</body>

</html>