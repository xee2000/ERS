<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="noticeList" value="${dataMap.memberList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/reportlist.css">
<!-- Content Wrapper. Contains page content -->


		<!-- Main content -->
		<section class="content-header" style="height:1200px;">
<h3 class="emergancylist_title mb-2">보고서 목록</h3>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">
		<div class="date">
		<label class="date_select">날짜조회 :</label>
		<input type="date" name="startday" style="width:250px;border:1px solid black;">&nbsp;&nbsp;<span class="dash">-</span>
		&nbsp;&nbsp;<input type="date" name="endday" style="width:250px;border:1px solid black;">
		</div>
  <div class="search_bar search_bar_main flex mb-5">
 <div class="search_bar mb-2 flex">
  <select class="keywordoption"id="카테고리" id="searchType">
   <option value="">검 색</option>
<option value="t" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
<option value="c" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
<option value="tc" ${cri.searchType eq 'r' ? 'selected':'' }>보고서명</option>
<option value="tc" ${cri.searchType eq 'rd' ? 'selected':'' }>작성일</option>
<option value="tc" ${cri.searchType eq 'vc' ? 'selected':'' }>열람여부</option>
  </select>
<div class="search_container flex items-center">
  <input class="searchinput w-full" type="text" id="검색어" name="q" required>
  <button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
    <i class="fa fa-search"></i>
  </button>
</div>
  </div>
  </div>
  
  
		</div>
		
		
		
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens">
<button type="button" 
class="btn btn-lg btn-dark regist backbtn" onclick="location.href='/usr/home/main'">뒤로가기</button>
<button type="button" 
class="btn btn-lg mr-1 btn-primary regist" onclick="location.href='/usr/home/nonmemberreportForm'">등록</button>
<button type="button" 
class="btn btn-lg btn-danger delete">삭제</button>
</div>
</div>
</div>

<div class="row">
<div class="col-12 memberlistable">
<form action="#" method="get">
<table class="tg memberlistable table">
<colgroup>
<col style="width: 23px">
<col style="width: 23px">
<col style="width: 200px">
<col style="width: 60px">
<col style="width: 23px">
<col style="width: 60px">
<col style="width: 120px">
<col style="width: 50px">
</colgroup>
<thead>
  <tr>
    <th class="tg-yj5y"><input type="checkbox" id="selectAll">
      전체선택</th>
    <th class="tg-yj5y">번호</th>
    <th class="tg-yj5y">사진</th>
    <th class="tg-yj5y">대상자명</th>
    <th class="tg-yj5y">성별</th>
    <th class="tg-yj5y">보고서명</th>
    <th class="tg-yj5y">작성일</th>
    <th class="tg-yj5y">열람여부</th>
  </tr>
</thead>
<tbody>
<c:forEach items="${memberlist }" var="member">
<fmt:formatDate value="${member.regdate }" pattern="yyyy-mm-dd" var="regdate"/>
  <tr>
    <td class="tg-3xi5"> <input type="checkbox" class="text-center check_box checkbox"/></td>
    <td class="tg-3xi5"> 1</td>
    <td class="tg-3xi5">
    <img src="/img/노인이미지.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-3xi5" onclick="location.href='/usr/home/emergancydetail'">${member.name }</td>
    <td class="tg-3xi5">${member.gender }</td>
    <td class="tg-3xi5">${member.retype }</td>
    <td class="tg-3xi5" onclick="location.href='/usr/home/educationdetail'">${regdate }</td>
    <td class="tg-3xi5">${member.viewcheck }</td>
  </tr>
  </c:forEach>
</tbody>
</table>
</form>
</div>
</div>

<%@include file="../include/lsupporter/pagination.jsp
"%>
		</div>
</div>


</section>
<!--foot -->
<script>
  // Get the "전체선택" checkbox element
  var selectAllCheckbox = document.getElementById("selectAll");

  // Get all other checkboxes in the table
  var checkboxes = document.getElementsByClassName("check_box");

  // Add an event listener to the "전체선택" checkbox
  selectAllCheckbox.addEventListener("change", function () {
    // Loop through all checkboxes and set their checked property to match the "전체선택" checkbox
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = selectAllCheckbox.checked;
    }
  });

  // Add event listeners to the other checkboxes to update the "전체선택" checkbox
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].addEventListener("change", function () {
      // Check if all other checkboxes are checked
      var allChecked = true;
      for (var j = 0; j < checkboxes.length; j++) {
        if (!checkboxes[j].checked) {
          allChecked = false;
          break;
        }
      }

      // Update the "전체선택" checkbox based on the state of the other checkboxes
      selectAllCheckbox.checked = allChecked;
    });
  }
</script>


<%@include file="../include/lsupporter/foot.jspf"%>




