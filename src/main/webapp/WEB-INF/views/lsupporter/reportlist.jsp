<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="memberList" value="${dataMap.memberList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/reportlist.css">
<!-- Content Wrapper. Contains page content -->


		<!-- Main content -->
		<section class="content-header" style="height:1700px;">
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
  <select class="keywordoption"name="searchType" id="searchType" >
   <option value="" disabled>검 색</option>
<option value="nbg" ${cri.searchType eq 'nbg' ? 'selected':'' }>전체</option>
<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
<option value="g" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
<option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>활동여부</option>
<option value="rd" ${cri.searchType eq 'rd' ? 'selected':'' }>남은정기상담일</option>
  </select>
<div class="search_container flex items-center">
  <input class="searchinput w-full" autocomplete="false" type="text" name="keyword" required="required" value="${cri.keyword}" id="search_keyword" onkeyup="handleEnterKey(event)">
  <button type="button" class="absolute right-0 top-0 bottom-0 p-2 right-1.25" id="button" data-card-widget="search" onclick="list_go(1);">
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
class="btn btn-lg btn-dark regist backbtn" onclick="history.back();">뒤로가기</button>
<button type="button" 
class="btn btn-md mr-1 btn-primary regist" onclick="location.href='/ers/lsupporter/nonmemberreportForm'">등록</button>
<button type="submit" class="btn btn-danger btn-md ml-2" onclick="deleteSelectedMembers();">삭제</button>
</div>
</div>
</div>

<div class="tableContainer">
<div class="row">
<div class="col-12 memberlistable" id="tableContent">
<table class="tg memberlistable table searchlist">
<colgroup>
<col style="width: 23px">
<col style="width: 23px">
<col style="width: 200px">
<col style="width: 60px">
<col style="width: 23px">
<col style="width: 60px">
<col style="width: 120px">
</colgroup>
<thead>
  <tr>
    <th class="tg-yj5y">
     선택</th>
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
<c:forEach items="${memberList }" var="member">
<fmt:formatDate value="${member.regDate}" var="regDate" pattern="yy-MM-dd" />
  <tr>
    <td class="tg-3xi5"> <input type="checkbox" class="text-center check_box checkbox" name="selectedMembers" value="${member.RNo}"/></td>
<td class="tg-3xi5">${member.RNo }</td> 
    <td class="tg-3xi5">
    <span class="manPicture" data-id="${member.id }" style="width:80px;height:80px;display:block;margin:0 auto;"></span>
    </td>
    <td class="tg-3xi5" onclick="location.href='/ers/lsupporter/memberdetail?id='+${member.id}">${member.name }</td>
    <td class="tg-3xi5">${member.gender }</td>
 <td class="tg-3xi5" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">
  <c:if test="${member.reType == 1}">응급상황</c:if>
  <c:if test="${member.reType == 2}">고객면담</c:if>
  <c:if test="${member.reType == 3}">건강상태</c:if>
  <c:if test="${member.reType == 4}">서비스취소</c:if>
  <c:if test="${member.reType == 5}">장기부재</c:if>
  <c:if test="${member.reType == 6}">악성대상자신고</c:if>
  <c:if test="${member.reType == 7}">장비점검</c:if>
 </td>
    <td class="tg-3xi5">${regDate }</td>
 <c:if test="${member.viewCheck == 0 }"><td class="tg-3xi5">미열람</td></c:if>
 <c:if test="${member.viewCheck == 1 }"><td class="tg-3xi5">열람</td></c:if>
  </tr>
  </c:forEach>
</tbody>
</table>
</div>
</div>
</div>

<%@include file="../include/lsupporter/pagination.jsp"%>
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
  form.action = '/ers/lsupporter/remove';

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
  window.onload=function(){
  	MemberPictureThumb('<%=request.getContextPath()%>');
  }
</script>



<%@include file="../include/lsupporter/foot.jspf"%>




