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
<c:set var="pageMaker" value="${reportListMap.pageMaker}"/>
<c:set var="cri" value="${reportListMap.cri }"/>


<div class="row">
<div class="col-12 mb-2 text-right">
<button type="button" class="btn btn-primary  btn-md mr-2" onclick="location.href='/ers/lsupporter/lifemodifyForm?id=${memberdetail.id}'">정보수정
<i class="fa fa-check"></i>
</button>
</div>
</div>
<div class="container-fluid">
<div class="row">
<div class="col-md-3">

<div class="card card-primary card-outline">
<div class="card-body box-profile">
<div class="text-center" style="width:300px;height:300px;">
<span class="manPicture" data-id="${memberdetail.id }" style="width:80px;height:80px;display:block;margin:0 auto;"></span>
</div>
<h3 class="profile-username text-center" style="color:black;">${memberdetail.name }</h3>
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
<ul class="nav nav-tabs nav-pills justify-around">
  <li class="nav-item">
    <a class="tab_name active" href="#activity" data-toggle="tab">대상자정보</a>
  </li>
  <li class="nav-item">
    <a class="tab_name" href="#systemstatus" data-toggle="tab">서비스정보</a>
  </li>
  <li class="nav-item">
    <a class="tab_name" href="#carewordlist" data-toggle="tab">보고서</a>
  </li>
</ul>

</div>
<div class="card-body">
<div class="tab-content">
<div class="tab-pane active" id="activity">

<form class="form-horizontal">

<table class="type03">
<colgroup>
<col style="width: 210.333333px">
<col style="width: 480.333333px">
</colgroup>
<thead>
  <tr>

    <th class="tg-bbbb">대상자명 </th>
    <td class="title_name">${memberdetail.name }</td>
  </tr>
</thead>
<tbody>
  <tr>
    <th class="tg-bbbb">나이</th>
    <td class="title_name">${memberdetail.age }</td>
  </tr>
  <tr>
    <th class="tg-bbbb">전화번호</th>
    <td class="tg-0lax">${memberdetail.phone }</td>
  </tr>
  <tr>
    <th class="tg-bbbb">고위험수준</th>
   
   <c:if test="${memberdetail.caution == 'Y'}">
    <td class="tg-0lax">고위험</td>
    </c:if>
    <c:if test="${memberdetail.caution == 'N'}">
    <td class="tg-0lax">양호</td>
    </c:if>
  </tr>
  <tr>
    <th class="tg-bbbb">심장박동기 부착여부</th>
    <c:if test="${memberdetail.pacemaker =='Y'}">
    <td class="tg-0lax">부착</td>
    </c:if>
    <c:if test="${memberdetail.pacemaker =='N'}">
    <td class="tg-0lax">미부착</td>
    </c:if>
  </tr>
    <tr>
    <th class="tg-bbbb">대상자 구분</th>
    <td class="tg-0lax">${memberdetail.memType }</td>
  </tr>
  <tr>
    <th class="tg-bbbb">거주지주소</th>
    <td class="tg-0lax">${memberdetail.address }</td>
  </tr>
  <tr>
    <th class="tg-bbbb">질병정보</th>
    <td class="tg-0lax">${memberdetail.orgdisease }</td>
  </tr>
  <tr>
    <th class="tg-bbbb">복용약물내역</th>
    <td class="tg-0lax">${memberdetail.drug }</td>
  </tr>
   <tr>
    <th class="tg-bbbb">알러지</th>
    <td class="tg-0lax">${memberdetail.allergy }</td>
  </tr>
  <tr>
    <th class="tg-bbbb">심리상태</th>
    <td class="tg-0lax">${memberdetail.mentalstatus }</td>
  </tr>
  <tr>
    <th class="tg-bbbb">가족과의 친분도</th>
    <td class="tg-0lax">${memberdetail.fam_rel }</td>
  </tr>
