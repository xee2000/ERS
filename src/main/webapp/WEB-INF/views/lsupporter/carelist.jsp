<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
<c:set var="memberList" value="${dataMap.memberList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
     <c:set var="currentDate" value="<%= new java.util.Date() %>"/>
<link rel="stylesheet" href="/resources/lsupporter/css/emergencylist.css">
<!-- Content Wrapper. Contains page content -->



		<!-- Main content -->
		<section class="content-header">
<h3 class="emergancylist_title mb-4">대상자 돌봄내역</h3>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">

  <div class="search_bar search_bar_main flex mb-3">
 <div class="search_bar mb-2 flex">
<select class="keywordoption mr-2" name="searchType" id="searchType">
  <option value="" disabled selected>검색</option>
  <option value="all" ${cri.searchType eq 'all' ? 'selected':'' }>전체</option>
  <option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
  <option value="g" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
  <option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>활동여부</option>
</select>


<div class="search_container flex items-center border border-gray-300 rounded-md overflow-hidden">
  <input class="searchinput w-full py-2 px-4 pr-10" autocomplete="off" type="text" name="keyword" required value="${cri.keyword}" id="search_keyword" onkeyup="handleEnterKey(event)">
  <button type="button" class="absolute right-0 top-0 bottom-0 p-2" id="button" data-card-widget="search" onclick="carelist_go(1);">
    <i class="fa fa-search"></i>
  </button>
</div>

  </div>
  </div>
  
  
		</div>
		
		
		
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens justify-between ">
  <button class="btn btn-danger btn-layer-1_4" onclick="deleteSelectedMembers();">
        삭제 
        <i class="fa fa-times"></i>
    </button>
     <button class="btn btn-primary btn-layer-3_1" onclick="location.href='/ers/lsupporter/carenonmemberreportForm'">
        등록 
       <i class="fa fa-check"></i>
    </button>
 
</div>
</div>
</div>

<div class='row'>
  <div class="col-12" style="background-color: #f2f2f2; padding: 10px; border-radius: 5px;">
    <p style="font-weight: bold; color: red; font-size: 1.5rem;">정기상담 안내:</p>
    <p style="font-size: 1.5rem;">본 정기상담의 경우 <span style="font-weight: bold; color: red;">장애인으로 구분된 경우</span> 보고서 작성일 기준 <span style="font-weight: bold; color: red;">14일</span>로 등록되며, <span style="font-weight: bold; color: red;">독거노인의 경우</span> <span style="font-weight: bold; color: red;">30일</span>로 등록됩니다.</p>
  </div>
</div>


<div class="row">
<div class="col-12 memberlistable">
<table class="tg memberlistable table" style="width:100%;">

<thead>
  <tr>
	 <th class="tg-nqa4">선택</th>
    <th class="tg-nqa4">번호</th>
    <th class="tg-nqa4">사진</th>
    <th class="tg-nqa4">대상자명</th>
    <th class="tg-nqa4">나이</th>
    <th class="tg-nqa4">성별</th>
    <th class="tg-nqa4">활동여부</th>
    <th class="tg-nqa4">남은정기상담일</th>

  </tr>
</thead>
    <c:forEach items="${memberList}" var="member">
  <fmt:formatDate value="${member.activeTime}" pattern="yy-MM-dd" var="activeTime"/>
  <fmt:formatDate value="${member.regDate}" pattern="yy-MM-dd" var="regDate"/>
  
  <tr>
    <td style="display:none;">
      <span id="memType">${member.memType}</span>
    </td>
    <td class="tg-73oq">
      <input type="checkbox" class="text-center check_box checkbox"  name="selectedMembers" value="${member.RNo}"/>
    </td>
    <td class="tg-73oq reportdetail" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">${member.RNo}번</td>
    <td class="tg-73oq">
      <span class="manPicture" data-id="${member.id}" style="width:80px;height:80px;display:block;margin:0 auto;"></span>
    </td>
    <td class="tg-73oq membername" onclick="location.href='/ers/lsupporter/memberdetail?id=${member.id}'">
      ${member.name}
    </td>
    <td class="tg-73oq">
      ${member.age}
    </td>
    <td class="tg-73oq">
      ${member.gender}
    </td>
    <td class="tg-73oq">
      <c:choose>
        <c:when test="${activeTime == currentDate}">
          활동중
        </c:when>
        <c:otherwise>
          미활동
        </c:otherwise>
      </c:choose>
    </td>
    <td class="tg-73oq">
      <span id="regDate" class="regDate">${regDate}</span>일
    </td>
  </tr>
</c:forEach>
</table>
</div>
</div>
<%@include file="../include/lsupporter/pagination.jsp"%>

		</div>
</div>


</section>
<!--foot -->

<script>
function deleteSelectedMembers() {
  var selectedMembers = [];
  var checkboxes = document.getElementsByName('selectedMembers');

  for (var i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i].checked) {
      selectedMembers.push(checkboxes[i].value);
    }
  }

  if (selectedMembers.length === 0) {
    // No reports selected, handle the case accordingly
    return;
  }

  // Create a form dynamically
  var form = document.createElement('form');
  form.method = 'POST';
  form.action = '/ers/lsupporter/carelistremove';

  // Add hidden input fields for each selected report number
  for (var j = 0; j < selectedMembers.length; j++) {
    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'rNo';
    input.value = selectedMembers[j];
    form.appendChild(input);
  }

  // Append the form to the document
  document.body.appendChild(form);

  // Show confirmation dialog using Swal (SweetAlert)
  Swal.fire({
    title: '<strong>보고서 삭제</strong>',
    icon: 'warning',
    html: selectedMembers.join(', ') + ' 번의 보고서를 정말로 삭제하시겠습니까?',
    showCloseButton: true,
    showCancelButton: true,
    focusConfirm: false,
    confirmButtonText: '삭제',
    cancelButtonText: '취소',
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire(
        '삭제처리가 완료되었습니다.',
        '',
        'success'
      ).then(() => {
        // Submit the form
        form.submit();
      });
    }
  });
}
</script>
<script>
var regDateElements = document.querySelectorAll("#regDate");

//Iterate over each regDate span element
regDateElements.forEach(function (regDateElement) {
// Get the memType value from the corresponding member row
var memType = regDateElement.parentNode.parentNode.parentNode.parentNode.querySelector("#memType").textContent.trim();

// Get the current date
var currentDate = new Date();

// Get the day of the current date
var currentDay = currentDate.getDate();

// Calculate the final day count based on memType
var finalDay;
if (memType === "독거노인") {
 finalDay = 30;
} else if (memType === "장애인") {
 finalDay = 14;
}

// Update the span tag with the new day value
regDateElement.textContent = finalDay.toString();
if (finalDay <= 1) {
 regDateElement.style.color = "red";
 regDateElement.style.fontWeight = "bold";
}
});


</script>

<%@include file="../include/lsupporter/foot.jspf"%>





