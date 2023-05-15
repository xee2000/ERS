<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="게시물 내용"/>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/noticedetail.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	

	<div class="row">
	<div class="col-12">
	<h3 class="title">공지사항</h3>
	</div>
	</div>
	
<div class="row">
<div class="col-12 flex justify-start mb-1">
<button type="button" class="btn btn-dark btn-lg ml-3">목록</button>
</div>
</div>

<section class="" style="height:950px;">
	<div class="px-3">
    <div class="table-box-type-1">
      
<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 112.333333px">
<col style="width: 169.333333px">
<col style="width: 128.33333299999998px">
<col style="width: 170.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-ynlj">제목 </th>
    <th class="tg-l8qj">중요공지</th>
    <th class="tg-baqh">등록날짜 </th>
    <th class="tg-baqh">2020-01-01</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c3ow">작성자 </td>
    <td class="tg-0pky" colspan="3">홍길동</td>
  </tr>
  <tr>
    <td class="tg-baqh">내용</td>
    <td class="tg-0lax" colspan="3">
    <textarea class="summernote">악성대상자 규정이 변경되었으니 참고바랍니다.</textarea>
    </td>
  </tr>
  <tr>
    <td class="tg-baqh">첨부파일</td>
    <td class="tg-0lax" colspan="3">
    <input type="file"/>
    </td>
  </tr>
</tbody>
</table>
    </div>
  </div>
</section>
<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>

<%@include file="../include/lsupporter/foot.jspf"%>
 