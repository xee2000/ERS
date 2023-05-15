<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 테일윈드 불러오기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css"/>	
	<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
	<!--데이지 UI  -->
	<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

	<!-- 폰트어썸 불러오기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	
	<!-- 사이트 공통 CSS -->
	<link rel="stylesheet" href="/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="/bootstrap/dist/css/adminlte.min.css?v=3.2.0">
	<!-- 사이트 공통 JS -->
	<script src="/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script src="/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
	<script src="/bootstrap/dist/js/demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
<style>
#resume-button {
  width: 160px;
  height: 30px;
  margin-left:2%;
  margin-bottom:5px;
  }
  #resume-form {
 transition: height 0.5s ease;
  overflow: hidden;
}
.collapsed-card{
margin-left:70%;
}
textarea{
width:100%;
border:1px solid black;
}
fmt{
font-size:2rem;
}
.regDate{
font-size:1.5rem;
}
.report_member{
font-size:2rem;
}
body{
font-size:2rem;
}
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:1.5rem;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:1.5rem;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-uqo3{background-color:#efefef;text-align:center;vertical-align:middle}
.tg .tg-yj5y{background-color:#efefef;border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-2xpi{background-color:#efefef;border-color:inherit;font-size:1.5rem;text-align:center;vertical-align:middle}
.tg .tg-l8qj{background-color:#ffffff;border-color:inherit;font-size:1.5rem;text-align:center;vertical-align:middle}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:middle}
.tg .tg-0lax{text-align:center;vertical-align:middle}
.tg .tg-baqh{text-align:center;vertical-align:middle}
.tg .tg-ynlj{text-align:center;vertical-align:middle}
.tg .tg-c3ow{text-align:center;vertical-align:middle}
</style>
<div class="tab-pane" id="carewordlist">
<div class="col-md-12">
<div class="reportForm">
<div class="form-group row">

<h3 style="margin:0 auto;">보고서 작성 페이지</h3>
</div>
</div>
</div>

<c:set var="ymd" value="<%=new java.util.Date()%>" />
<div class="row">
<div class="col-12 flex justify-end mb-1">
<button type="button" class="btn btn-outline-primary btn-lg">수정</button>
<button type="button" class="btn btn-outline-danger btn-lg ml-3">뒤로가기</button>
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
    <th class="tg-ynlj">
    <span class="regDate"><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /></span>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-yj5y">대상자</td>
    <td class="tg-c3ow">홍길동</td>
  </tr>
</tbody>
</table>


<!--고객면담  -->
<div class="flex">
<div class="col-md-12">
<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">고객면담 보고서</h3>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-minus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >


<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 140px;">
<col style="width: 278.333333px;">
</colgroup>
<thead>
  <tr>
    <th class="tg-2xpi">상담목적</th>
    <th class="tg-ynlj">
<select name="education_list">
<option value="정기상담">정기상담</option>
<option value="정기상담">대상자 요청</option>
<option value="정기상담">응급발생</option>
<option value="정기상담">외출확인</option>
</select>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-yj5y">상담경로</td>
    <td class="tg-c3ow">
    <input type="radio" name="chatroad" value="정상"/>전화&nbsp;&nbsp;
    <input type="radio" name="chatroad" value="고장"/>방문
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">확인내용</td>
    <td class="tg-0lax">
    <select name="check_detail">
    <option value="부재중">부재중</option>
    <option value="상담완료(방문불필요)">상담완료(방문불필요)</option>
    <option value="상담완료(방문필요)">상담완료(방문필요)</option>
    </select>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">약속일자</td>
    <td class="tg-0lax">
    <input type="datetime-local" name="promise"><br/>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">상세내용</td>
    <td class="tg-0lax">
    <textarea name="content" cols="30" rows="5"style="border:1px solid black;"></textarea>
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
<!--장비점검 보고서 끝  -->


<!--건강상태  -->
<div class="flex">
<div class="col-md-12">
<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">건강상태 보고서</h3>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-minus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >


<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 290.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-2xpi">상담경로</th>
    <th class="tg-l8qj">
    전화<input type="radio" name="memberchat" value=""/>
방문<input type="radio" name="memberchat" value=""/>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-yj5y">기존질환</td>
    <td class="tg-0pky">
    <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">알레르기</td>
    <td class="tg-0lax">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">복용중인 약물</td>
    <td class="tg-0lax">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">사용중인 의료기기</td>
    <td class="tg-0lax">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">의사와의 진료내용</td>
    <td class="tg-0lax">
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
<!--건강상태 보고서 끝  -->

<!--서비스취소  -->
<div class="flex">
<div class="col-md-12">
<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">서비스취소 보고서</h3>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-minus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >

<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
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
<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">장기부재신청 보고서</h3>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-minus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >

<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 140.333333px">
<col style="width: 135.333333px">
<col style="width: 188.333333px">
<col style="width: 149.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-2xpi">장기부재 사유</th>
    <th class="tg-l8qj" colspan="3">
      <textarea rows="3"></textarea>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-uqo3">부재시작일</td>
    <td class="tg-baqh">
    <input type="date"/>
    </td>
    <td class="tg-baqh">예상복귀일</td>
    <td class="tg-baqh">
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
<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">악성대상자 신고 보고서</h3>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
<i class="fas fa-minus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="#" method="#" >

<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 190px;">
<col style="width: 377.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-2xpi">발생시간</th>
    <th class="tg-l8qj">
    <input type="datetime-local"/>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-uqo3">신고사유</td>
    <td class="tg-baqh">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">사건정보</td>
    <td class="tg-0lax">
      <textarea rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">증언자정보</td>
    <td class="tg-0lax">
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
<!--악성대상자 신고보고서 끝  -->

</div>


<!--오늘날짜 자동생성  -->
<script>
document.getElementById('currentDatetime').value= new Date().toISOString().slice(0, 16);
</script>
<!--기타누를시 상세내용 활성화  -->
<script>
function showDetails() {
    // textarea의 클래스를 변경하여 summernote를 보이도록 함
    var details = document.querySelector(".gateway_equ_details");
    details.classList.add("summernote");
    details.style.display = "block";
  }

  function hideDetails() {
    // textarea의 클래스를 변경하여 summernote를 숨김
    var details = document.querySelector(".gateway_equ_details");
    details.classList.remove("summernote");
    details.style.display = "none";
  }
  $('input[name=firealert_equ]').on('click', function() {
    if ($(this).val() === '기타' || $(this).val() === '고장') {
      $('#firealert_equ_details').show();
    } else {
      $('#firealert_equ_details').hide();
    }
  });

  $('input[name=activity_equ]').on('click', function() {
    if ($(this).val() === '기타' || $(this).val() === '고장') {
      $('#activity_equ_details').show();
    } else {
      $('#activity_equ_details').hide();
    }
  });

  $('input[name=gogate_equ]').on('click', function() {
    if ($(this).val() === '기타' || $(this).val() === '고장') {
      $('#gogate_equ_details').show();
    } else {
      $('#gogate_equ_details').hide();
    }
  });
});
</script>


<script>
function toggleDetails() {
  if ($('input[name="long"]:checked').val() === '기타') {
    $('#long_gita_details').show();
  } else {
    $('#long_gita_details').hide();
  }
}

$(document).ready(function() {
  $('input[name="long"]').on('click', toggleDetails);
});
</script>

<script>
function toggleDetails(select) {
  var selectedOption = select.options[select.selectedIndex].value;
  if (selectedOption === '기타') {
    $('#calltitle_details').show();
  } else {
    $('#calltitle_details').hide();
  }
}
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

