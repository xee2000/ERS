<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="게시물 작성"/>
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

<section class="" style="height:650px;">
	<div class="px-3">
    <div class="table-box-type-1">
      
<form action="/ers/lsupporter/notice/write" method="POST" role="form" enctype="Multipart/form-data">
<table>
<tr>
<th><label for="title">제목</label></th>
<td><textarea cols="100" placeholder="제목을 입력해주세요." style="border:2px solid black; border-radius:5px;"></textarea></td>
</tr>
<tr>
<th><label for="title">내용</label></th>
<td>     <textarea class="summernote" id="content" name="content" rows="3"></textarea></td>
</tr>	
<tr>
<th><label for="file">파일추가</label></th>
<td><input type="file" multiple name="fileList"></td>
</tr>
</table>
</form>

<button class="btn btn-primary" onclick="write()">작성하기</button>
</div>
</div>


</section>	

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
    function write(){
    	var form = $('form[role="form"]');
    	var confirm = "작성을 완료하시겠습니까?";
    	if(confirm){
    		form.submit();
    	}
    }
    </script>
<%@include file="../include/lsupporter/foot.jspf"%>
 