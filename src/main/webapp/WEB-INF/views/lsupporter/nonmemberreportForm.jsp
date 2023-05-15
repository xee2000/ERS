<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/nonmemberreportForm.css">


<div class="tab-pane" id="carewordlist">
<div class="col-md-12">
<div class="reportForm">
<div class="form-group row">

<h1 class="report_title" style="margin:0 auto;">보고서</h1>
</div>
</div>
</div>

<c:set var="ymd" value="<%=new java.util.Date()%>" />
<div class="row">
<div class="col-12 flex justify-end mb-1">
<button type="button" class="btn btn-dark btn-md backbtn" onclick="location.href='/usr/home/reportlist'">뒤로가기</button>
<button type="button" class="btn btn-primary btn-md">제출</button>
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
    <td style="text-align:center;">
    <span class="regDate"><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /></span>
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>대상자</th>
    <td>
<div class="search_container flex items-center">
  <input class="searchinput w-full" type="text" id="검색어" name="q" required>
  <button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
     <i class="fa fa-search" style="padding-left: 120px;" id="popupBtn"></i>
  </button>
</div>
      <!--모달창  -->
      <div id="modalWrap">
  <div id="modalContent">
    <div id="modalBody">
      <span id="closeBtn">&times;</span>
      <!--모달창  -->
      <div class="callist">
<div class="row">
<div class="col-12">
<h3 class="caltitle mt-2">대상자 이름조회</h3>
</div>
</div>


<table class="tg table table_list" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150.333333px">
<col style="width: 300px">
</colgroup>
<form method="get" role="form" action="nonmemberreportForm">
<thead>
  <tr>
    <th class="tg-l8qj" >
<select class="form-control" style="font-size: 1.5rem;height: auto;" name="searchType" id="searchType">
   <option value="nbg" ${cri.searchType=='nbg' ? "selected":"" } >전체</option>
   <option value="n" ${cri.searchType=='n' ? "selected":"" } >대상자명</option>
   <option value="b" ${cri.searchType=='b' ? "selected":"" }>나이</option>
   <option value="g" ${cri.searchType=='g' ? "selected":"" }>성별</option>
</select>
</th>
   <th class="tg-l8qj">
  <div class="search_container flex items-center">
  <input type="hidden" name="gubun" value="1">
    <input class="searchinput w-full" type="text" id="검색어" required="required" name="keyword" value="${cri.keyword}" placeholder="검색어를 입력하세요.">
    <button type="button" class="absolute right-0 top-0 bottom-0 p-2 right-1.25" id="searchButton">
      <i class="fa fa-search" id="searchBtn" data-card-widget="search" onclick="list_go(1);"></i>
    </button>
  </div>
</th>
  </tr>
</thead>
</form>
<tbody>

</tbody>
</table>

<div class="row">
<div class="col-12">


<table class="tg searchlist" style="undefined;table-layout: fixed;">
<colgroup>
<col style="width: 100px">
<col style="width: 100.333333px">
<col style="width: 70.333333px">
<col style="width: 70.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-uqo3">이미지</th>
    <th class="tg-2xpi">대상자명</th>
    <th class="tg-2xpi">성별</th>
    <th class="tg-uqo3">나이</th>
  </tr>
</thead>
<c:forEach var="member" items="${memberList }">
<tbody>
  <tr>
    <td class="modal_content">
    ${member.picture }
    </td>
    <td class="modal_content">
   ${member.name }
</td>
    <td class="modal_content">
    ${member.gender }
    </td>
    <td class="modal_content">
${member.birth }
</td>
  </tr>
</tbody>
</c:forEach>
</table>


<%@include file="../include/lsupporter/pagination.jsp"%>

</div>

</div>
      
    </div>
  </div>
</div>
 
  </div>
</td>
  </tr>
</tbody>
</table>


<!--고객면담  -->
<div class="flex">
  <div class="col-md-12">
    <div class="card collapsed-card">
      <div class="card-header">
        <h3 class="card-title report_title">고객면담보고서</h3>
        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
            <i class="fas fa-plus"></i>
          </button>
        </div>
      </div>
      <div class="card-body" style="display: none;">
        <div class="form-group">
          <form action="#" method="#">
   
    <div class="report">
        <div class="report-content">
            <table>
                <tr>
                    <th style="text-align: center;">상담목적</th>
                    <td>
            <select name="education_list">
            <option value="정기상담">정기상담</option>
            <option value="정기상담">대상자 요청</option>
            <option value="정기상담">응급발생</option>
            <option value="정기상담">외출확인</option>
            </select></td>
                </tr>
                <tr>
                    <th style="text-align: center;">상담경로</th>
                    <td>
    <input type="radio" name="chatroad" value="정상"/>전화&nbsp;&nbsp;
    <input type="radio" name="chatroad" value="고장"/>방문</td>
                </tr>
                <tr>
                    <th style="text-align: center;">확인내용</th>
                    <td> <textarea rows="3"></textarea></td>
                </tr>
                <tr>
                    <th style="text-align: center;">약속일자</th>
                    <td><input type="date" name=""></td>
                </tr>
                <tr>
                    <th style="text-align: center;">상세내용</th>
                    <td> <textarea class="summernote" rows="3"></textarea></td>
                </tr>
            </table>
            <!-- 추가적인 테이블 내용을 추가할 수 있습니다. -->
        </div>
    </div>



