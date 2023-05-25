	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<%@include file="../include/lsupporter/head.jspf"%>
<%--  <%@include file="../include/lsupporter/toastUiEditorLib.jspf" %> --%>
<link rel="stylesheet" href="/resources/lsupporter/css/nonmemberreportForm.css">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<div class="tab-pane" id="carewordlist">
<div class="col-md-12">
<div class="reportForm">
<div class="form-group row">

<h1 class="report_title" style="margin:0 auto;">보고서</h1>
</div>
</div>
</div>

<c:set var="ymd" value="<%=new java.util.Date()%>" />
<div class="row">
<div class="col-12 flex justify-end mb-1">
<button type="button" class="btn btn-dark btn-md backbtn" onclick="location.href='/usr/home/reportlist'">뒤로가기</button>
<button type="submit" class="btn btn-primary btn-md" onclick="regist_go();">제출</button>
</div>
</div>

<table class="tg mb-3" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 249.333333px">
<col style="width: 252.333333px">
</colgroup>
<thead>
  <tr>
    <th >보고서 작성일자</th>
    <td style="text-align:center;">
    <span class="regDate"><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /></span>
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>대상자</th>
    <td>
<div class="search_container flex items-center">
  <input onclick="modalopen();" value="" class="searchinput searchinput_name w-full" type="text" id="searchinput" name="name" required>
  <button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
     <i class="fa fa-search" style="padding-left: 120px;" id="popupBtn"></i>
  </button>
</div>
      <!--모달창  -->
      <div id="modalWrap">
  <div id="modalContent">
    <div id="modalBody">
      <span id="closeBtn">&times;</span>
      <!--모달창  -->
      <div class="callist">
<div class="row">
<div class="col-12">
<h3 class="caltitle mt-2">대상자 이름조회</h3>
</div>
</div>



<form>
<table class="tg table table_list" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150.333333px">
<col style="width: 300px">
</colgroup>
  <tr>
    <th class="tg-l8qj" >
<select class="form-control" style="font-size: 1.5rem;height: auto;" name="searchType" id="searchType">
   <option value="nbg" ${cri.searchType=='nbg' ? "selected":"" } >전체</option>
   <option value="n" ${cri.searchType=='n' ? "selected":"" } >대상자명</option>
   <option value="b" ${cri.searchType=='b' ? "selected":"" }>나이</option>
   <option value="g" ${cri.searchType=='g' ? "selected":"" }>성별</option>
</select>
</th>
   <th class="tg-l8qj">
<div class="search_container flex items-center">
  <input onclick="modalopen();" value="" class="searchinput searchinput_name w-full" type="text" id="searchinput" name="name" required>
  <button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
     <i class="fa fa-search" style="padding-left: 120px;" id="popupBtn"></i>
  </button>
</div>
</th>
  </tr>
</tbody>
</table>
</form>

<div class="row">
<div class="col-12">


<table class="tg searchlist" style="undefined;table-layout: fixed;">
<colgroup>
<col style="width: 100px">
<col style="width: 100.333333px">
<col style="width: 70.333333px">
<col style="width: 70.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-uqo3">이미지</th>
    <th class="tg-2xpi">대상자명</th>
    <th class="tg-2xpi">성별</th>
    <th class="tg-uqo3">나이</th>
  </tr>
</thead>
	<c:forEach var="member" items="${memberList }">
	<tbody>
	  <tr>
	  <td style="display:none" class="modal_content" id="memberid" >
	 <input type="hidden" class="member-id" value="${member.id}" />
	  </td>
	    <td class="modal_content">
	    ${member.picture }
	    </td>
	    <td class="modal_content" id="modalname">
	   ${member.name }
	</td>
	    <td class="modal_content">
	    ${member.gender }
	    </td>
	    <td class="modal_content">
	${member.birth }
	</td>
	  </tr>
	</tbody>
	</c:forEach>
</table>


<%@include file="../include/lsupporter/pagination.jsp"%>

</div>

</div>
      
    </div>
  </div>
