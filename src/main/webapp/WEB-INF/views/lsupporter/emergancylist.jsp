<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/emergancylist.css">
<!-- Content Wrapper. Contains page content -->



		<!-- Main content -->
		<section class="content-header">
<h3 class="emergancylist_title">응급발생 내역</h3>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">
		<div class="date">
		<label class="date_select">날짜조회 :</label>
		<input type="date" name="startday" style="width:250px;border:1px solid black;">&nbsp;&nbsp;<span class="dash">-</span>
		&nbsp;&nbsp;<input type="date" name="endday" style="width:250px;border:1px solid black;">
		</div>
  <div class="search_bar search_bar_main flex mb-5">
 <div class="search_bar mb-2 flex">
  <select class="keywordoption"id="카테고리" name="category">
    <option value="전체" disabled selected>선택</option>
      <option value="대상자명" ${cri.perPageNum eq 10 ? 'selected' : '' }>대상자명</option>
      <option value="수신여부">성별</option>
      <option value="기타1">활동여부</option>
  </select>
<div class="search_container flex items-center">
  <input class="searchinput w-full" type="text" id="검색어" name="q" required>
  <button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
    <i class="fa fa-search"></i>
  </button>
</div>
  </div>
  </div>
  
  
		</div>
		
		
		
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens">
<button type="button" class="btn btn-dark btn-lg mt-2 mb-2 backbtn">뒤로가기</button>
<button type="button" 
class="btn btn-lg mr-1 ml-1 btn-primary regist " onclick="location.href='/usr/home/nonmemberreportForm'">등록</button>
</div>
</div>
</div>

<div class="row">
<div class="col-12 memberlistable">
<form action="#" method="get">
<table class="tg memberlistable table">
<colgroup>
<col style="width: 23px">
<col style="width: 200px">
<col style="width: 60px">
<col style="width: 60px">
<col style="width: 90px">
<col style="width: 30px">
<col style="width: 50px">
</colgroup>
<thead>
  <tr>
    <th class="tg-nqa4">번호</th>
    <th class="tg-nqa4">사진</th>
    <th class="tg-nqa4">대상자명</th>
    <th class="tg-nqa4">성별</th>
    <th class="tg-nqa4">응급발생시간</th>
    <th class="tg-nqa4">보고서 작성여부</th>
    <th class="tg-nqa4">열람여부</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-73oq">1</td>
    <td class="tg-73oq">
    <img src="/img/노인이미지.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">홍길동</td>
    <td class="tg-73oq">남</td>
    <td class="tg-73oq">5월5일<br/>14:10</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
  </tr>
   <tr>
    <td class="tg-73oq">1</td>
    <td class="tg-73oq">
    <img src="/img/노인이미지.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">홍길동</td>
    <td class="tg-73oq">남</td>
    <td class="tg-73oq">5월5일<br/>14:10</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
  </tr>
   <tr>
    <td class="tg-73oq">1</td>
    <td class="tg-73oq">
    <img src="/img/노인이미지.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">홍길동</td>
    <td class="tg-73oq">남</td>
    <td class="tg-73oq">5월5일<br/>14:10</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
  </tr>
   <tr>
    <td class="tg-73oq">1</td>
    <td class="tg-73oq">
    <img src="/img/노인이미지.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">홍길동</td>
    <td class="tg-73oq">남</td>
    <td class="tg-73oq">5월5일<br/>14:10</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
  </tr>
   <tr>
    <td class="tg-73oq">1</td>
    <td class="tg-73oq">
    <img src="/img/노인이미지.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">홍길동</td>
    <td class="tg-73oq">남</td>
    <td class="tg-73oq">5월5일<br/>14:10</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
  </tr>
  
</tbody>
</table>
</form>
</div>
</div>


		</div>
</div>


</section>
<!--foot -->


<%@include file="../include/lsupporter/foot.jspf"%>