</form>
</div>
</div>
</div>
</div>
</div>
</div>
<!--장비점검 보고서 끝  -->


<!--건강상태  -->
<div class="flex">
<div class="col-md-12">
<div class="card  collapsed-card">
<div class="card-header">
<h3 class="card-title report_title">건강상태보고서</h3>
<div class="card-tools">
 <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-plus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<div class="report">
        <div class="report-content">
<form action="#" method="#" >


<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 290.333333px">
</colgroup>
<tbody>
  <tr>
    <th class="">기존질환</th>
    <td class="">
    <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <th class="">알레르기</th>
    <td class="">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <th class="">복용중인 약물</th>
    <td class="">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <th class="">사용중인 의료기기</th>
    <td class="">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <th class="">의사와의 진료내용</th>
    <td class="">
      <textarea rows="3"></textarea>
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
</div>


<!--건강상태 보고서 끝  -->

<!--서비스취소  -->
<div class="flex">
<div class="col-md-12">
<div class="card  collapsed-card">
<div class="card-header">
<h3 class="card-title report_title">서비스취소보고서</h3>
<div class="card-tools">
 <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-plus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 287.333333px">
</colgroup>
<thead>
  <tr>
    <td class="tg-2xpi">파일첨부</td>
    <td class="tg-l8qj">
    <input type="file"/>
    </td>
  </tr>
</thead>
</table>
</form>
</div>
</div>
</div>
</div>
</div>


<!--서비스취소 보고서 끝  -->

<!--장기부재  -->
<div class="flex">
<div class="col-md-12">
<div class="card  collapsed-card">
<div class="card-header">
<h3 class="card-title report_title">장기부재 신청서</h3>
<div class="card-tools">
 <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-plus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >

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
<td style="text-align:center;"colspan="3">
  <input type="radio" name="chatroad" value="여행" onclick="showTextarea()"/>여행&nbsp;&nbsp;
  <input type="radio" name="chatroad" value="입원" onclick="showTextarea()"/>입원&nbsp;&nbsp;
  <input type="radio" name="chatroad" value="기타" onclick="showTextarea()"/>기타
  <input type="text" name="details" id="detailsInput" style="display: none;" placeholder="기타 사유를 입력하세요..." />
</td>
</thead>
<tbody>
  <tr>
    <th>부재시작일</th>
    <td >
    <input type="date"/>
    </td>
    <th>예상복귀일</th>
    <td>
    <input type="date"/>
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
<!--장기부재신청서보고서 끝  -->

<!--악성대상자 신고 보고서  -->
<div class="flex">
<div class="col-md-12">
<div class="card  collapsed-card">
<div class="card-header">
<h3 class="card-title report_title">악성대상자 신고보고서</h3>
<div class="card-tools">
 <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-plus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >

<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 190px;">
<col style="width: 377.333333px">
</colgroup>
<thead>
  <tr>
    <th>발생시간</th>
    <td>
    <input type="datetime-local"/>
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>신고사유</th>
    <td>
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <th >사건정보</th>
    <td >
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <th>대응내용</th>
    <td>
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <th>증언자정보</th>
    <td>
      <textarea rows="3"></textarea>
    </td>
  </tr>
    <tr>
    <th>파일첨부</th>
    <td >
     <input type="file" />
    </td>
  </tr>
</tbody>
</table>
</form>
</div>
</div>
</div>
</div>
<!--악성대상자 신고보고서 끝  -->

</div>


<script>
$(document).ready(function() {
  $('.summernote').summernote({
    height: 150,
    lang: "en-KR"
  });
});
</script>

<!--모달창 스크립ㅌ  -->
<script>
  const btn = document.getElementById('popupBtn');
  const modal = document.getElementById('modalWrap');
  const closeBtn = document.getElementById('closeBtn');

  btn.onclick = function() {
    modal.style.display = 'block';
  }

  closeBtn.onclick = function() {
    modal.style.display = 'none';
  }

  window.onclick = function(event) {
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  }

  // Hide the modal initially
  modal.style.display = 'none';
</script>


<script>
  function list_go(page) {
	  
	 var form = $('form[role="form"]');
		form.submit();
   
  }
  
  
  window.onload=function(){
	  if(${gubun} == 1){
	  const modal = document.getElementById('modalWrap');
		    modal.style.display = 'block';
		  
	  }
	  
  }
</script>

<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>