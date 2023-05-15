<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/lsupporter/idcheck.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
							<button type="button" class="btn btn-default btn-block text-left btn-original" onclick="location.href='findMemberIdForm'">ID찾기</button>
							<button type="button" class="btn btn-default btn-block text-left btn-original btn-dccc" onclick="location.href='findMemberPwForm'">PASSWORD찾기</button>
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
								<p class="login-box-msg login-header-font">PASSWORD 찾기</p>
<form id="FindMemberPw" novalidate="novalidate">
	<!-- id -->
<div class="form-group position-relative">
<label for="inputID">아이디</label><span class="position-absolute r-0 d-none c-dccc" id="widCheck_OK">사용가능</span><span class="position-absolute r-0 d-none c-red" id="widCheck_NO">사용불가</span>
<input type="text" name="wid" class="form-control form-in" id="inputID" placeholder="ID를 입력 해 주세요" maxlength="20" onchange="wid_check()" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" data-name="ID">
<span id="inputID-error" class="error invalid-feedback">아이디입력을 확인해주세요!</span>
</div>

<!-- 이름 -->
<div class="form-group">
<label for="inputName">이름</label>
<input type="text" name="name" class="form-control" id="inputName" placeholder="이름을 입력해주세요" maxlength="6" onchange="name_check()" data-name="성명">
<span id="inputName-error" class="error invalid-feedback">이름을 입력해주세요!</span>
</div>

<!-- email -->
<div class="form-group">
<label for="inputEmail">이메일</label>
<input type="email" name="email" class="form-control" id="inputEmail" placeholder="이메일을 입력해주세요" onchange="email_check()" data-name="이메일">
<span id="inputEmail-error" class="error invalid-feedback">이메일을 입력해주세요!</span>
<button class="btn btn-primary btn-sm mt-1" onclick="secretcodesend()">인증코드 발송</button>
</div>

<div class="form-group secretcode" style="display:none;">
<label for="inputEmailcode">인증코드</label>
<input type="text" name="emailcode" class="form-control" id="inputEmailcode" placeholder="인증코드를 입력해주세요" onchange="emailcode_check()" data-name="이메일">
<span id="inputEmail-error" class="error invalid-feedback">인증코드를 입력해주세요!</span>
<button class="btn btn-primary btn-sm mt-1" onclick="">인증코드 확인</button>
</div>


<div class="text-right mt-5">
<button type="button" class="btn bg-gradient-secondary" onclick="javascript:history.back();">뒤로가기</button>&nbsp;
<button type="button" class="btn <btn-primary></btn-primary> btn-original" onclick="pwchange()">PW 찾기</button>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
  <c:if test="${message ne null && !empty message}">
    alert('${message}');
    location.href="findMemberPwForm.do";
  </c:if>

  function wid_check() {
    var wid = $('input[name="wid"]');

    if (!wid.val()) {
      alert("아이디를 입력해주세요.");
      wid.focus();
      wid.addClass('is-invalid');
    } else {
      wid.removeClass('is-invalid');
    }
  }

  function name_check() {
    var name = $('input[name="name"]');

    if (!name.val() || name.val() == '') {
      alert("이름을 입력해주세요!");
      name.focus();
      name.addClass('is-invalid');
    } else {
      name.removeClass('is-invalid');
    }
  }

  function email_check() {
    var email = $('input[name="email"]');
    if (!email.val().match('@')) {
      alert("이메일를 올바르게 입력해주세요!");
      email.focus();
      email.addClass('is-invalid');
    } else {
      email.removeClass('is-invalid');
    }
  }

  function emailcode_check() {
    var email = $('input[name="email"]');
    if (!email.val() || name.val() == '') {
      alert("이메일을 입력해주세요!");
      email.focus();
      email.addClass('is-invalid');
    } else {
      email.removeClass('is-invalid');
    }
  }

  function secretcode() {
    var email = $('input[name="email"]');
    if (!email.val() || email.val() == '') {
      alert("이메일을 입력해주세요!");
      email.focus();
      email.addClass('is-invalid');
    } else {
      alert("인증코드를 입력해주세요")
    }
  }

  function secretcodesend() {
    var wid = $('input[name="wid"]');
    var name = $('input[name="name"]');
    var email = $('input[name="email"]');
    var form = $('#FindMemberPw');

    if (!wid.val()) {
      alert("아이디를 입력해주세요.");
      wid.focus();
      return;
    }

    if (!name.val()) {
      alert("이름을 입력해주세요.");
      name.focus();
      return;
    }

    if (!email.val()) {
      alert("이메일을 입력해주세요.");
      email.focus();
      return;
    }

    $.ajax({
		  url: 'pwcheck',
		  method: 'post',
		  data: form.serialize(),
		  success: function(data) {
		    Swal.fire({
		      icon: 'success',
		      title: '인증코드발송',
		      text: '사용자의 이메일로 인증코드를 발송하였습니다.'
		  });
		    $('.secretcode').css('display','block');
		  },
		  error: function(error) {
		    Swal.fire({
		      icon: 'error',
		      title: '인증코드발송실패',
		      text: '사용자의 이메일로 아이디 발송이 실패하였습니다.',
		    });
		  }
		});

    return false; // Prevent form submission
  }
</script>


	</div>
	<!-- main-content -->
  