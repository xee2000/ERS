<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="게시물 내용"/>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/noticedetail.css">
	

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

<section class="" style="height:650px;">
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


<div class="reply_list">
<p>댓글리스트</p>
<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<c:forEach items="${replyList }" var="reply">
<thead>
<fmt:formatDate value="${reply.regDate }"  var="regDate" pattern="yyyy-MM-dd"/>
<fmt:formatDate value="${reply.updateDate }"  var="updateDate" pattern="yyyy-MM-dd"/>
  <tr>
    <th class="tg-ynlj">작성일</th>
    <th class="tg-l8qj">${regDate }</th>
    
   <c:if test="${updateDate != null }">
     <th class="tg-ynlj">수정일</th>
    <th class="tg-l8qj">${updateDate }</th>
   </c:if>
    <fmt:formatDate value="${notice.regDate }" var="regDate" pattern="yyyy-MM-dd"/>
    <th class="tg-baqh">${regDate }</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c3ow">내용 </td>
    <td class="tg-0pky" colspan="3">${reply.content }</td>
  </tr>
</tbody>
</c:forEach>
</table>
</div>


<form action="/ers/lsupporter/reply/write" method="POST" role="form">
<label for="content">내용</label>
<input type="text" name="content">
<input type="hidden" name="writer" value="${wid}">
<input type="hidden" name="nNo" value="${notice.NNo }">
</form>
<button onclick="regist()" class="btn btn-primary">작성</button>



</section>	
<script>
function regist() {
  var form = $('form[role="form"]');
  if (form.length > 0) {
    // Display a confirmation dialog
    var confirmed = confirm("작성하시겠습니가?");
    if (confirmed) {
      form.submit();
    }
  }
}
</script>

<%@include file="../include/lsupporter/foot.jspf"%>
 