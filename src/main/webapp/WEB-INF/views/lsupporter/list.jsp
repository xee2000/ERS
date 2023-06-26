<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/emergencylist.css">
<style>
  .tab_menu{position:relative;}
  .tab_menu .list{overflow:hidden;}
  .tab_menu .list li{float:left; margin-right:14px;}
  .tab_menu .list li.is_on .btn{font-weight:bold; color:green;}
  .tab_menu .list .btn{font-size:13px;}
  .tab_menu .cont_area{margin-top:10px;}
  .tab_menu .cont_area .cont{display:none; background:#555; color:#fff; text-align:center; width:250px; height:100px; line-height:100px;}
</style>

		<!-- Main content -->
		<section class="content-header">
		<div class="col-12">
<div class="tab_menu">
  <ul class="list">
    <li class="is_on">
      <a onclick="allmenu();" href="#all" class="btn">전체</a>
    </li>
    <li>
      <a onclick="caremenu();" href="#care" class="btn">돌봄</a>
    </li>
    <li>
      <a onclick="emergencymenu();" href="#emergency" class="btn">응급</a>
    </li>
  </ul>
  </div>
  
  <div class="cont_area">
    <div id="all" class="cont" style="display:block;">
<div class="row">
<%@include file="../lsupporter/reportlist.jsp"%>
</div>

    <div id="care" class="cont" style="display:none;">
<div class="row">
<%@include file="../lsupporter/carelist.jsp"%>
    </div>
    
    <div id="emergency" class="cont" style="display:none;">
      <div class="row">
<div class="row">
<%@include file="../lsupporter/emergencylist.jsp"%>
    </div>
  </div>
</div>
</div>
</div>
</div>




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
    html: selectedMembers.join(', ') + '번의 보고서를 정말로 삭제하시겠습니까?',
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
  const tabList = document.querySelectorAll('.tab_menu .list li');
  const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
  let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

  for(var i = 0; i < tabList.length; i++){
    tabList[i].querySelector('.btn').addEventListener('click', function(e){
      e.preventDefault();
      for(var j = 0; j < tabList.length; j++){
        // 나머지 버튼 클래스 제거
        tabList[j].classList.remove('is_on');

        // 나머지 컨텐츠 display:none 처리
        contents[j].style.display = 'none';
      }

      // 버튼 관련 이벤트
      this.parentNode.classList.add('is_on');

      // 버튼 클릭시 컨텐츠 전환
      activeCont = this.getAttribute('href');
      document.querySelector(activeCont).style.display = 'block';
    });
  }
</script>

<script>
function allmenu(){
	if($("#all").css("display") =="none"){
		$("#all").show();
		$("#care").hide();
		$("#emergency").hide();
	}
}

function caremenu(){
	if($("#care").css("display") =="none"){
		$("#care").show();
		$("#all").hide();
		$("#emergency").hide();
	}
}

function emergencymenu(){
	if($("#emergency").css("display") =="none"){
		$("#emergency").show();
		$("#all").hide();
		$("#care").hide();
	}
}
</script>


<%@include file="../include/lsupporter/foot.jspf"%>





