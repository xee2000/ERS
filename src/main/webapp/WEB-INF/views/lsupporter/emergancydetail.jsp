<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/emergancydetail.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>


<div class="tab-pane" id="carewordlist">
<div class="col-md-12">
<div class="reportForm">
<div class="form-group row">

<h1 class="emergancy_title" style="margin:0 auto;">응급상황보고서</h1>
</div>
</div>
</div>

<c:set var="ymd" value="<%=new java.util.Date()%>" />
<div class="row flex justify-start mb-3">
<button type="button" class="btn btn-dark btn-lg ml-3">뒤로가기</button>
</div>
<div class="report member ml-2">


</div>

<!--응급상황 보고서  -->
<div class="flex">
<div class="col-md-12">
<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">응급상황 보고서</h3>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-minus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: block;">
<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 157.333333px">
<col style="width: 377.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-2xpi">대상자명</th>
    <th class="tg-c3ow">
  		홍길동
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-2xpi">응급일자</td>
    <td class="tg-c3ow">
      2020-10-10
    </td>
  </tr>
  <tr>
    <td class="tg-2xpi">처리 응급요원</td>
    <td class="tg-c3ow">
      홍길동
    </td>
  </tr>
  <tr>
    <td class="tg-2xpi">응급구분</td>
    <td class="tg-c3ow">
      응급
    </td>
  </tr>
   <tr>
    <td class="tg-2xpi">전화유무</td>
    <td class="tg-c3ow">
      전화함
    </td>
  </tr>
   <tr>
    <td class="tg-2xpi">대상자상태</td>
    <td class="tg-c3ow">
      <select>
      <option value="---">선택</option>
      <option value="안전">안전</option>
      <option value="위험">위험</option>
      <option value="부상">부상</option>
      <option value="사망">사망</option>
      </select>
    </td>
  </tr>
   <tr>
    <td class="tg-2xpi">처리내역</td>
    <td class="tg-0lax">
      <textarea class="summernote">몸이 많이 아프다고함</textarea>
    </td>
  </tr>
   <tr>
    <td class="tg-2xpi">파일첨부</td>
    <td class="tg-0lax">
	<input type="file"/>
    </td>
  </tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>
<!--응급상황 보고서 끝  -->


<!--오늘날짜 자동생성  -->
<script>
document.getElementById('currentDatetime').value= new Date().toISOString().slice(0, 16);
</script>


<script>
  document.getElementById('currentDatetime').value= new Date().toISOString().slice(0, -1);
</script>

<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>
<div style="height:450px;"></div>
<%@include file="../include/lsupporter/foot.jspf"%>
