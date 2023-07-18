<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/noticedetail.css">
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	<div class="row">
	<div class="col-12">
	<h3 class="title">공지사항</h3>
	</div>
	</div>
	
<div class="row">
<div class="col-12 flex justify-start mb-1">
<button type="button" class="btn btn-dark btn-lg ml-3" onclick="location.href='notice'">목록</button>
</div>
</div>

<button class="btn btn-primary" onclick="modify()">수정하기</button>
<section class="" style="height:650px;">
	<div class="px-3">
    <div class="table-box-type-1">
      
<form role="form" method="post" action="/ers/lsupporter/notice/write" name="registForm" enctype="multipart/form-data">
							
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요" value="${notice.title }">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="content" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요.">${notice.content }</textarea>
							</div>
							<div class="form-group">								
								<div class="card card-outline card-success">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
										&nbsp;&nbsp;<button class="btn btn-xs btn-primary"
										onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
						</form>

</div>
</div>


</section>	

<script>

var dataNum=0;
function addFile_go(){
	
	if($('input[name="uploadFile"]').length >= 5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
		
	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	
	div.append(input).append("<button onclick='remove_go("+dataNum+");'style='border:0;outline:0;'class='bage bg-red' type='button'>X</button>");
	$('.fileInput').append(div);
	dataNum++;
}

function remove_go(dataNum){
	//alert(dataNum);
	$('div[data-no="'+dataNum+'"]').remove();
}
</script>


<script>
      $('#content').summernote({
        placeholder: '내용을 기입해주세요',
        tabsize: 2,
        height: 140,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
    
<script>
  function modify() {
    var form = $('form[role="form"]');
    var confirmationMessage ="수정하시겠습니까?";
    
    if (confirm(confirmationMessage)) {
      form.submit();
    }
  }
</script>



<%@include file="../include/lsupporter/foot.jspf"%>
 