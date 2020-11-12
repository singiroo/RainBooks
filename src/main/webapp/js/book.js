var listServer = function(cpage){
	
	$.ajax({
	
		url: '/RainBooks/BookListPage',
		data : { "page" : cpage },
		dataType : 'json',
		type : 'get',
		success : function(res){
			console.log(res);
			$('.result1').empty();
			code = '';
			code += '		<table border="1">';
			code += '		<tr>';
			code += '			<td class="bkIsbn">ISBN코드</td>';
			code += '			<td>상품구분코드</td>';
			code += '			<td>도서장르코드</td>';
			code += '			<td>대여이용여부</td>';
			code += '			<td>도서명</td>';
			code += '			<td>저자</td>';
			code += '			<td>출판사</td>';
			code += '			<td>페이지 수</td>';
			code += '			<td class="bkArti">소개글</td>';
			code += '			<td>평점</td>;';
			code += '			<td>판매가</td>';
			code += '			<td>정가</td>';
			code += '			<td>판매량</td>';
			code += '			<td>파일ID</td>';
			code += '			<td>이미지ID</td>';
			code += '			<td>등록날짜</td>';
			code += '			<td>수정</td>';
			code += '			<td>삭제</td>';
			code += '		</tr>';
			$.each(res.data, function(i, v) {
			                     
			code += '		<tr>';
			code += '			<td class="bkIsbn">' + v.bkIsbn + '</td>';
			code += '			<td>' + v.prodCd + '</td>';
			code += '			<td>' + v.bkGreCd + '</td>';
			code += '			<td>' + v.bkSt + '</td>';
			code += '			<td><a href="#">' + v.bkNm + '</a></td>';
			code += '			<td>' + v.bkAtr + '</td>';
			code += '			<td>' + v.bkPbl + '</td>';
			code += '			<td>' + v.bkPage + '</td>';
			code += '			<td class="bkArti">' + v.bkArti + '</td>';
			code += '			<td>' + v.bkGrade + '</td>';
			code += '			<td>' + v.bkSelPrice + '</td>';
			code += '			<td>' + v.bkFixPrice + '</td>';
			code += '			<td>' + v.bkSalesQty + '</td>';
			code += '			<td>' + v.fileId + '</td>';
			code += '			<td>' + v.imgId + '</td>';
			code += '			<td>' + v.bkDt + '</td>';
			code += '	    	<td><input idx="' + v.bkIsbn + '" type="button" name="bookmodify" class="action" value="수정"></td>';
			code += '	   		<td><input idx="' + v.bkIsbn + '" type="button" name="bookdelete" class="action" value="삭제"></td>';
			code += '		</tr>';
			
			})
			code += '	</table>';
			
				$('.result1').append(code);
				
				 
				
				totalpage = res.tpage;
				startpage = res.spage;
				endpage = res.epage;
				currentpage = res.cpage;
				
				// 이전버튼 출력
				$('#btngroup1').empty();
				pager = "";
				if(startpage > 1){
					pager += '<ul class="pager">';
					pager += 	'<li class="previous"><a href="#">Previous</a></li>';
					pager += '</ul>';
					$(pager).appendTo('#btngroup1');
				}
				
				
				// 페이지 번호 출력
				pager = '<ul class="pagination pager">';
				for(i=startpage; i<=endpage; i++){
					
					if(currentpage == i){
						pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
					}else{
						pager += '<li><a class="paging" href="#">' + i + '</a></li>';
					}
				}
				pager += '</ul>';
				$(pager).appendTo('#btngroup1');
				
				 
				// 다음버튼 출력
				if(endpage < totalpage) {
					pager = '<ul class="pager">';
					pager += 	'<li class="next"><a href="#">Next</a></li>';
					pager += '</ul>';
					$(pager).appendTo('#btngroup1');
				}
					
		},
		error : function(xhr){
			console.log(xhr.status);
		}
		
	})
}




var saveServer = function(bkIsbn,prodCd,bkGreCd,bkSt,bkNm,bkAtr,bkPbl,bkPage,bkArti,bkGrade,bkSelPrice,bkFixPrice,bkSalesQty,fileId,imgId){

	$.ajax({
		url : '/RainBooks/BookSave',
		data : {
			"bkIsbn":bkIsbn,
			"prodCd":prodCd,
			"bkGreCd":bkGreCd,
			"bkSt": bkSt,
			"bkNm":bkNm,
			"bkAtr":bkAtr,
			"bkPbl":bkPbl,
			"bkPage":bkPage,
			"bkArti":bkArti,
			"bkGrade":bkGrade,
			"bkSelPrice":bkSelPrice,
			"bkFixPrice":bkFixPrice,
			"bkSalesQty":bkSalesQty,
			"fileId":fileId,
			"imgId":imgId
			 
		},   
		dataType : 'json',
		type : 'post',
		success : function(res){
			listServer(1);
		},
		error : function(xhr){

		}
		
	})		
	
}		



var viewServer = function(){
	
	$.ajax({
		url : "/RainBooks/BookUpdate",
		type : 'get',
		data : { "bkIsbn" : idx },
		dataType : 'json',
		success : function(res){
			$('#ubkIsbn').val(res.bkIsbn);
			$('#uprodCd').val(res.prodCd);
			$('#ubkGreCd').val(res.bkGreCd);
			$('#ubkSt').val(res.bkSt);
			$('#ubkNm').val(res.bkNm);
			$('#ubkAtr').val(res.bkAtr);
			$('#ubkPbl').val(res.bkPbl);
			$('#ubkPage').val(res.bkPage);
			
			bkArti = res.bkArti.replace(/<br>/g, "\n")
			$('#ubkArti').val(bkArti);
			
			$('#ubkGrade').val(res.bkGrade);
			$('#ubkSelPrice').val(res.bkSelPrice);
			$('#ubkFixPrice').val(res.bkFixPrice);
			$('#ubkSalesQty').val(res.bkSalesQty);
			$('#ufileId').val(res.fileId);
			$('#uimgId').val(res.imgId);
			$('#uModal').modal('show');
			  
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	
	})
}




var updateServer = function(){
	
	$.ajax({
		
		url : '/RainBooks/BookUpdate',
		type : 'post',
		data : $('#uform').serialize(),
		dataType : 'json',
		success : function(res){
			listServer();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
		
	})
	
}



var deleteServer = function(idx, button){
	$.ajax({
		url : '/RainBooks/BookDelete',
		data : {"bkIsbn" : idx },
		type : 'post',
		dataType : 'json',
		success : function(res){
			$(button).parents('.rep').remove();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
	
}



var imgdeleteServer = function(idx, button){
	$.ajax({
		url : '/RainBooks/BookImgDelete',
		data : {"bkIsbn" : idx },
		type : 'post',
		dataType : 'json',
		success : function(res){
			$(button).parents('.bkIsbn').remove();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}


