<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="memberList" value="${dataMap.memberList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/carelist.css">
<!-- Content Wrapper. Contains page content -->


		<!-- Main content -->
		<section class="content-header" style="height:2000px;">
<h3 class="carelist_title mb-5">돌봄업무 대상자 리스트</h3>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">
		
<div class="search_bar search_bar_main flex mb-3">
  <div class="search_bar mb-2  flex">
    <select class="keywordoption mr-2"name="searchType" id="searchType" >
     <option value="nbg" ${cri.searchType eq 'nbg' ? 'selected':'' }>전체</option>
<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
<option value="g" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
<option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>보고서명</option>
<option value="rd" ${cri.searchType eq 'rd' ? 'selected':'' }>작성일</option>
<option value="vc" ${cri.searchType eq 'vc' ? 'selected':'' }>열람여부</option>
    </select>
    <div class="search_container flex items-center">
      <input class="searchinput w-full" autocomplete="false" type="text" name="keyword" required="required" value="${cri.keyword}" id="search_keyword" onkeyup="handleEnterKey(event)">
      <button type="button" class="absolute right-0 top-0 bottom-0 p-2 right-1.25" id="button" data-card-widget="search" onclick="list_go(1);">
        <i class="fa fa-search"></i>
      </button>
    </div>
  </div>
</div>






  
 <div class="row flex text-start">
 <div class="col-12">
  <button type="button" class="btn btn-dark btn-lg backbtn mb-1" onclick="location.href='/usr/home/main'">뒤로가기</button>
 </div>
 </div>
  
  </div>
</div>

<div class="row">
<div class="col-12 memberlistable">
<form action="#" method="get">

<table class="tg memberlist" style="width:100%;">
<colgroup>
<col style="width: 70px">
<col style="width: 200px">
<col style="width: 150px">
<col style="width: 150px">
<col style="width: 80px">
<col style="width: 150px">
<col style="width: 200px">
</colgroup>
  <tr>
    <th class="tg-yj5y">번호</th>
    <th class="tg-yj5y">사진</th>
    <th class="tg-yj5y">대상자명</th>
    <th class="tg-yj5y">생년월일</th>
    <th class="tg-yj5y">성별</th>
    <th class="tg-yj5y">활동여부</th>
    <th class="tg-yj5y">남은정기상담일</th>
  </tr>
 <c:forEach items="${memberList}" var="member">
  <fmt:formatDate value="${member.activeTime}" pattern="yy-MM-dd" var="activeTime"/>
  <fmt:formatDate value="${member.regDate}" pattern="yy-MM-dd" var="regDate"/>
  <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yy-MM-dd" var="currentDate" />

  <tr>
    <td class="tg-3xi5">
      ${member.RNo}
    </td>
    <td class="tg-3xi5">
      ${member.picture}
    </td>
    <td class="tg-3xi5" onclick="location.href='/ers/lsupporter/memberdetail?id='+${member.id}">
      ${member.name}
    </td>
    <td class="tg-3xi5">
      ${member.birth}
    </td>
    <td class="tg-3xi5">
      ${member.gender}
    </td>
    <td class="tg-3xi5">
      <c:choose>
        <c:when test="${activeTime == currentDate}">
          Y
        </c:when>
        <c:otherwise>
          N
        </c:otherwise>
      </c:choose>
    </td>

    <td class="tg-3xi5">
      <span id="regDate" class="regDate">${regDate}</span>
    </td>
  </tr>
</c:forEach>
</table>
</form>
</div>
</div>


</div>

<%@include file="../include/lsupporter/pagination.jsp"%>


</section>
<!--foot -->


<script>
function list_go(page,url){
	
	if(!url) url="carelist";
	
	$("form#jobForm input[name='page']").val(page);
	$("form#jobForm input[name='perPageNum']").val($('select[name="perPageNum"]').val());
	$("form#jobForm input[name='searchType']").val($('select[name="searchType"]').val());
	$("form#jobForm input[name='keyword']").val($('input[name="keyword"]').val());
	
	$('form#jobForm').attr({
		action:url,
		method:'get'
	}).submit();
}
</script>

<Script>
var regDateElements = document.querySelectorAll("#regDate");

//Iterate over each regDate span element
regDateElements.forEach(function(regDateElement) {
// Get the current date value from the regDate span tag
var regDate = regDateElement.textContent;

// Extract only the day value from the regDate (assuming it's in the format "yy-MM-dd")
var day = parseInt(regDate.split("-")[2]);

// Get the current date
var currentDate = new Date();

// Get the day of the current date
var currentDay = currentDate.getDate();

// Calculate the final day count based on the conditions
var finalDay;
if (day === currentDay) {
 // Set the day count to 14 for the current day
 finalDay = 14;
} else {
 // Add 14 and subtract the original day count for previous dates
 finalDay = day + 14 - currentDay;
}

// Update the span tag with the new day value
regDateElement.textContent = finalDay.toString();
if (finalDay <= 1) {
    regDateElement.style.color = "red";
  }
});
</Script>

<%@include file="../include/lsupporter/foot.jspf"%>