</div>
 
  </div>
</td>
  </tr>
  <tr>
    <th class="tg-2xpi">보고서 구분</th>
    <td class="tg-2xpi">
    <select name="reType" style="text-align:center;" class="reportmenu" onchange="toggleReportForms()">
    <option selected disabled value="====">선택</option>
    <option value="1">고객면담보고서</option>
    <option value="2">건강상태보고서</option>
    <option value="3">서비스취소보고서</option>
    <option value="4">장기부재신청보고서</option>
    <option value="5">악성대상자신고보고서</option>
    </select>
    </td>
  </tr>
</tbody>
</table>


<!--고객면담  -->
<div class="flex" id="report-form-1" class="reportFormlist">
  <div class="col-md-12">
      <div class="card-header">
        <h3 class="card-title report_title">고객면담보고서</h3>

      </div>
      <div class="card-body" style="display: none;" >
        <div class="form-group">
          <form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
       	   <input type="hidden" name="content"/>
        <div class="report-content">
            <table>
                <tr>
                    <th style="text-align: center;">특이사항</th>
                     
                   <td>
               <textarea class="form-control" name="content" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요."></textarea>
				</td>
                </tr>
                <tr>
                    <th style="text-align: center;">전화유무</th>
                    <td> 
                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="reType" value="2">
					<input type="hidden" name="wCode" value="${wCode}">
					<input type="hidden" name="reDone" value="1">
					<input type="hidden" name="viewCheck" value="0">
                    <input type="radio" name="callCheck" value="Y">전화함                    
                    <input type="radio" name="callCheck" value="N">전화안함    
                    <input type="hidden" name="occurType" value="null"> 
                    <input type="hidden" name="occurTime" value="23/01/01"> 
                    </td>
                </tr>
            </table>
            <!-- 추가적인 테이블 내용을 추가할 수 있습니다. -->
        </div>
        </form>
    </div>
</div>


</div>
</div>
<!--장비점검 보고서 끝  -->


<!--건강상태  -->
<div class="flex" id="report-form-2" class="reportFormlist">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">건강상태보고서</h3>

</div>
<div class="card-body" style="display: none;" >
<div class="form-group">
<div class="report">
        <div class="report-content">
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="reType" value="3">
<input type="hidden" name="callCheck" value="">     
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23/01/01">                
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 290.333333px">
</colgroup>
<tbody>
  <tr>
    <th class="">확인내용</th>
    <td class="">
    <textarea class="summernote" id="summernote" name="content" rows="3"></textarea>
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
</div>

<!--건강상태 보고서 끝  -->

<!--서비스취소  -->
<div class="flex" id="report-form-3" class="reportFormlist">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">서비스취소보고서</h3>
</div>
<div class="card-body" style="display: none;" >
<div class="form-group">
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="reType" value="4">
<input type="hidden" name="callCheck" value="">                    
<input type="hidden" name="content" value=""> 
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23/01/01"> 
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 287.333333px">
</colgroup>
<thead>
  <tr>
    <th class="">파일첨부</th>
    <td class="">
    <input type="file" name="filename"/>
    </td>
  </tr>
</thead>
</table>
</form>
</div>
</div>
</div>
</div>


<!--서비스취소 보고서 끝  -->

<!--장기부재  -->
<div class="flex" id="report-form-4" class="reportFormlist">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">장기부재 신청서</h3>
</div>
<div class="card-body"  style="display: none;">
<div class="form-group">
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="callCheck" value="">                    
<input type="hidden" name="reType" value="5">
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23/01/01"> 
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 140.333333px">
<col style="width: 135.333333px">
<col style="width: 188.333333px">
<col style="width: 149.333333px">
</colgroup>
<thead>
  <tr>
 <th>장기부재 사유</th>
<td colspan="3">
  <input type="radio" name="content" value="여행"/>여행&nbsp;&nbsp;
  <input type="radio" name="content" value="입원"/>입원&nbsp;&nbsp;
  <input type="radio" id="gita"value="기타" onclick="showTextarea()"/>기타
  <input type="text" name="content" id="detailsInput" style="display: none;" placeholder="기타 사유를 입력하세요..." />
