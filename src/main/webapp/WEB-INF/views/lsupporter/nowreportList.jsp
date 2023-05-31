<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="memberList" value="${dataMap.memberList }"/>
<c:set var="educationCount" value="${dataMap.educationCount }"/>
<c:set var="lifereportCount" value="${dataMap.lifereportCount }"/>
<c:set var="falsereportCount" value="${dataMap.falsereportCount }"/>
<c:set var="longreportCount" value="${dataMap.longreportCount }"/>
<c:set var="devilreportCount" value="${dataMap.devilreportCount }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/emergencylist.css">
<!-- Content Wrapper. Contains page content -->

		<!-- Main content -->
		<section class="content-header">
		
		<h3 class="emergancylist_title mb-5">당일 보고서이력</h3>
		<div class="row" >
  <div class="col-md-12">
    <div class="consulting_status">
      <div class="emergany_status_list flex text-center justify-center">
        <div class="col-lg-2 col-2">
          <div class="small-box bg-primary">
           <div class="inner" id="noweducationactive">
      <h3>${educationCount }건</h3>
      <p class="info_text" style="font-size:1.4rem;">고객상담</p>
    </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-2">
          <div class="small-box bg-primary">
            <div class="inner" id="noweducationfuture">
              <h3>${lifereportCount }건</h3>
      <p class="info_text" style="font-size:1.4rem;">건강상태</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-2">
          <div class="small-box bg-primary">
            <div class="inner" id="noweducationclear">
               <h3>${falsereportCount }건</h3>
      <p class="info_text" style="font-size:1.4rem;">서비스취소</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-2">
          <div class="small-box bg-primary">
            <div class="inner" id="noweducationmiss">
               <h3>${longreportCount }건</h3>
              <p class="info_text" style="font-size:1.4rem;">장기부재</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-2">
          <div class="small-box bg-primary">
            <div class="inner" id="noweducationclear">
               <h3>${devilreportCount }건</h3>
      <p class="info_text" style="font-size:1.4rem;">악성대상자</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="row">
		<div class="col-12">
		<div class="category_date_menubar">
  <div class="search_bar search_bar_main flex mb-5">
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
  <button type="button" class="absolute right-0 top-0 bottom-0 p-2" id="button" data-card-widget="search" onclick="list_go(1);">
    <i class="fa fa-search"></i>
  </button>
</div>
  </div>
  </div>
  
  
		</div>
		
		
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens">
 <button class="btn btn-danger btn-layer-3_4" onclick="deleteSelectedMembers();">
        삭제
        <i class="fa fa-check"></i>
    </button>
</div>
</div>
</div>

<div class="row mb-3">
<div class="col-12 memberlistable">
<table class="tg memberlistable " style="width:100%;">
<thead>
  <tr>
    <th class="check_box tg-nqa4"><input type="checkbox" id="selectAll" class="text-center  checkbox">
      전체선택</th>
    <th class="tg-nqa4">번호</th>
    <th class="tg-nqa4">사진</th>
    <th class="tg-nqa4">대상자명</th>
    <th class="tg-nqa4">보고서명</th>
    <th class="tg-nqa4">열람여부</th>
  </tr>
</thead>
<c:forEach items="${memberList }" var="member" >
<tbody>
  <tr>
     <td class="tg-73oq"> <input type="checkbox" class="text-center check_box checkbox" name="selectedMembers" value="${member.RNo}"/></td>
    <td class="tg-73oq">${member.RNo}</td>
    <td class="tg-73oq">
    <span class="manPicture" data-id="${member.id }" style="width:80px;height:80px;display:block;margin:0 auto;"></span>
    </td>
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/memberdetail?id='+${member.id}">${member.name }</td>
  <c:if test="${member.reType == 1 }">
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">응급상황</td>
  </c:if>
   <c:if test="${member.reType == 2 }">
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">고객면담</td>
  </c:if>
   <c:if test="${member.reType == 3 }">
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">건강상태</td>
  </c:if>
   <c:if test="${member.reType == 4 }">
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">서비스취소</td>
  </c:if>
   <c:if test="${member.reType == 5 }">
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">장기부재</td>
  </c:if>
   <c:if test="${member.reType == 6 }">
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">악성대상자신고</td>
  </c:if>
   <c:if test="${member.reType == 7 }">
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${member.RNo}">장비점검</td>
  </c:if>
   <c:if test="${member.viewCheck == 0}">
    <td class="tg-73oq">미열람</td>
   </c:if>
     <c:if test="${member.viewCheck == 1}">
    <td class="tg-73oq">열람</td>
   </c:if>
  </tr>
  
</tbody>
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
  form.action = '/ers/lsupporter/nowreportListremove';

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
<%@include file="../include/lsupporter/foot.jspf"%>





