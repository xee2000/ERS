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
<c:if test="${wid == notice.manId}">
<button type="button" class="btn btn-dark btn-lg ml-3" onclick="location.href='/ers/lsupporter/notice/ModifyForm?nNo=${notice.NNo}'">수정</button>
</c:if>
<c:if test="${wid == notice.manId}">
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
    <th class="tg-l8qj">${notice.title }</th>
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
<input type="hidden" name="nNo" id="nNo" value="${notice.NNo }">
    </div>
  </div>
  
  					<div class="card-footer">
<!-- attaches -->
<c:forEach items="${noticeFileList}" var="noticefile">
  <div class="col-md-12 col-sm-12 col-xs-12" style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/ers/lsupporter/notice/getFile?fNo=${noticefile.FNo }';">
    <div class="info-box">
      <span class="info-box-icon bg-yellow">
        <i class="fa fa-copy"></i>
      </span>
      <div class="info-box-content">
        <span class="info-box-number">
          <script>
            var filename = "${noticefile.filename}";
            if (filename.indexOf("$$") !== -1) {
              filename = filename.substring(filename.indexOf("$$") + 2);
            }
            document.write(filename);
          </script>
        </span>
      </div>
    </div>
  </div>
</c:forEach>
</div>

  
  
<c:if test="${replyList != null }">
<div class="reply_list">
  <p>댓글리스트</p>
  <c:forEach items="${replyList}" var="reply">
    <c:if test="${wid == reply.writer}">
     <button id="btn-modal" onclick="modify()" class="btn btn-primary">수정</button>
    </c:if>
    <c:if test="${wid == reply.writer}">
      <button onclick="remove()" class="btn btn-primary">삭제</button>
    </c:if>
    <table class="tg" style="undefined;table-layout: fixed; width: 100%;">
      <thead>
        <fmt:formatDate value="${reply.regDate}" var="regDate" pattern="yyyy-MM-dd" />
        <fmt:formatDate value="${reply.updateDate}" var="updateDate" pattern="yyyy-MM-dd" />
        <tr>
          <th class="tg-ynlj">작성자</th>
          <th class="tg-ynlj">${reply.writer}</th>
          <th class="tg-ynlj">작성일</th>
          <th class="tg-l8qj">${regDate}</th>
          <c:if test="${updateDate != null}">
            <th class="tg-ynlj">수정일</th>
            <th class="tg-l8qj">${updateDate}</th>
          </c:if>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="tg-c3ow">내용</td>
          <td class="tg-0pky" colspan="3">${reply.content}</td>
        </tr>
      </tbody>
    </table>
    <!-- Hidden input field for rNo -->
    <input type="hidden" id="rNo" value="${reply.RNo}" />
  </c:forEach>
</div>

</c:if>

<!-- 댓글 수정폼 모달창 -->
<div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>댓글</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
              <table class="tg" style="undefined;table-layout: fixed; width: 100%;">
      <thead>
        <fmt:formatDate value="${reply.regDate}" var="regDate" pattern="yyyy-MM-dd" />
        <fmt:formatDate value="${reply.updateDate}" var="updateDate" pattern="yyyy-MM-dd" />
        <tr>
          <th class="tg-ynlj">작성자</th>
          <th class="tg-ynlj">${reply.writer}</th>
          <th class="tg-ynlj">작성일</th>
          <th class="tg-l8qj">${regDate}</th>
          <c:if test="${updateDate != null}">
            <th class="tg-ynlj">수정일</th>
            <th class="tg-l8qj">${updateDate}</th>
          </c:if>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="tg-c3ow">내용</td>
          <td class="tg-0pky" colspan="3">${reply.content}</td>
        </tr>
      </tbody>
    </table>
                
            </div>
        </div>
    </div>



<c:if test="${replyList == null }">
<p>댓글리스트</p>
<p>등록된 댓글이 없습니다.</p>
</c:if>

<form action="/ers/lsupporter/reply/write" method="POST" role="form">
<label for="content">내용</label>
<input type="text" name="content">
<input type="hidden" name="nNo" value="${notice.NNo }">
</form>
<button onclick="regist()" class="btn btn-primary">작성</button>



</section>	
<script>
function regist() {
  var form = $('form[role="form"]');
  if (form.length > 0) {
    var confirmed = confirm("작성하시겠습니가?");
    if (confirmed) {
      form.submit();
    }
  }
}

function remove() {
	  var rNo = document.getElementById("rNo").value;
	  var nNo = document.getElementById("nNo").value;
	  var confirmed = confirm("정말로 삭제하시겠습니까?");
	  
	  if (confirmed) {
	    var form = document.createElement('form');
	    form.method = 'POST';
	    form.action = '/ers/lsupporter/reply/removereply'; 
	    
	    var inputRNo = document.createElement('input');
	    inputRNo.type = 'hidden';
	    inputRNo.name = 'rNo';
	    inputRNo.value = rNo;
	    form.appendChild(inputRNo);
	    
	    var inputNNo = document.createElement('input');
	    inputNNo.type = 'hidden';
	    inputNNo.name = 'nNo';
	    inputNNo.value = nNo;
	    form.appendChild(inputNNo);

	    document.body.appendChild(form);

	    form.submit();	
	  }
	}



</script>


<script>
var modal = document.getElementById("modal");
var btnModal = document.getElementById("btn-modal");
btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
})

var closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})
</script>
<%@include file="../include/lsupporter/foot.jspf"%>
 