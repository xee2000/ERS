<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/passwordok.css">

<div class="main" style="height:1000px;">
<h3 class="title">나의 정보 수정</h3>
<form class="pawordcheck" action="#" method="get">
<span class="password border-solid">비밀번호 확인 :</span> <input type="password" name="memberpw"/>
</form>
<div class="row">
<div class="col-12">
<button type="submit" class="pwok btn btn-primary btn-block mb-3">확인</button>
</div>
</div>
</div>

<%@include file="../include/lsupporter/foot.jspf"%>