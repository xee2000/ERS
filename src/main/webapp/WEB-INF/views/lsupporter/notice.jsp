<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/notice.css">
<c:set var="noticeList" value="${dataMap.noticeList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>

		<!-- Main content -->
		<section class="content-header" style="height:1100px;">
<div class="row">
<div class="col-12">
<h3 class="carelist_title">공지사항</h3>
</div>
</div>
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
  <option value="tc" ${cri.searchType eq 'all' ? 'selected':'' }>전체</option>
  <option value="t" ${cri.searchType eq 'n' ? 'selected':'' }>제목</option>
  <option value="tc" ${cri.searchType eq 'g' ? 'selected':'' }>제목+내용</option>
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
		<button type="button" class="btn btn-dark btn-lg ml-3" onclick="location.href='/ers/lsupporter/notice/writeForm'">작성</button>

	<div class="row">
	<div class="col-12 memberlistable">
	
	<table class="tg notice_table" style="undefined;table-layout: fixed; width: 498px">
	<colgroup>
	<col style="width: 100.333333px">
	<col style="width: 250.333333px">
	<col style="width: 200px">
	<col style="width: 150.666666px">
	<col style="width: 150.666666px">
	</colgroup>
	<thead>
	  <tr>
	    <th class="tg-c3ow">번호</th>
	    <th class="tg-c3ow">제목</th>
	    <th class="tg-c3ow">등록일자</th>
	    <th class="tg-c3ow">작성자</th>
	    <th class="tg-c3ow">조회수</th>
	  </tr>
	</thead>
	<tbody>
	<c:forEach items="${noticeList }" var="notice">
	<fmt:formatDate value="${notice.regDate }" var="regDate" pattern="yyyy-MM-dd"/>
	  <tr>
	    <td class="tg-0pky">${notice.NNo }</td>
	    <td class="tg-0pkk" onclick="location.href='/ers/lsupporter/notice/detail?nNo='+${notice.NNo}">${notice.title }</td>
	    <td class="tg-0pky">${regDate }</td>
	    <td class="tg-0pky">${notice.manId }</td>
	    <td class="tg-0pky">${notice.count }</td>
	  </tr>
	  
	</c:forEach>
	</tbody>
	</table>
	<%@include file="../include/lsupporter/pagination.jsp"%>
	</div>
	</div>


		</div>
</div>


</section>
<!--foot -->


<%@include file="../include/lsupporter/foot.jspf"%>





