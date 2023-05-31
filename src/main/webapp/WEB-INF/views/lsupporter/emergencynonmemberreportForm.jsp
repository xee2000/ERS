
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/lsupporter/head.jspf"%>
<%--  <%@include file="../include/lsupporter/toastUiEditorLib.jspf" %> --%>
<link rel="stylesheet" href="/resources/lsupporter/css/nonmemberreportForm.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
<button type="submit" class="btn btn-primary btn-md"  onclick="regist_go();">제출</button>
</div>
</div>

<table class="tg mb-3" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 249.333333px">
<col style="width: 252.333333px">
</colgroup>
<thead>

</thead>
<tbody>
  <tr>
  <th>대상자</th>
 <td>
  <div class="search_container flex items-center">
    <input onclick="OpenWindow('LsupportermembersearchList','대상자조회',800,800);" style="text-align:center;position:relative;" value="" class="searchinput searchinput_name w-full" type="text" id="searchinput" name="name" required>
    <input type="hidden" name="id" id="memberIdInput" value="">
    <input type="hidden" name="sCode" id="memberSCodeInput" value="">
    <i class="fa fa-search" style="padding-left:46%;position: absolute;" id="popupBtn" onclick="OpenWindow('LsupportermembersearchList','대상자조회',800,800);"></i>
  </div>
</td>
</tr>
  <tr>
    <th class="tg-2xpi">보고서 구분</th>
    <td class="tg-2xpi">
    <select name="reType" style="text-align:center;" class="reportmenu" onchange="toggleReportForms()" id="formGubunValue">
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
<div class="flex reportFormlist" id="report-form-1">
  <div class="col-md-12">
      <div class="card-header">
        <h3 class="card-title report_title">고객면담보고서</h3>

      </div>
      <div class="card-body" style="display: none;" >
        <div class="form-group">
          <form action="emergencynonmemberreportregist" name="form" method="post" role="form" id="sendForm1">
        <div class="report-content">
            <table>
                <tr>
                    <th style="text-align: center;">특이사항</th>
                     
                   <td>
               <textarea style="font-size:2rem;" class="form-control" name="content" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요."></textarea>
				</td>
                </tr>
                
                <tr>
                    <th style="text-align: center;">면담등록일</th>
                     
                   <td>
               <input type='date' name="occurTime">
				</td>
                </tr>
                <tr>
                    <th style="text-align: center;">전화유무</th>
                    <td> 
                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="sCode" value="">
                    <input type="hidden" name="reType" value="2">
					<input type="hidden" name="wCode" value="${wCode}">
					<input type="hidden" name="reDone" value="1">
					<input type="hidden" name="viewCheck" value="0">
                    <input type="radio" name="callCheck" value="Y">전화함                    
                    <input type="radio" name="callCheck" value="N">전화안함    
                    <input type="hidden" name="occurType" value="null"> 

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
<div class="flex reportFormlist" id="report-form-2">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">건강상태보고서</h3>

</div>
<div class="card-body" style="display: none;" >
<div class="form-group">
<div class="report">
        <div class="report-content">