</td>
</thead>
<tbody>
</tbody>
</table>
</form>
</div>
</div>
</div>
</div>
<!--장기부재신청서보고서 끝  -->

<!--악성대상자 신고 보고서  -->
<div class="flex" id="report-form-5" class="reportFormlist">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">악성대상자 신고보고서</h3>

</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="nonmemberreportregist" name="form" method="post" role="form" id="registForm"  enctype="multipart/form-data">
<input type="hidden" name="id" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="N">
<input type="hidden" name="reType" value="6">
<input type="hidden" name="callCheck" value="">
<input type="hidden" name="occurType" value="null"> 
                     
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 190px;">
<col style="width: 377.333333px">
</colgroup>
<thead>
  <tr>
    <th>발생일자</th>
    <td>
    <input type="date" name="occurTime" style="width:100%;text-align:center;"/>
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>사건내용</th>
    <td>
      <textarea name="content" rows="3"></textarea>
    </td>
  </tr>
    <tr>
    <th>파일첨부</th>
    <td >
<input type="file" name="uploadFile">
    </td>
  </tr>
</tbody>
</table>
</form>
</div>
</div>
</div>
</div>
<!--악성대상자 신고보고서 끝  -->



<!--모달창에서 이름검색시 해당 아이디를 각 보고서의 hidden id의 value로 심어주는 스크립트  -->




<!--모달창 스크립ㅌ  -->
<script>
  const btn = document.getElementById('popupBtn');
  const modal = document.getElementById('modalWrap');
  const closeBtn = document.getElementById('closeBtn');
  const searchinput = document.getElementById('searchinput');

  btn.onclick = function() {
    modal.style.display = 'block';
  }

  closeBtn.onclick = function() {
    modal.style.display = 'none';
  }

  window.onclick = function(event) {
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  }

  function modalopen() {
    modal.style.display = 'block';
  }

  modal.style.display = 'none';

  $(document).on('click', '.modal_content', function() {
    const modalname = $(this).text().trim();
    searchinput.value = modalname;
    modal.style.display = 'none';
  });
  </script>
  
  <!-- 모달창에 입력한 id를 각폼의 input에 넣어주는 스크립트 -->
 <script>
$('.modal_content#modalname').click(function() {
	  var memberId = $(this).closest('tr').find('.member-id').val();
	  $('input[name="id"]').val(memberId);
	});

	/*보고서가 펼쳐진 대상만 submit되도록 해주는 스크립트포함  */

</script>


<script>
function regist_go() {

	  var forms = $('.flex'); // Get all elements with the class "flex"

	  forms.each(function() {
	    var form = $(this);
	    if (form.css('display') !== 'none') {
	      form.find('form').submit();
	    }
	  });
	}
</script>

<script>
function showTextarea() {
  var detailsInput = $('#detailsInput');
  var gita = $('#gita');

  if (gita.is(':checked')) {
    detailsInput.show();
  } else {
    detailsInput.hide();
  }
}
</script>

<!-- <script>
	let ArticleWrite__submitDone = false;
	function ArticleWrite__submit(form) {		
		const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		
		if ( markdown.length == 0 ) {
			alert('내용을 입력해주세요.');
			editor.focus();
			return;
		}
		
		form.content.value = markdown;
		
		ArticleWrite__submitDone = true;
		form.submit();		
	}
</script> -->

<script>
window.onload=function(){
		summernote_go($('#content'),'<%=request.getContextPath()%>');
	}
</script>

<Script>
$(document).ready(function() {
	  var cardHeader = $('.card-header');
	  cardHeader.hide();
	})
	
	</script>
<Script>
function toggleReportForms() {
    var selectedOption = $('select[name="reType"]').val();
    $('.flex .card-body').hide(); // Hide all report forms
    $('#report-form-' + selectedOption + ' .card-body').show(); // Show the selected report form
  }

</Script>



<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>