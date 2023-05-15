<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/lsupporter/css/idcheck.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%@include file="../include/lsupporter/idcheck.jspf"%>
<c:set var="message" value="${param.error}"/>
    <!-- Main content -->
    <div class="">
    <div class="content">
      <div class="container-fluid">
      <!-- Main content header -->
       <div class="row">
        	<div class="col-sm-12 p-0">
        		<div class="main-content-header">
        		</div>
        	</div>
        </div>
        <div class="row wrapper wrap-m-w m-auto">
        	<div class="col-sm-3">
        		<div class="row">
        			<div class="col-sm-12">
        				<div class="card-body">
        					<div class="card-body m-50-a-50-a ml-minus-40">
							<button type="button" class="btn btn-default btn-block text-left btn-original" onclick="location.href='loginForm'">LOGIN</button>
							<button type="button" class="btn btn-default btn-block text-left btn-original" onclick="location.href='idcheckForm''">ID찾기</button>
							<button type="button" class="btn btn-default btn-block text-left btn-original" onclick="location.href='pwcheckForm'">PASSWORD찾기</button>
						</div>
        				</div>
        			</div>
        		</div>
        	</div>
        	<div class="col-sm-9">
        		<div class="row">
        		<div class="col-sm-12">
				<div class="card-body">
					<div class="login-box m-50-a-50-a width-500">
					
					<div class="card">
					<div class="card-body login-card-body border-dccc-opacity">
								<p class="login-box-msg login-header-font">ID 찾기</p>
								<form id="FindMemberId" novalidate="novalidate">
									<!-- 이름 -->
									<div class="form-group">
									<label for="inputName">이름</label>
									<input type="text" name="name" class="form-control" id="inputName" placeholder="이름을 입력해주세요" maxlength="6" onchange="name_check()" data-name="성명">
									<span id="inputName-error" class="error invalid-feedback">이름을 입력해주세요!</span>
									</div>
									
									
									<!-- email -->
									<div class="form-group position-relative">
									<label for="inputEmail">이메일</label>
									<input type="email" name="email" class="form-control" id="inputEmail" placeholder="EMAIL을 입력해주세요 ex)abc123@naver.com" onchange="email_check()" data-name="이메일">
									<span id="inputEmail-error" class="error invalid-feedback">이메일 형식에 맞게 입력해주세요!</span>
									</div>
									
									<div class="text-right mt-5">
									<button type="button" class="btn bg-gradient-secondary" onclick="javascript:history.back();">뒤로가기</button>&nbsp;
									<button type="button" class="btn btn-dccc btn-original" onclick="idFind_go()">ID찾기</button>
									</div>
									</form>
							</div>
					
					</div>
					</div>
				</div>
        	</div>
        	</div>
        	</div>
        	
        </div>
        
    </div>
    
    
    </div>
    <!-- /.content -->
  
  
  <!-- /.content-wrapper -->
	<script>
	<c:if test="${message ne null && !empty message}">
		alert('${message}');
		location.href="idcheckForm";
	</c:if>
	
	function name_check(){
		var name = $('input[name="name"]');
		
		if(!name.val() || name.val()==''){
			alert("이름을 입력해주세요!");
			name.focus();
			name.addClass('is-invalid');
		}else{
			name.removeClass('is-invalid');
		}
	}
	function email_check(){
		var email = $('input[name="email"]');
		if(!email.val().match('@')){
			alert("이메일를 올바르게 입력해주세요!");
			email.focus();
			email.addClass('is-invalid');
		}else{
			email.removeClass('is-invalid');
		}
	}
	
	function idFind_go(){
		var form = $('form#FindMemberId');
		
		var name = $('input[name="name"]');
		var email = $('input[name="email"]');
		
		if(!name.val()){
			alert("이름을 입력해주세요.");
			name.focus();
			return;
		}
		
		
		if(!email.val()){
			alert("이메일을 입력해주세요.");
			email.focus();
			return;
		}
		
		$.ajax({
			  url: 'idcheck',
			  method: 'post',
			  data: form.serialize(),
			  success: function(data) {
			    Swal.fire({
			      icon: 'success',
			      title: '아이디찾기',
			      text: '사용자의 이메일로 아이디를 발송하였습니다.',
			    }).then(function() {
			      location.href = data;
			    });
			  },
			  error: function(error) {
			    Swal.fire({
			      icon: 'error',
			      title: '아이디찾기',
			      text: '사용자의 이메일로 아이디 발송이 실패하였습니다.',
			    });
			  }
			});

	}
	</script>
 
	</div>
	<!-- main-content -->
  