<form action="emergencynonmemberreportregist" name="form" method="post" role="form" id="sendForm2">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="id" value="">
<input type="hidden" name="sCode" value="">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="reType" value="3">
<input type="hidden" name="callCheck" value="">
<input type="hidden" name="occurType" value="null"> 
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 290.333333px">
</colgroup>
<tbody>
  <tr>
    <th class="">확인내용</th>
    <td class="">
    <textarea class="summernote" id="content" name="content" rows="3"></textarea>
    </td>
  </tr>
  <tr>
            <th style="text-align: center;">상담 등록날짜</th>
             
           <td>
       <input type='date' name="occurTime">
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
<div class="flex reportFormlist" id="report-form-3">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">서비스취소보고서</h3>
</div>
<div class="card-body" style="display: none;" >
<div class="form-group">
	<form action="emergencynonmemberreportregist" name="form" method="post" role="form" id="sendForm3" enctype="multipart/form-data">
	<input type="hidden" name="wCode" value="${wCode}">
	<input type="hidden" name="id" value="">
    <input type="hidden" name="sCode" value="">
	<input type="hidden" name="reDone" value="1">
	<input type="hidden" name="viewCheck" value="0">
	<input type="hidden" name="reType" value="4">
	<input type="hidden" name="callCheck" value="" required>
	<input type="hidden" name="content" value="서비스취소"> 
	<input type="hidden" name="occurType" value="null"> 
	<table style="undefined;table-layout: fixed; width: 100%;">
	<colgroup>
	<col style="width: 150px;">
	<col style="width: 287.333333px">
	</colgroup>
	<thead>
	  <tr>
	    <th class="">파일첨부</th>
	    <td class="">
	    <input type='file' name="uploadFile">
	    </td>
	  </tr>
	  <tr>
	    <th class="">서비스취소날짜</th>
	    <td class="">
	    <input type='date' name="occurTime">
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
<div class="flex reportFormlist" id="report-form-4">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">장기부재 신청서</h3>
</div>
<div class="card-body"  style="display: none;">
<div class="form-group">
<form action="emergencynonmemberreportregist" name="form" method="post" role="form" id="sendForm4">
<input type="hidden" name="id" value="">
<input type="hidden" name="sCode" value="">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="callCheck" value="" required>
<input type="hidden" name="reType" value="5">
<input type="hidden" name="occurType" value="null"> 
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
  <input type="radio" name="content" value="여행"><label class="mr-2">여행</label>
  <input type="radio" name="content" value="입원"><label>입원</label>
  <input type="radio" name="content" id="gita"value="기타" onclick="showTextarea()"/><label>기타</label>
  <input type="text" name="content" id="detailsInput" style="display: none;" placeholder="기타 사유를 입력하세요..." />
</td>
<th>장기부재 신청일</th>
<td>
<input type="date" name="occurTime">
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
<div class="flex reportFormlist" id="report-form-5">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">악성대상자 신고보고서</h3>

</div>
<div class="card-body" style="display: none;">
<div class="form-group">
<form action="emergencynonmemberreportregist" name="form" method="post" role="form" id="sendForm5"  enctype="multipart/form-data">
<input type="hidden" name="wCode" value="${wCode}">
<input type="hidden" name="id" value="">
<input type="hidden" name="sCode" value="">
<input type="hidden" name="reDone" value="1">
<input type="hidden" name="viewCheck" value="0">
<input type="hidden" name="reType" value="6">
<input type="hidden" name="callCheck" value="" required>
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
    <input type="date" name="occurTime"  style="width:100%;text-align:center;"/>
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>사건내용</th>
    <td>
      <textarea name="content" id="content" rows="3"></textarea>
    </td>
  </tr>
    <tr>
    <th>파일첨부</th>
    <td >
<input type='file' name="uploadFile">
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


<script>
function regist_go() {
	  var gubunVal = $('#formGubunValue').val();
	  var form = $('form#sendForm' + gubunVal);
	  var textarea = form.find('textarea[name="content"]:visible');
	  var dateInput = form.find('input[type="date"][name="occurTime"]');
	  var selectedDate = dateInput.val();
	  var callCheck = form.find('input[type="radio"][name="callCheck"]:checked');
	  var memberId = $('#memberIdInput').val();
	  var memberSCode = $('#memberSCodeInput').val();
	  var missingFields = [];
	  // Perform existing validation checks
	  if (textarea.length > 0 && textarea.val().trim() === '') {
	    missingFields.push(textarea.attr('name'));
	  }

	  if (dateInput.is(':visible') && (selectedDate === null || selectedDate.trim() === '')) {
	    missingFields.push(dateInput.attr('name'));
	  }

	  if (!callCheck.length) {
	    missingFields.push(callCheck.attr('name'));
	  }

	  // Filter out hidden inputs from missingFields
	  missingFields = missingFields.filter(function(fieldName) {
	    return form.find('[name="' + fieldName + '"]').is(':visible');
	  });

	  if (missingFields.length > 0) {
	    // Show validation error message
	    Swal.fire({
	      title: '내용을 수정해주세요',
	      text: '보고서에 입력되지 않은 항목이 있습니다.\n확인해주세요.',
	      icon: 'warning',
	      confirmButtonText: '확인'
	    });
	  } else {
	    // Set the values in the form
	    form.find('input[name="id"]').val(memberId);
	    form.find('input[name="sCode"]').val(memberSCode);
	    Swal.fire({
	      title: '제출하시겠습니까?',
	      icon: 'question',
	      showCancelButton: true,
	      confirmButtonText: '확인',
	      cancelButtonText: '취소'
	    }).then((result) => {
	      if (result.isConfirmed) {
	        Swal.fire({
	          title: '정상 제출되었습니다.',
	          icon: 'success'
	        }).then(() => {
	          // Submit the form
	          form.submit();
	        });
	      }
	    });
	  }
	}

