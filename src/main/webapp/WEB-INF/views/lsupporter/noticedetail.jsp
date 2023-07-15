<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<button type="button" class="btn btn-dark btn-lg ml-3" onclick="location.href='notice'">목록</button>
<c:if test="${loginUser == notice.manId}">
<button type="button" class="btn btn-dark btn-lg ml-3">수정</button>
</c:if>
<c:if test="${loginUser == notice.manId}">
<button type="button" class="btn btn-dark btn-lg ml-3">삭제</button>
</c:if>
</div>
</div>

<section class="" style="height:950px;">
	<div class="px-3">
    <div class="table-box-type-1">
      
<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<thead>
  <tr>
    <th class="tg-ynlj">제목 </th>
    <th class="tg-l8qj">중요공지</th>
    <th class="tg-baqh">등록날짜 </th>
    <fmt:formatDate value="${notice.regDate }" var="regDate" pattern="yyyy-MM-dd"/>
    <th class="tg-baqh">${regDate }</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c3ow">작성자 </td>
    <td class="tg-0pky" colspan="3">${notice.manId }</td>
  </tr>
  <tr>
    <td class="tg-baqh">내용</td>
    <td class="tg-0lax" colspan="3">
   ${notice.content }
    </td>
  </tr>
</tbody>
</table>
    </div>
  </div>
</section>


<%@include file="../include/lsupporter/foot.jspf"%>
 