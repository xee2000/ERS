<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="reportList" value="${dataMap.reportList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<link rel="stylesheet" href="/resources/lsupporter/css/emergencylist.css">
<!-- Content Wrapper. Contains page content -->


		<!-- Main content -->
		<section class="content-header" style="height:1700px;">
<h3 class="emergancylist_title mb-2">보고서 목록</h3>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">
		<div class="date mb-4">
		<input type="date" name="startday" value="${param.startday}" style="width:250px;border:1px solid black;">
&nbsp;&nbsp;<span class="dash">-</span>
&nbsp;&nbsp;<input type="date" name="endday" value="${param.endday}" id="enddayInput" oninput="datesearch();" style="width:250px;border:1px solid black;">

		</div>
  <div class="search_bar search_bar_main flex mb-1">
 <div class="search_bar flex">
 <select class="keywordoption mr-2" name="searchType" id="searchType">
  <option value="" disabled selected>검색</option>
  <option value="all" ${cri.searchType eq 'all' ? 'selected':'' }>전체</option>
  <option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
  <option value="g" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
  <option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>활동여부</option>
</select>
<div class="search_container flex items-center border border-gray-300 rounded-md overflow-hidden">
  <input class="searchinput w-full py-2 px-4 pr-10" autocomplete="off" type="text" name="keyword" required value="${cri.keyword}" id="search_keyword" onkeyup="handleEnterKey(event)">
  <button type="button" class="absolute right-0 top-0 bottom-0 p-2" id="button" data-card-widget="search" onclick="list_go(1);">
    <i class="fa fa-search"></i>
  </button>
</div>
  </div>
  </div>
  
  
		</div>
		
		
		
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens justify-between ">
<button type="button" class="btn btn-danger btn-layer-3_1" onclick="deleteSelectedMembers();">삭제
  <i class="fa fa-times"></i>
</button>
<button type="button" class="btn btn-primary btn-layer-3_1" onclick="location.href='/ers/lsupporter/nonmemberreportForm'">등록
   <i class="fa fa-check"></i>
</button>
</div>
</div>
</div>

<div class="row">
<div class="col-12 memberlistable">
<table class="tg memberlistable table" style="width:100%;">
<thead>
  <tr>
    <th class="tg-nqa4">
     선택</th>
    <th class="tg-nqa4">번호</th>
    <th class="tg-nqa4">사진</th>
    <th class="tg-nqa4">대상자명</th>
    <th class="tg-nqa4">성별</th>
    <th class="tg-nqa4">보고서명</th>
    <th class="tg-nqa4">작성일</th>
    <th class="tg-nqa4">열람여부</th>
  </tr>
</thead>
<tbody>
<c:forEach items="${reportList }" var="report">
<fmt:formatDate value="${report.regDate}" var="regDate" pattern="yy-MM-dd" />
  <tr>
    <td class=tg-73oq> <input type="checkbox" class="text-center check_box checkbox" name="selectedMembers" value="${report.RNo}"/></td>
<td class="tg-3xi5">${report.RNo }번</td> 
    <td class="tg-73oq">
    <span class="manPicture" data-id="${report.id }" style="width:80px;height:80px;display:block;margin:0 auto;"></span>
    </td>
    <td class="tg-73oq membername" onclick="location.href='/ers/lsupporter/memberdetail?id='+${report.id}">${report.name }</td>
    <td class="tg-73oq">${report.gender }</td>
 <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${report.RNo}">
  <c:if test="${report.reType == 1}">응급상황</c:if>
  <c:if test="${report.reType == 2}">고객면담</c:if>
  <c:if test="${report.reType == 3}">건강상태</c:if>
  <c:if test="${report.reType == 4}">서비스취소</c:if>
  <c:if test="${report.reType == 5}">장기부재</c:if>
  <c:if test="${report.reType == 6}">악성대상자신고</c:if>
  <c:if test="${report.reType == 7}">장비점검</c:if>
 </td>
    <td class="tg-73oq">${regDate }</td>
 <c:if test="${report.viewCheck == 0 }"><td class="tg-3xi5">미열람</td></c:if>
 <c:if test="${report.viewCheck == 1 }"><td class="tg-3xi5">열람</td></c:if>
  </tr>
  </c:forEach>
</tbody>
</table>
</div>
</div>
<%@include file="../include/lsupporter/pagination.jsp"%>
</div>

		</div>
</div>


</section>
<!--foot -->