</script>

<script>
$(document).ready(function() {
	  // 보고서 구분 선택 시 보고서 열기 및 이전 보고서 내용 초기화
	  $('#formGubunValue').change(function() {
	    var selectedValue = $(this).val();
	    var selectedForm = $('#sendForm' + selectedValue);

	    // 이전에 작성한 보고서 내용 초기화
	    selectedForm.find('textarea[name="content"]').val('');
	    selectedForm.find('input[name="uploadFile"]').val('');
	    selectedForm.find('input[name="callCheck"]').prop('checked', false);
	    selectedForm.find('input[name="occurTime"]').val('');

	    // 초기화되지 않은 radio input 요소의 선택 해제
	    selectedForm.find('input[type="radio"][name="content"]:checked').prop('checked', false);

	    // 초기화되지 않은 text input 요소의 값 초기화 및 가려짐 설정
	    selectedForm.find('input[type="text"][name="content"]').val('').hide();

	    // 초기화되지 않은 date input 요소의 값 초기화
	    selectedForm.find('input[type="date"][name="occurTime"]').val('');

	    // 선택한 보고서 열기
	    $('.report-form').hide();
	    selectedForm.show();

	    // 기타 선택 시 펼쳐지는 input 요소 초기화 및 가려짐 설정
	    if (selectedValue === '2') { // 건강상태보고서 선택 시
	      var detailsInput = selectedForm.find('#detailsInput');
	      var otherRadio = selectedForm.find('input[type="radio"][name="content"][value="기타"]');

	      // radio 선택 변경 시 펼쳐지는 input 요소 가려짐 설정
	      selectedForm.find('input[type="radio"][name="content"]').change(function() {
	        if ($(this).val() === '기타') {
	          detailsInput.show();
	        } else {
	          detailsInput.hide();
	        }
	      });
	    }
	  });
	});

</script>

<script>
$(document).ready(function() {
	  $('form').submit(function() {
	    $(this).find('input[type="hidden"]').prop('required', false);
	    $(this).find('input[type="hidden"]:hidden').prop('required', true);
	  });
	});

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

$(document).ready(function() {
  $('input[type="radio"][name="content"]').on('change', function() {
    var gita = $('#gita');
    
    if (!gita.is(':checked')) {
      var detailsInput = $('#detailsInput');
      detailsInput.hide();
    }
  });
});
</script>



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

<script>
window.addEventListener('message', function(event) {
    var data = event.data;

    if (data.action === 'closeWindow') {
      var memberIdInput = document.getElementById('memberIdInput');
      var memberSCodeInput = document.getElementById('memberSCodeInput');

      memberIdInput.value = data.memberId;
      memberSCodeInput.value = data.memberSCode;

      // 부모 창에서 setMemberInfo() 함수 호출 등 원하는 동작 수행
      setMemberInfo(data.memberId, data.memberSCode);
    }
  });

// 자식 창에서 값을 전달하는 함수
function closeWindow(memberId, memberSCode) {
  var parentWindow = window.opener;
  var data = {
    action: 'closeWindow',
    memberId: memberId,
    memberSCode: memberSCode
  };

  // 부모 창으로 메시지 전송
  parentWindow.postMessage(data, '*');
}
</script>


<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>