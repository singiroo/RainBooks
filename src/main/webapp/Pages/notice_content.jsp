<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>��������</title>
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
//��ü ���� { } -> �������� �Ӽ��� �߰��ؼ� ����Ѵ�. bonum, name, cont;
reply = {  };
write = {  };  // name, content, subject, password, mail�� �������� �߰��� ����� �� �ִ�.

  $(function(){
//      board.js�� �Լ� ȣ�� -> ajax��û�� ����
//      readServer(1);
     readServer();
     
     //��������ȣ Ŭ���ϸ� �̺�Ʈ ����
     $('#btngroup1').on('click','.paging', function(){
        
        $('body').append($('#modifyForm'));
        $('#modifyForm').hide();
        
        currentpage = $(this).text().trim();
        readpageServer(currentpage);
     })
     //������ư Ŭ���ϸ�
     $('#btngroup1').on('click','.previous a', function(){
        
        $('body').append($('#modifyForm'));
        $('#modifyForm').hide();
        
        currentpage = parseInt($('.paging:first').text().trim()) - 1;
        readpageServer(currentpage);
        
     })
     //������ư Ŭ���ϸ�
     $('#btngroup1').on('click','.next a', function(){
        
        $('body').append($('#modifyForm'));
        $('#modifyForm').hide();
        
        currentpage = parseInt($('.paging:last').text().trim()) + 1;
        readpageServer(currentpage);
        
     })
     
     //��ư�� ���� �̺�Ʈ
     $('.box').on('click','.action', function(){
        actionname = $(this).attr('name');
        idx = $(this).attr('idx');
        
        if(actionname == 'modify'){
           alert(idx + "�� �� ����")
          viewServer()
          
          $('#uModal').modal('show');
          
        }else if(actionname == 'delete'){
           alert(idx + "�� �� ����")
           deleteServer(idx, this);
           
           
        }
              
           // textarea ���� ������ ���� ��������
           modifyCont = $('#modifyForm #text').val();
           spanTag = $('#modifyForm').parent();
           
           // Db�� �����ų �������� - reply��ü�� �߰� (cont, renum) 
           reply.cont = modifyCont;
           reply.renum = redx;
           
           replyUpdateServer();
           
           $('body').append($('#modifyForm'));
           $('#modifyForm').hide();
           
           // ������� span�±׷� ���ư���.
           spanTag.html(modifyCont.replace(/\n/g,"<br>"));
           
//         }
           
     })
     
     // �۾��� ���â���� ������ �Է��Ŀ� ���۹�ư Ŭ�� 
     $('#send').on('click',function(){
       
        //�۾���
        writeServer();
        //���â �ݱ�
        $('#wModal').modal('hide');
        //���â�� �Էµ����������
        $('.indata').val("");
        //ajax���۽� data : writer, ��ü�� ���� �� �ִ�.
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
<%-- 			<p><a href="<%= request.getContextPath() %>/selectFaqboard">���� ���� ����</a></p> --%>
<%-- 			<p><a href="<%= request.getContextPath() %>/selectQnaboard">Q&A</a></p> --%>
<%-- 			<p><a href="<%= request.getContextPath() %>/selectNoticeboard">��������</a></p> --%>
			<p><a href="#">���� ���� ����</a></p>
			<p><a href="#">Q&A</a></p>
			<p><a href="#">��������</a></p>
		</div>
		
		<div class="col-sm-8 text-left infocenter">
			
			<div id="serviceTitle">
				<h2 id="serviceTitle_tabId">
					��������
				</h2>
			</div>
      
			<hr>
			
			<div id="serviceContent">
			
				
					<div id="serviceContent_div">
						<!-- ��� ������ -->
   <div id = "modifyForm">
      <input type = "button" value="Ȯ��" id="btnOK" class="action" name="reok">
      <input type = "button" value="���" id="btnReset" class="action" name="reset">
   </div>

   
<div class="box">
</div>

<div id="btngroup1"></div>

<!-- ���ۼ� Modal -->
<div id="wModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">�۾���</h4>
      </div>
      <div class="modal-body">

         <form id="wform" name="wform"> <!-- name�� DB�� VO�̸��� �Ȱ��ƾ��Ѵ�. -->
           <label>�ۼ���</label>  
         <input type ="text" class="indata" id="mngId" name="mngId"><br>
           <label>����</label>  
            <input type="text" class="indata" name="ntTitle" id="ntTitle"><br>
           <label>����</label>  
            <br>
            <textarea class="indata" name="ntCont" rows="10" cols="50" id="ntCont"></textarea><br>
            <input id="send" type="button" value="����">
         </form>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
    </div>
    </div>
    
    
<!-- �ۼ���Modal -->
<div id="uModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    
    <!--�� ���� Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">�� ����</h4>
      </div>
      <div class="modal-body">
         <form id="uform" name="uform"> <!-- name�� DB�� VO�̸��� �Ȱ��ƾ��Ѵ�. -->
         <input type="hidden" id="useq" name="ntNo" class="indata">
         <label>�ۼ���</label>
             <input type = "text" class="indata" id="umngId" name="mngId"><br>
         <label>����</label>
             <input type="text" class="indata" id="untTitle" name="ntTitle"><br>
         <label>����</label>
            <br>
            <textarea class="indata" name="ntCont" rows="10" cols="50" id="untCont"></textarea><br>
            <input id="usend" type="button" value="����">
           	
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