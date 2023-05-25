<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<%@include file="../include/lsupporter/head.jspf"%>
 <%@include file="../include/lsupporter/toastUiEditorLib.jspf" %>
<link rel="stylesheet" href="/resources/lsupporter/css/nonmemberreportForm.css">
<!--   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> -->
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
<button type="submit" class="btn btn-primary btn-md" onclick="regist_go();">제출</button>
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
    <fmt:formatDate value="${reportdetail.regDate }" pattern="yy-MM-dd" var="regDate"/>
    <td style="text-align:center;">
   ${regDate }
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>대상자</th>
    <td style="text-align:center;">
    ${reportdetail.name}
</td>
  </tr>
<!--   응급상황  : 1
고객면담 : 2
건강상태 : 3
서비스 취소 : 4
장기부재 : 5
악성대상자신고 : 6
장비점검 : 7 -->
  <tr>
    <th class="tg-2xpi">보고서 구분</th>
    <td class="tg-2xpi">
   <c:if test="${reportdetail.reType==1 }">
   응급상황보고서
   </c:if>
    <c:if test="${reportdetail.reType==2 }">
   고객면담보고서
   </c:if>
    <c:if test="${reportdetail.reType==3 }">
   건강상태보고서
   </c:if>
    <c:if test="${reportdetail.reType==4 }">
   서비스취소보고서
   </c:if>
    <c:if test="${reportdetail.reType==5 }">
   장기부재신청 보고서
   </c:if>
    <c:if test="${reportdetail.reType==6 }">
   악성대상자신고보고서
   </c:if>
    <c:if test="${reportdetail.reType==1 }">
   장비점검보고서
   </c:if>
    </td>
  </tr>
</tbody>
</table>


<c:if test="${reportdetail.reType ==2 }">
<!--고객면담  -->
<div class="flex">
  <div class="col-md-12">
      <div class="card-header">
        <h3 class="card-title report_title">고객면담보고서</h3>
       
      </div>
      <div class="card-body" style="display: block;">
        <div class="form-group">
          <form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
       	   
        <div class="report-content">
            <table>
            
                <tr>
                
                    <th style="text-align: center;">특이사항</th>
                    
                   <td>
                   <div class="toast-ui-viewer"> 
              	<script type="text/x-template">${reportdetail.content}</script>
              </div>
   				<!--   <div class="toast-ui-editor"></div> -->
				</td>
                </tr>
                <tr>
                    <th style="text-align: center;">전화유무</th>
                    <td> 
                    ${reportdetail.callCheck }
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


<c:if test="${reportdetail.reType ==3 }">
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
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="reType" value="3">
<input type="hidden" name="callCheck" value="">     
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23/01/01">                
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
<c:if test="${reportdetail.reType ==4 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">서비스취소보고서</h3>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="reType" value="4">
<input type="hidden" name="callCheck" value="">                    
<input type="hidden" name="content" value=""> 
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23/01/01"> 
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
<c:if test="${reportdetail.reType ==5 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">장기부재 신청서</h3>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="callCheck" value="">                    
<input type="hidden" name="reType" value="5">
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23/01/01"> 
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
 ${reportdetai.content }
</th>
</thead>
<tbody>
</tbody>
</table>
</form>
</div>
</div>
</div>
</div>
</c:if>

<!--장기부재신청서보고서 끝  -->

<!--악성대상자 신고 보고서  -->
<c:if test="${reportdetail.reType ==6 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">악성대상자 신고보고서</h3>

</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm"  enctype="multipart/form-data">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="N">
<input type="hidden" name="reType" value="6">
<input type="hidden" name="callCheck" value="">
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23/01/01">
<input type="hidden" name="attacher" value="${wid }">
                     
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 190px;">
<col style="width: 377.333333px">
</colgroup>
<thead>
  <tr>
    <th>발생시간</th>
    <td>
   ${reportdetail.occurTime }
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>사건내용</th>
    <td>
      <textarea name="content" rows="3">${reportdetail.regDate }</textarea>
    </td>
  </tr>
    <tr>
    <th>파일첨부</th>
    <td >
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
    </td>
  </tr>
</tbody>
</table>
</form>
</div>
</div>
</div>
<!--악성대상자 신고보고서 끝  -->

</div>
</c:if>



<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>