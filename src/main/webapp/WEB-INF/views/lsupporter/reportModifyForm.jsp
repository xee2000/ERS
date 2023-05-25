<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/lsupporter/head.jspf"%>
 <%@include file="../include/lsupporter/toastUiEditorLib.jspf" %>
<link rel="stylesheet" href="/resources/lsupporter/css/nonmemberreportForm.css">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> 
<div class="tab-pane" id="carewordlist">
<div class="col-md-12">
<div class="reportForm">
<div class="form-group row">

<h1 class="report_title" style="margin:0 auto;">보고서</h1>
</div>
</div>
</div>

<div class="row">
<div class="col-12 flex justify-end mb-1">
<button type="button" class="btn btn-dark btn-md backbtn" onclick="history.back();">뒤로가기</button>
<c:if test="${reportmodify.viewCheck == 0}">
<button type="submit" class="btn btn-primary btn-md" onclick="modify();">수정</button>
</c:if>
</div>
</div>

<table class="tg mb-3" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 249.333333px">
<col style="width: 252.333333px">
</colgroup>
<thead>
  <tr>
    <th >보고서 작성일자</th>
    <fmt:formatDate value="${reportmodify.regDate }" pattern="yy-MM-dd" var="regDate"/>
    <td style="text-align:center;">
   ${regDate }
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>대상자</th>
    <td style="text-align:center;">
    ${reportmodify.name}
</td>
  </tr>

  <tr>
    <th class="tg-2xpi">보고서 구분</th>
    <td class="tg-2xpi">
   <c:if test="${reportmodify.reType==1 }">
   응급상황보고서
   </c:if>
    <c:if test="${reportmodify.reType==2 }">
   고객면담보고서
   </c:if>
    <c:if test="${reportmodify.reType==3 }">
   건강상태보고서
   </c:if>
    <c:if test="${reportmodify.reType==4 }">
   서비스취소보고서
   </c:if>
    <c:if test="${reportmodify.reType==5 }">
   장기부재신청 보고서
   </c:if>
    <c:if test="${reportmodify.reType==6 }">
   악성대상자신고보고서
   </c:if>
    <c:if test="${reportmodify.reType==7 }">
   장비점검보고서
   </c:if>
    </td>
  </tr>
</tbody>
</table>


<c:if test="${reportmodify.reType ==2 }">
<!--고객면담  -->
<div class="flex">
  <div class="col-md-12">
      <div class="card-header">
        <h3 class="card-title report_title">고객면담보고서</h3>
       
      </div>
      <div class="card-body" style="display: block;">
        <div class="form-group">
          <form action="reportModify" name="form" method="post" role="form" id="modifyForm">
       	   
        <div class="report-content">
            <table>
            
                <tr>
                
                    <th style="text-align: center;">특이사항</th>
                    
                   <td>
              	<textarea name="content" cols="5" rows="5" id="summernote">${reportmodify.content }</textarea>
				</td>
                </tr>
                <tr>
                    <th style="text-align: center;">전화유무</th>
                    <td> 
                    <input type="radio" name="callCheck" value="전화함">전화함
                    <input class="ml-2" type="radio" name="callCheck" value="전화안함">전화안함
                    </td>
                </tr>
            </table>
            <!-- 추가적인 테이블 내용을 추가할 수 있습니다. -->
        </div>
        </form>
    </div>
</div>


</div>
</div>
</div>
</div>
<!--장비점검 보고서 끝  -->
</c:if>


<c:if test="${reportmodify.reType ==3 }">
<!--건강상태  -->
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">건강상태보고서</h3>
</div>
<div class="card-body" style="display: block;">
<div class="form-group">
<div class="report">
        <div class="report-content">
<form action="reportModify" name="form" method="post" role="form" id="modifyForm">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 290.333333px">
</colgroup>
<tbody>
  <tr>
    <th class="">확인내용</th>
    <td class="">
    <textarea class="summernote" id="content" name="content" rows="3">${reportdetail.content }</textarea>
    </td>
  </tr>
  
</tbody>
</table>

</form>
</div>
</div>
</div>
</div>
</div>
</div>
</c:if>

<!--건강상태 보고서 끝  -->

<!--서비스취소  -->
<c:if test="${reportmodify.reType ==4 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">서비스취소보고서</h3>
</div>
<div class="card-body" style="display: block;">
<div class="form-group">
<form action="reportModify" name="form" method="post" role="form" id="modifyForm">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 287.333333px">
</colgroup>
<thead>
  <tr>
    <td class="tg-2xpi">파일첨부</td>
    <td class="tg-l8qj">
    <input type="file" name="filename"/>
    </td>
  </tr>
</thead>
</table>
</form>
</div>
</div>
</div>
</div>

</c:if>
<!--서비스취소 보고서 끝  -->

<!--장기부재  -->
<c:if test="${reportmodify.reType ==5 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">장기부재 신청서</h3>
</div>
<form action="reportModify" name="form" method="post" role="form" id="modifyForm">
<div class="card-body" style="display: block;">
<div class="form-group">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 140.333333px">
<col style="width: 135.333333px">
<col style="width: 188.333333px">
<col style="width: 149.333333px">
</colgroup>
<thead>
  <tr>
 <th>장기부재 사유</th>
<th colspan="3">

 <c:if test="${reportmodify.content == '입원'}">
 <input type="radio" name="content" checked value="입원"/>입원&nbsp;&nbsp;
 </c:if>
 <c:if test="${reportmodify.content == '여행'}">
 <input type="radio" name="content" checked value="여행"/>여행&nbsp;&nbsp;
 </c:if>
 
 <c:if test="${reportmodify.content != '입원'}">
 <input type="radio" name="content" value="입원"/>입원&nbsp;&nbsp;
 </c:if>
  <c:if test="${reportmodify.content != '여행'}">
 <input type="radio" name="content" value="입원"/>입원&nbsp;&nbsp;
 </c:if>
  <input type="radio" name="content" value="입원"/>입원&nbsp;&nbsp;
  <input type="radio" id="gita"value="기타" onclick="showTextarea()"/>기타
  <input type="text" name="content" id="detailsInput" style="display: none;" value="${reportmodify.content }"/>
</th>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
</form>
</div>
</div>
</c:if>

<!--장기부재신청서보고서 끝  -->

<!--악성대상자 신고 보고서  -->
<c:if test="${reportmodify.reType ==6 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">악성대상자 신고보고서</h3>

</div>
<form action="reportModify" name="form" method="post" role="form" id="modifyForm">
<div class="card-body" style="display: block;">
<div class="form-group">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 190px;">
<col style="width: 377.333333px">
</colgroup>
<thead>
<fmt:formatDate value="${reportmodify.occurTime }" pattern="yy-Mm-dd" var="occurTime"/>
  <tr>
    <th>발생시간</th>
    <td style="text-align:center;">
   <input type="date" name="occurTime" value="${occurTime}">
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>사건내용</th>
    <td>
      <textarea name="content" rows="3">${reportmodify.content }</textarea>
    </td>
  </tr>
    <tr>
    <th>파일첨부</th>
    <td >
   <div class="form-group">								
</div>
    </td>
  </tr>
</tbody>
</table>
</div>
</div>
</form>
</div>
<!--악성대상자 신고보고서 끝  -->

</div>
</c:if>


<!--기타에 입력한경우 내용이 나오도록  -->
<script>
$(document).ready(function() {
	  var contentValue = $("#detailsInput").val();
	  
	  if (contentValue.length >= 3) {
	    $("#detailsInput").css("display", "block");
	  }
	});
</script>

<script>

</script>

<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>