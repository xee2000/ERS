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

<button class="btn btn-primary" onclick="update_submit()">수정하기</button>
<section class="" style="height:650px;">
	<div class="px-3">
    <div class="table-box-type-1">
      
<form role="form" method="post" action="/ers/lsupporter/notice/modify" name="modifyForm" enctype="multipart/form-data">
							
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요" value="${notice.title }">
								<input type="hidden" name='nNo' value="${notice.NNo }">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="content" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요.">${notice.content }</textarea>
							</div>
							
							
							<div class="form-group">								
								<div class="card card-outline card-success">
									<div class="card-header">
										<h3 style="display:inline;line-height:40px;">첨부파일 : </h3>
										&nbsp;&nbsp;
										<button class="btn btn-primary"	onclick="addFile_go()" type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
										<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
											<!-- 첨부파일 썸네일 -->		
											<c:forEach items="${noticeFileList}" var="noticeFile" >
												<li class="attach-item" target-fNo="${noticeFile.FNo }" file-name="${noticeFile.filename }">																			
													<div class="mailbox-attachment-info ">
														<a class="mailbox-attachment-name" name="attachedFile" href="javascript:location.href='<%=request.getContextPath()%>/ers/lsupporter/notice/getFile?fNo=${noticeFile.FNo }';" >													
															<i class="fas fa-paperclip"></i>
															${noticeFile.filename }&nbsp;&nbsp;
															<button type="button" onclick="removeFile_go('${noticeFile.FNo }');return false;" style="border:0;outline:0;" class="badge bg-red">X</button>																									
														</a>													
													</div>
												</li>
											</c:forEach>
										</ul>
										<br/>														
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
	//alert("add file btn");
	
	var attachedFile=$('a[name="attachedFile"]').length;	//기존파일
	var inputFile=$('input[name="uploadFile"]').length;		//추가된 파일
	var attachCount=attachedFile+inputFile; //기존파일 + 추가된파일 개수
	
	if(attachCount >=5){
		alert("파일차가는 5개까지만 가능합니다.");
		return;
	}
	
	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	
	div.append(input).append("<button onclick='remove_go("+dataNum+");'style='border:0;outline:0;'class='bage bg-red' type='button'>X</button>");
	$('.fileInput').append(div);
	dataNum++;
}

function removeFile_go(FNo) {
	//alert(ano);
	var li = $('li[target-fNo="'+FNo+'"]');
	if(!confirm(li.attr("file-name")+"을 정말 삭제하겠습니까?")){
		return;
	}
	
	li.remove();
	var input=$('<input>').attr({"type":"hidden",
			"name":"deleteFile",
			"value":li.attr("target-fNo")
	});
	$('form[role="form"]').prepend(input);
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

function update_submit(){
	//alert("modify btn click");
	var form = $('form[name="modifyForm"]');
	var title = $('input[name="title"]');
	//유효성 체크
	if($("input[name='title']").val()==""){
		alert(title+"은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	var inputs = $('input[name="uploadFile"]');
	for(var input of inputs){
		if(input.value==""){
			alert("파일을 선택하세요.");
			input.focus();
			input.click();
			return;
		}
	}
	
	
	form.submit();
}

</script>



<%@include file="../include/lsupporter/foot.jspf"%>
 