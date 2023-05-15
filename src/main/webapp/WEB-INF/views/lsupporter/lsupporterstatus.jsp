<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/lsupporterstatus.css">


<div class="row">
<div class="col-12 flex justify-between mb-1">
<button type="button" class="btn btn-dark btn-md">뒤로가기</button>
<button type="button" class="btn btn-success btn-md">수정</button>
</div>
</div>
<div class="container-fluid">
<div class="row">
<div class="col-md-3">

<div class="card card-primary card-outline">
<div class="card-body box-profile">
<div class="text-center">
<img class="profile-user-img img-fluid img-circle" src="/resources/lsupporter/img/노인1.jpg" style="width:300px;height:300px;" alt="">
</div>
</div>

</div>

</div>



<div class="col-md-9">
<div class="card">
<div class="card-header p-2">
<ul class="nav nav-pills justify-around">
<li class="nav-item"><a class="tab_name" href="#activity" data-toggle="tab">정보조회</a></li>
</ul>
</div>
<div class="card-body">
<div class="tab-content">
<div class="tab-pane active" id="activity">

<form class="form-horizontal">

<table class="type03">
 <tr>
    <th scope="row">이름</th>
    <td>${lsupporter.name }</td>
  </tr>
  <tr>
    <th scope="row">생년월일</th>
    <td>${lsupporter.birth }</td>
  </tr>
  <tr>
    <th scope="row">주소</th>
    <td>${lsupporter.address }</td>
  </tr>
  <tr>
    <th scope="row">이메일</th>
    <td>${lsupporter.email }</td>
  </tr> 
  <tr>
    <th scope="row">아이디</th>
    <td>${lsupporter.wid }</td>
  </tr>
  <tr>
    <th scope="row">비밀번호</th>
    <td>${lsupporter.pwd }</td>
  </tr>
</table>
</form>



</div>

<!--세번째 탭  -->


<!--  -->



		</div>
</div>

</div>
</div>

</div>

</div>
<div style="height:400px;"></div>






<%@include file="../include/lsupporter/foot.jspf"%>