<c:forEach var="ecall" items="${memberEcall}"  varStatus="state">
  <tr>
    <th class="tg-bbbb">긴급연락망${state.index+1 }<br/>(이름/관계/연락처)</th>
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
<table class="type03" style="width: 100%;">
<colgroup>
<col style="width: 200.333333px">
<col style="width: 110.333333px">
<col style="width: 140.333333px">
<col style="width: 80.333333px">
<col style="width: 120.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-bbbb">기기명</th>
    <th class="tg-bbbb" >모델명</th>
    <th class="tg-bbbb">설치일자</th>
    <th class="tg-bbbb">교체<br/>여부</th>
    <th class="tg-bbbb">교체<br/>일자</th>
  </tr>
</thead>
<c:forEach items="${machinList }" var="machin">
<fmt:formatDate value="${machin.regDate }" pattern="yy-MM-dd" var="regDate"/>
<fmt:formatDate value="${machin.changeDate }" pattern="yy-MM-dd" var="changeDate"/>
<tbody>
  <tr>
    <th class="tg-bbbb">${machin.name }</th>
    <td class="tg-0lax" style="text-align:center;">${machin.MCode }</td>
    <td class="tg-0lax" style="text-align:center;">${regDate }</td>
    <td class="tg-0lax" style="text-align:center;">${machin.changeStatus }</td>
    <td class="tg-0lax" style="text-align:center;">${changeDate }</td>
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
<option value="lp" ${cri.searchType eq 'lp' ? 'selected':'' }>상담자</option>
<option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>보고서구분</option>
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
class="btn mr-1 btn-primary btn-md regist" onclick="location.href='/ers/lsupporter/reportForm?id='+${memberdetail.id}">등록
<i class="fa fa-check"></i>
</button>
<button type="button" 
class="btn btn-danger btn-md delete">삭제
  <i class="fa fa-times"></i>
</button>
</div>
</div>
</div>

<div class="row">
<div class="col-12">
<table class="type03" style="width:100%;">
<colgroup>
<col style="width: 60.333333px">
<col style="width: 55.333333px">
<col style="width: 140.333333px">
<col style="width: 80.333333px">
<col style="width: 170.333333px">
<col style="width: 120.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-baqh">
     선택
    </th>
    <th class="tg-0lax">번호</th>
    <th class="tg-0lax">상담일자</th>
    <th class="tg-0lax">상담자</th>
    <th class="tg-0lax">보고서<br/>구분</th>
    <th class="tg-0lax">열람<br/>여부</th>
  </tr>
</thead>
	<c:forEach items="${reportList }" var="report" varStatus="status">
<fmt:formatDate value="${report.regDate }" pattern="yy-MM-dd" var="regDate"/>
<tbody>
  <tr>
     <td class="tg-73oq" style="text-align:center;"><input type="checkbox"  class="text-center check_box checkbox" name="selectedMembers" value="${report.RNo}"/></td>
    <td style="text-align:center;"class="">${report.RNo }번</td>
    <td style="text-align:center;" class="">${regDate }</td>
    <td  style="text-align:center;"class="">${report.name }</td>
    <td  style="text-align:center;"class="">
<c:if test="${report.reType == 1}">응급상황</c:if>
  <c:if test="${report.reType == 2}">고객면담</c:if>
  <c:if test="${report.reType == 3}">건강상태</c:if>
  <c:if test="${report.reType == 4}">서비스취소</c:if>
  <c:if test="${report.reType == 5}">장기부재</c:if>
  <c:if test="${report.reType == 6}">악성대상자신고</c:if>
  <c:if test="${report.reType == 7}">장비점검</c:if>
</td>
    <td style="text-align:center;" class="">
<c:if test="${report.viewCheck == 0 }">미열람</c:if>
 <c:if test="${report.viewCheck == 1 }">열람</c:if>
</td>
  </tr>
</tbody>
</c:forEach>
</table>
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
