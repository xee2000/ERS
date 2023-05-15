<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/nowcare.css">
<!-- Content Wrapper. Contains page content -->

		<!-- Main content -->
		<section class="content-header">
		<div class="row">
  <div class="col-md-12">
    <div class="consulting_status">
      <h5 class="nowactovity mb-4">당일 돌봄이력</h5>
      <div class="emergany_status_list">
        <div class="col-lg-3 col-3">
          <div class="small-box bg-info">
            <div class="inner">
              <h3 class="status_num" style="font-size: 3rem;">3</h3>
              <p class="status_name">당일상담<br>전체</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-3">
          <div class="small-box bg-info">
            <div class="inner">
              <h3 class="status_num" style="font-size: 3rem;">2</h3>
              <p class="status_name">미완료상담</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-3">
          <div class="small-box bg-info">
            <div class="inner">
              <h3 class="status_num" style="font-size: 3rem;">1</h3>
              <p class="status_name">상담완료</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-3">
          <div class="small-box bg-warning">
            <div class="inner">
              <h3 class="status_num" style="font-size: 3rem;">1</h3>
              <p class="status_name">미수신</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<div class="row">
		<div class="col-12">
		<div class="search_bar mb-8 flex">
  <select class="keywordoption" id="카테고리" name="category">
    <option value="전체" disabled selected>선택</option>
      <option value="대상자명">대상자명</option>
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
		
		
<div class="row">
<div class="col-12 search_bar_main">
<div class="mt-2 mb-2 button buttens flex justify-end">
<button type="button" 
class="btn btn-lg btn-dark regist backbtn" onclick="location.href='/usr/home/main'">뒤로가기</button>
<button type="button" 
class="btn btn-lg mr-1 btn-primary regist">등록</button>
<button type="button" 
class="btn btn-lg btn-danger delete">삭제</button>
</div>
</div>
</div>

<div class="row">
<div class="col-12 memberlistable">
<form action="#" method="get">
<table class="tg memberlistable table">
<colgroup>
<col style="width: 23px">
<col style="width: 23px">
<col style="width: 200px">
<col style="width: 60px">
<col style="width: 23px">
<col style="width: 60px">
<col style="width: 120px">
<col style="width: 50px">
</colgroup>
<thead>
  <tr>
    <th class="tg-nqa4"><input type="checkbox" id="selectAll">
      전체선택</th>
    <th class="tg-nqa4">번호</th>
    <th class="tg-nqa4">사진</th>
    <th class="tg-nqa4">대상자명</th>
    <th class="tg-nqa4">보고서명</th>
    <th class="tg-nqa4">상담완료여부</th>
    <th class="tg-nqa4">열람여부</th>
    <th class="tg-nqa4">수신여부</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-73oq"> <input type="checkbox" class="text-center check_box checkbox"/></td>
    <td class="tg-73oq"> 1</td>
    <td class="tg-73oq">
    <img src="/img/노인1.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">김보건</td>
    <td class="tg-73oq">고객면담</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
    <td class="tg-73oq">동작함</td>
  </tr>
   <tr>
    <td class="tg-73oq"> <input type="checkbox" class="text-center check_box checkbox"/></td>
    <td class="tg-73oq"> 2</td>
    <td class="tg-73oq">
    <img src="/img/노인2.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">박제성</td>
    <td class="tg-73oq">고객면담...</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
    <td class="tg-73oq">동작함</td>
  </tr>
    <tr>
    <td class="tg-73oq"> <input type="checkbox" class="text-center check_box check-box"/></td>
    <td class="tg-73oq"> 3</td>
    <td class="tg-73oq">
    <img src="/img/노인3.jpeg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">강성민</td>
    <td class="tg-73oq">고객면담</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">N</td>
    <td class="tg-73oq">N</td>
    <td class="tg-73oq" style="color:red;">동작안함</td>
  </tr>
  <tr>
    <td class="tg-73oq"> <input type="checkbox" class="text-center check_box"/></td>
    <td class="tg-73oq"> 4</td>
    <td class="tg-73oq">
    <img src="/img/노인4.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">이정호</td>
    <td class="tg-73oq">고객면담</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
    <td class="tg-73oq">동작함</td>
  </tr>
  <tr>
    <td class="tg-73oq"> <input type="checkbox" class="text-center check_box"/></td>
    <td class="tg-73oq"> 5</td>
    <td class="tg-73oq">
    <img src="/img/노인5.jpg" style="height:150px;width:200px;"/>
    </td>
    <td class="tg-73oq" onclick="location.href='/usr/home/emergancydetail'">서우남</td>
    <td class="tg-73oq">고객면담</td>
    <td class="tg-73oq" onclick="location.href='/usr/home/educationdetail'">Y</td>
    <td class="tg-73oq">Y</td>
    <td class="tg-73oq">동작함</td>
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

<script>
  // Get the "전체선택" checkbox element
  var selectAllCheckbox = document.getElementById("selectAll");

  // Get all other checkboxes in the table
  var checkboxes = document.getElementsByClassName("check_box");

  // Add an event listener to the "전체선택" checkbox
  selectAllCheckbox.addEventListener("change", function () {
    // Loop through all checkboxes and set their checked property to match the "전체선택" checkbox
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = selectAllCheckbox.checked;
    }
  });

  // Add event listeners to the other checkboxes to update the "전체선택" checkbox
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].addEventListener("change", function () {
      // Check if all other checkboxes are checked
      var allChecked = true;
      for (var j = 0; j < checkboxes.length; j++) {
        if (!checkboxes[j].checked) {
          allChecked = false;
          break;
        }
      }

      // Update the "전체선택" checkbox based on the state of the other checkboxes
      selectAllCheckbox.checked = allChecked;
    });
  }
</script>
<%@include file="../include/lsupporter/foot.jspf"%>





