<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/memberdetail.css">
<c:set value="${dataMap.memberdetail }" var="memberdetail"/>
<c:set value="${dataMap.memberEcall }" var="memberEcall"/>
<c:set value="${dataMap.emergencyCount }" var="emergencyCount"/>
<c:set value="${dataMap.fireCount }" var="fireCount"/>
<c:set value="${dataMap.machinList }" var="machinList"/>
<c:set value="${reportListMap.reportList }" var="reportList"/>


<div class="row">
<div class="col-12 flex justify-start mb-1">
<button type="button" class="btn btn-dark btn-lg">뒤로가기</button>
</div>
</div>
<div class="container-fluid">
<div class="row">
<div class="col-md-3">

<div class="card card-primary card-outline">
<div class="card-body box-profile">
<div class="text-center" style="width:300px;height:300px;">
${memberdetail.picture }
</div>
<h3 class="profile-username text-center">${memberdetail.name }</h3>
</div>

</div>

<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">기타 이력</h3>
</div>

<div class="card-body">
<div class="danger"><img class="danger_imgsize" src="/resources/lsupporter/img/사이렌.jpg"/> 
<span class="danger_status">응급발생정보</span></div><br/>
<div class="danger_list">
<span class="dangergo">총 응급출동건수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;→ ${emergencyCount }건</span><br/>
<span class="dangergo">총 화재발생건수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;→ ${fireCount }건</span>
</div>
<hr>
</div>
</div>
</div>



<div class="col-md-9">
<div class="card">
<div class="card-header p-2">
<ul class="nav nav-pills justify-around">
<li class="nav-item"><a class="tab_name" href="#activity" data-toggle="tab">대상자정보</a></li>
<li class="nav-item"><a class="tab_name" href="#systemstatus" data-toggle="tab">서비스정보</a></li>
<li class="nav-item"><a class="tab_name" href="#carewordlist" data-toggle="tab">보고서</a></li>
</ul>
</div>
<div class="card-body">
<div class="tab-content">
<div class="tab-pane active" id="activity">

<form class="form-horizontal">

<table class="tg type03" style="undefined;table-layout: fixed;">
<colgroup>
<col style="width: 210.333333px">
<col style="width: 480.333333px">
</colgroup>
<thead>
  <tr>

    <th class="tg-0lax" style="color:black;font-weight:normal;">대상자명 </th>
    <th class="tg-0lax" style=:color:black;>${memberdetail.name }</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax">나이</td>
    <td class="tg-0lax">${memberdetail.birth }</td>
  </tr>
  <tr>
    <td class="tg-0lax">전화번호</td>
    <td class="tg-0lax">${memberdetail.phone }</td>
  </tr>
  <tr>
    <td class="tg-0lax">고위험수준</td>
    <td class="tg-0lax">${memberdetail.caution }</td>
  </tr>
  <tr>
    <td class="tg-0lax">심장박동기 부착여부</td>
    <td class="tg-0lax">${memberdetail.pacemaker }</td>
  </tr>
    <tr>
    <td class="tg-0lax">대상자 구분</td>
    <td class="tg-0lax">${memberdetail.memType }</td>
  </tr>
  <tr>
    <td class="tg-0lax">거주지주소</td>
    <td class="tg-0lax">${memberdetail.address }</td>
  </tr>
  <tr>
    <td class="tg-0lax">질병정보</td>
    <td class="tg-0lax">${memberdetail.orgdisease }</td>
  </tr>
  <tr>
    <td class="tg-0lax">복용약물내역</td>
    <td class="tg-0lax">${memberdetail.drug }</td>
  </tr>
  <tr>
    <td class="tg-0lax">심리상태</td>
    <td class="tg-0lax">${memberdetail.mentalstatus }</td>
  </tr>
  <tr>
    <td class="tg-0lax">가족과의 친분도</td>
    <td class="tg-0lax">${memberdetail.fam_rel }</td>
  </tr>
<c:forEach var="ecall" items="${memberEcall}"  varStatus="status">
  <tr>
    <td class="tg-0lax">긴급연락망${status.index+1 }<br/>(이름/관계/연락처)</td>
    <td class="tg-0lax">
    ${ecall.name }/${ecall.relation }/${ecall.phone }
</td>
  </tr>
  </c:forEach> 
  
</tbody>
</table>
</form>



</div>


<div class="tab-pane" id="systemstatus">
<div class="form-group row">
<table class="tg" style="undefined;table-layout: fixed; width: 100%;margin-left:7%;">
<colgroup>
<col style="width: 150.333333px">
<col style="width: 110.333333px">
<col style="width: 140.333333px">
<col style="width: 80.333333px">
<col style="width: 120.333333px">
<col style="width: 80.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-baqh">기기명</th>
    <th class="tg-baqh">모델명</th>
    <th class="tg-baqh">설치일자</th>
    <th class="tg-baqh">교체여부</th>
    <th class="tg-baqh">교체일자</th>
  </tr>
