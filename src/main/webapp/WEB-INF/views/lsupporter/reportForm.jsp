<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/reportForm.css">

	<!-- 테일윈드 불러오기 -->

	

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
<button type="button" class="btn btn-dark btn-lg ml-3 backbtn">뒤로가기</button>
<button type="button" class="btn btn-primary btn-lg">제출</button>
</div>
</div>

<table class="tg mb-3" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 249.333333px">
<col style="width: 252.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-2xpi">보고서 작성일자</th>
    <td class="tg-2xpi">
    <span class="regDate report_regdate"><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /></span>
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th class="tg-2xpi">대상자</th>
    <td class="tg-2xpi">홍길동
    
    </td>
  </tr>
  <tr>
    <th class="tg-2xpi">보고서 구분</th>
    <td class="tg-2xpi">
    <select style="text-align:center;" class="reportmenu">
    <option name="" value="====">선택</option>
    <option name="" value="1">고객면담보고서</option>
    <option name="" value="2">건강상태보고서</option>
    <option name="" value="3">서비스취소보고서</option>
    <option name="" value="4">장기부재신청보고서</option>
    <option name="" value="5">악성대상자신고보고서</option>
    </select>
    </td>
  </tr>
</tbody>
</table>


<!--고객면담  -->
<div class="flex">
  <div class="col-md-12">
    <div class="card collapsed-card education" id="1">
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
          <form action="reportFormregist" method="post">
   
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
                    <td> <textarea rows="3"></textarea></td>
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
<div class="card  collapsed-card" id="2">
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
<form action="reportFormregist" method="post" >


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
<div class="card  collapsed-card" id="3">
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
<div class="card  collapsed-card" id="4">
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
<th colspan="3">
  <input type="radio" name="chatroad" value="여행" onclick="showTextarea()"/>여행&nbsp;&nbsp;
  <input type="radio" name="chatroad" value="입원" onclick="showTextarea()"/>입원&nbsp;&nbsp;
  <input type="radio" name="chatroad" value="기타" onclick="showTextarea()"/>기타
  <input type="text" name="details" id="detailsInput" style="display: none;" placeholder="기타 사유를 입력하세요..." />
</th>
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
<div class="card  collapsed-card" id="5">
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

<Script>
var form = 
</Script>

<script>
  function showTextarea() {
    var textareaRow = document.getElementById("textareaRow");
    var detailsInput = document.getElementById("detailsInput");
    var radioValue = document.querySelector('input[name="chatroad"]:checked').value;
    if (radioValue === "기타") {
  $('#detailsInput').css('display','block');
    } 
	if(radioValue != "기타"){
		  $('#detailsInput').css('display','none');
	}
  }
</script>

<script>
window.addEventListener('DOMContentLoaded', function() {
  var collapsedCards = document.getElementsByClassName('collapsed-card');
  
  for (var i = 0; i < collapsedCards.length; i++) {
    collapsedCards[i].style.display = 'none';
  }
  
  var reportSelect = document.querySelector('.reportmenu');
  var previousReportCard = null;
  
  reportSelect.addEventListener('change', function() {
    var selectedReportId = this.value;
    var selectedReportCard = document.getElementById(selectedReportId);
    
    if (previousReportCard && previousReportCard !== selectedReportCard) {
      previousReportCard.style.display = 'none';
      previousReportCard.querySelector('.fas').classList.remove('fa-minus');
      previousReportCard.querySelector('.fas').classList.add('fa-plus');
    }
    
    if (selectedReportCard) {
      selectedReportCard.style.display = 'block';
      selectedReportCard.querySelector('.fas').classList.remove('fa-plus');
      selectedReportCard.querySelector('.fas').classList.add('fa-minus');
      previousReportCard = selectedReportCard;
    }
  });
});
</script>





<!--오늘날짜 자동생성  -->

<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>