<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/lsupporter/loginForm.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <title>Life Supporter</title>
  <style>
    body.login-page {
      background-image: url('/lsupporter/img/생활지원사배경.jpg');
      background-size: cover;
      background-position: center;
    }
    
    .login {
      margin: 0 auto;
      max-width: 400px;
      background-color: rgba(255, 255, 255, 0.8);
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      opacity: 0.8;
    }
    
    .card-header {
      text-align: center;
    }
    
    .login-box-msg {
      text-align: center;
    }
    
    form {
      margin-top: 20px;
    }
    
    .input-group {
      margin-bottom: 20px;
    }
    
    .login_search,
    .password_search {
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body class="login-page">
  <div class="login">
    <div class="card card-outline card-primary">
      <div class="card-header text-center">
        <a href="#" class="h1"><b class="idcheck" style="font-size:1.5rem;">생활지원사 로그인</b></a>
      </div>
      <div class="card-body">
        <img style="width: 200px; height: 200px;" src="/lsupporter/img/사회복지사.jpg">
        <p class="login-box-msg">로그인해주시기 바랍니다.</p>
        <form action="login" method="post" onsubmit="return logincheck()" id="loginForm">
          <div class="input-group mb-3">
            <input type="text" class="form-control" name="wid" style="" placeholder="아이디를 입력해주세요.">
            <div class="input-group-append">
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" name="pwd" placeholder="비밀번호 기본값은 생년월일입니다.">
            <div class="input-group-append">
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <button type="submit" class="idsearch btn btn-primary btn-block">로그인</button>
            </div>
          </div>
        </form>
        <p class="mt-3 mb-1 login_search">
          <a href="idcheckForm">아이디 찾기</a>
        </p>
        <p class="mt-3 mb-1 password_search">
          <a href="pwcheckForm">비밀번호 찾기</a>
        </p>
     <img src="/resources/lsupporter/img/카카오로그인.png" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=023dae8ae9490c0d726e13ac1ad7a764&redirect_uri=http://localhost/lsupporter/kakaologin&response_type=code'"/>
</div>

    </div>
  </div>
 
</body>

 <script>
function logincheck() {
    var loginwid = $('input[name="wid"]').val();
    var loginpwd = $('input[name="pwd"]').val();

    if (loginwid.trim() === "") {
        Swal.fire({
            icon: 'error',
            title: 'ID not entered.',
            text: 'Please enter your ID.',
        });
        return false;
    }

    if (loginpwd.trim() === "") {
        Swal.fire({
            icon: 'error',
            title: 'Password not entered.',
            text: 'Please enter your password.',
        });
        return false;
    }
    document.getElementById('loginForm').submit();
   
    return true;
    
}
</script>

<script>
window.onload=function(){
	 if (${param.error} === 1) {
    	 Swal.fire({
             icon: 'error',
             title: 'ID 실패.',
             text: '아이디를 잘못 입력하셨습니다.',
         });
       $('input[name="wid"]').val('');
        return false;
    }

    if (${param.error} === 2) {
        Swal.fire({
            icon: 'error',
            title: 'PWD 실패.',
            text: '비밀번호를 잘못 입력하셨습니다..',
        });
        $('input[name="pwd"]').val('');
        return false;
    }
    return true;
	}
</script>


</html>