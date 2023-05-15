<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/carelist.css">
<!-- Content Wrapper. Contains page content -->


		<!-- Main content -->
		<section class="content-header" style="height:2000px;">
<h3 class="carelist_title mb-5">돌봄업무 대상자 리스트</h3>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">
		
<div class="search_bar search_bar_main flex mb-3">
  <div class="search_bar mb-2 flex">
    <select class="keywordoption mr-2" id="카테고리" name="category">
      <option value="전체" disabled selected>선택</option>
      <option value="대상자명">대상자명</option>
      <option value="수신여부">성별</option>
      <option value="기타1">활동여부</option>
    </select>
    <div class="search_container flex items-center">
      <input class="searchinput w-full border border-gray-300 pl-4 pr-12 py-2" type="text" id="검색어" name="q" required>
      <button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
        <i class="fa fa-search"></i>
      </button>
    </div>
  </div>
</div>






  
 <div class="row flex text-start">
 <div class="col-12">
  <button type="button" class="btn btn-dark btn-lg backbtn mb-1" onclick="location.href='/usr/home/main'">뒤로가기</button>
 </div>
 </div>
  
  </div>
</div>

<div class="row">
<div class="col-12 memberlistable">
<form action="#" method="get">

<table class="tg memberlist" style="width:100%;">
<colgroup>
<col style="width: 70px">
<col style="width: 200px">
<col style="width: 150px">
<col style="width: 150px">
<col style="width: 80px">
<col style="width: 150px">
<col style="width: 200px">
</colgroup>
  <tr>
    <th class="tg-yj5y">번호</th>
    <th class="tg-yj5y">사진</th>
    <th class="tg-yj5y">대상자명</th>
    <th class="tg-yj5y">생년월일</th>
    <th class="tg-yj5y">성별</th>
    <th class="tg-yj5y">활동여부</th>
    <th class="tg-yj5y">남은정기상담일</th>
  </tr>
  <tr>
    <td class="tg-3xi5">
    1
    </td>
    <td class="tg-3xi5">
    <img src="/resources/lsupporter/img/노인1.jpg" style="heigth:100px;width:200px;">
    </td>
    <td class="tg-3xi5" onclick="location.href='/ers/lsupporter/memberdetail'">김보건</td>
    <td class="tg-3xi5">950822</td>
    <td class="tg-3xi5">여</td>
    <td class="tg-3xi5">동작</td>
    <td class="tg-3xi5">7일</td>
  </tr>
   <tr>
    <td class="tg-3xi5">
    1
    </td>
    <td class="tg-3xi5">
    <img src="/resources/lsupporter/img/노인1.jpg" style="heigth:100px;width:200px;">
    </td>
    <td class="tg-3xi5" onclick="location.href='/ers/lsupporter/memberdetail'">김보건</td>
    <td class="tg-3xi5">950822</td>
    <td class="tg-3xi5">여</td>
    <td class="tg-3xi5">동작</td>
    <td class="tg-3xi5">7일</td>
  </tr>
   <tr>
    <td class="tg-3xi5">
    1
    </td>
    <td class="tg-3xi5">
    <img src="/resources/lsupporter/img/노인1.jpg" style="heigth:100px;width:200px;">
    </td>
    <td class="tg-3xi5" onclick="location.href='/ers/lsupporter/memberdetail'">김보건</td>
    <td class="tg-3xi5">950822</td>
    <td class="tg-3xi5">여</td>
    <td class="tg-3xi5">동작</td>
    <td class="tg-3xi5">7일</td>
  </tr>
  
</table>
</form>
</div>
</div>

</div>



</section>
<!--foot -->


<%@include file="../include/lsupporter/foot.jspf"%>





