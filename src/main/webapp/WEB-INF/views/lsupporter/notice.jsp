<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/notice.css">


		<!-- Main content -->
		<section class="content-header" style="height:1100px;">
<div class="row">
<div class="col-12">
<h3 class="carelist_title">공지사항</h3>
</div>
</div>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">
  <div class="search_bar flex mb-5">
  <select class="keywordoption"id="카테고리" name="category">
    <option value="전체">전체</option>
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
  
  
		</div>
		

<div class="row">
<div class="col-12 memberlistable">

<table class="tg notice_table" style="undefined;table-layout: fixed; width: 498px">
<colgroup>
<col style="width: 100.333333px">
<col style="width: 250.333333px">
<col style="width: 200px">
<col style="width: 150.666666px">
</colgroup>
<thead>
  <tr>
    <th class="tg-c3ow">번호</th>
    <th class="tg-c3ow">제목</th>
    <th class="tg-c3ow">등록일자</th>
    <th class="tg-c3ow">첨부파일</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0pky">1</td>
    <td class="tg-0pkk" onclick="location.href='/usr/home/noticedetail'">중요공지</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">2</td>
    <td class="tg-0pkk">악성대상자 조건 변경</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">3</td>
    <td class="tg-0pkk">악성대상자 추가건에 대한....</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">4</td>
    <td class="tg-0pkk">서비스 취소명단 확인바랍니다.</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">5</td>
    <td class="tg-0pkk">기기 설치법 변경에 대한 추가공지</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">6</td>
    <td class="tg-0pkk">서비스 장애</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">7</td>
    <td class="tg-0pkk">시스템 재점검</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">8</td>
    <td class="tg-0pkk">직원을 칭찬합니다.</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">9</td>
    <td class="tg-0pkk">우수사원 공지</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky">10</td>
    <td class="tg-0pkk">생활지원사 추가 지역 공지</td>
    <td class="tg-0pky">2020-01-01</td>
    <td class="tg-0pky">
    </td>
  </tr>
</tbody>
</table>
</div>
</div>


		</div>
</div>


</section>
<!--foot -->


<%@include file="../include/lsupporter/foot.jspf"%>