</thead>
<c:forEach items="${machinList }" var="machin">
<fmt:formatDate value="${machin.regDate }" pattern="yy-MM-dd" var="regDate"/>
<fmt:formatDate value="${machin.changeDate }" pattern="yy-MM-dd" var="changeDate"/>
<tbody>
  <tr>
    <td class="tg-0lax">${machin.name }</td>
    <td class="tg-0lax">${machin.MCode }</td>
    <td class="tg-0lax">${regDate }</td>
    <td class="tg-0lax">${machin.changeStatus }</td>
    <td class="tg-0lax">${changeDate }</td>
  </tr>
  
</tbody>
</c:forEach>
</table>
</div>


</div>

<!--다섯번째 탭  -->
<div class="tab-pane" id="carewordlist">

<div class="row ">
		<div class="category_date_menubar">
		<div class="date mb-2">
		<input type="date" name="startday" style="width:250px;border:1px solid black;font-size:1.5rem;">&nbsp;&nbsp;<span class="dash">-</span>
		&nbsp;&nbsp;<input type="date" name="endday" style="width:250px;border:1px solid black;font-size:1.5rem;">
		</div>
  <div class="search_bar search_bar_main flex mb-5">
 <div class="search_bar mb-2 flex">
  <select class="keywordoption"name="searchType" id="searchType" >
   <option value="" disabled>검 색</option>
<option value="nbg" ${cri.searchType eq 'nbg' ? 'selected':'' }>전체</option>
<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
<option value="g" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
<option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>활동여부</option>
<option value="rd" ${cri.searchType eq 'rd' ? 'selected':'' }>남은정기상담일</option>
  </select>
<div class="search_container flex items-center">
<input type="hidden" name="id" value="${memberdetail.id }">
  <input class="searchinput w-full" autocomplete="false" type="text" name="keyword" required="required" value="${cri.keyword}" id="search_keyword" onkeyup="handleEnterKey(event)">
  <button type="button" class="absolute right-0 top-0 bottom-0 p-2 right-1.25" id="button" data-card-widget="search" onclick="reportlist_go(1);">
    <i class="fa fa-search"></i>
  </button>
</div>
  </div>
  </div>
  
  
		</div>
<div class="row">
		<div class="col-12">
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens">
<button type="button" 
class="btn mr-1 btn-primary regist" onclick="location.href='/ers/lsupporter/nonreportForm'">등록</button>
<button type="button" 
class="btn btn-danger delete">삭제</button>
</div>
</div>
</div>

<div class="row">
<div class="col-10">
<form action="#" method="get">
<table class="tg" style="undefined;table-layout: fixed; width: 492px">
<colgroup>
<col style="width: 120.333333px">
<col style="width: 55.333333px">
<col style="width: 140.333333px">
<col style="width: 80.333333px">
<col style="width: 170.333333px">
<col style="width: 120.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-baqh">
      <input type="checkbox" id="selectAll">
      전체선택
    </th>
    <th class="tg-baqh">번호</th>
    <th class="tg-baqh">상담일자</th>
    <th class="tg-baqh">상담자</th>
    <th class="tg-baqh">보고서 구분</th>
    <th class="tg-baqh">열람 여부</th>
  </tr>
</thead>
<c:forEach items="${reportList }" var="report">
<fmt:formatDate value="${report.regDate }" pattern="yy-MM-dd" var="regDate"/>
<tbody>
  <tr>
    <td class="tg-0lax">
      <input type="checkbox" class="text-center check_box" style="width:30px;height:30px;margin-top:7px;"/>
    </td>
    <td class="tg-0lax">${report.RNo }</td>
    <td class="tg-0lax">${regDate }</td>
    <td class="tg-0lax">${report.name }</td>
    <td class="tg-0lax">${report.reType }</td>
    <td class="tg-0lax">${report.viewCheck }</td>
  </tr>
 
</tbody>
</c:forEach>
</table>
</form>
</div>
</div>
<br/><br/>
<%@include file="../include/lsupporter/pagination.jsp"%>
		</div>
</div>


		</div>
</div>

</div>
</div>

</div>

</div>

</div>

</div>


<script>
$(function() {
	  // 전체선택 체크박스를 클릭할 때
	  $("#selectAll").click(function() {
	    // 전체선택 체크박스가 체크되어 있는 경우
	    if ($(this).prop("checked")) {
	      // 모든 체크박스를 체크
	      $(".check_box").prop("checked", true);
	    } else {
	      // 모든 체크박스의 체크를 해제
	      $(".check_box").prop("checked", false);
	    }
	  });

	  // 개별 체크박스를 클릭할 때
	  $(".check_box").click(function() {
	    // 모든 체크박스가 체크되어 있는 경우
	    if ($(".check_box:checked").length == $(".check_box").length) {
	      // 전체선택 체크박스를 체크
	      $("#selectAll").prop("checked", true);
	    } else {
	      // 전체선택 체크박스의 체크를 해제
	      $("#selectAll").prop("checked", false);
	    }
	  });
	});

$('#family')

</script>



<%@include file="../include/lsupporter/foot.jspf"%>
