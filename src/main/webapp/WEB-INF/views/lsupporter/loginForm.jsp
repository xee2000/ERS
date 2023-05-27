<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/lsupporter/loginForm.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <title>Life Supporter</title>
  <style>
    body.login-page {
      background-image: url('/resources/lsupporter/img/생활지원사배경.jpg');
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
        <img style="width: 200px; height: 200px;" src="/resources/lsupporter/img/사회복지사.jpg">
        <p class="login-box-msg">로그인해주시기 바랍니다.</p>
        <form action="login" method="post" onsubmit="return logincheck()">
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
      </div>
    </div>
  </div>
</body>
</html>

<script>
function logincheck(){
	  var loginwid = $('input[name="wid"]').val();
	  var loginpwd = $('input[name="pwd"]').val();
	  
	
	if(loginwid == ""){
		   Swal.fire({
	            icon: 'error',                       
	            title: '아이디 미입력.',        
	            text: '아이디를 입력해주세요.', 
	        });
		return false;
	}
	if(loginpwd == ""){
		 Swal.fire({
	            icon: 'error',                         // Alert 타입
	            title: '비밀번호 미입력.',         // Alert 제목
	            text: '비밀번호를 입력해주세요.',  // Alert 내용
	        });
		return false;
	}

	
}
</script>