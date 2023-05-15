<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 테일윈드 불러오기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css"/>	
	<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
	<!--데이지 UI  -->
	<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

	<!-- 폰트어썸 불러오기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	
<!--어드민   -->
	<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">



<div class="callist">
<div class="row">
<div class="col-12">
<h3 class="caltitle mt-2">대상자 이름조회</h3>
</div>
</div>


<table class="tg table table_list" style="undefined;table-layout: fixed; width: 333px">
<colgroup>
<col style="width: 150.333333px">
<col style="width: 182.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-l8qj">대상자명</th>
    <th class="tg-l8qj">
    <div class="search_container flex items-center">
  <input class="searchinput w-full" type="text" id="검색어" name="q" required>
  <button type="submit" class="absolute right-0 top-0 bottom-0 p-2 right-1.25">
    <i class="fa fa-search"></i>
  </button>
</div>
    </th>
  </tr>
</thead>
<tbody>

</tbody>
</table>

<div class="row">
<div class="col-12">

<table class="tg searchlist" style="undefined;table-layout: fixed; width: 285px">
<colgroup>
<col style="width: 78.333333px">
<col style="width: 92.333333px">
<col style="width: 53.333333px">
<col style="width: 61.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-uqo3">이미지</th>
    <th class="tg-2xpi">대상자명</th>
    <th class="tg-2xpi">성별</th>
    <th class="tg-uqo3">나이</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-i81m">
     <img src="/img/노인이미지.jpg" style="height:50px;width:80px;"/>
    </td>
    <td class="tg-3xi5">홍길동</td>
    <td class="tg-3xi5">남</td>
    <td class="tg-i81m">65</td>
  </tr>
  <tr>
    <td class="tg-i81m">
     <img src="/img/노인이미지.jpg" style="height:50px;width:80px;"/>
    </td>
    <td class="tg-3xi5">김춘자</td>
    <td class="tg-3xi5">여</td>
    <td class="tg-i81m">70</td>
  </tr>
   <tr>
    <td class="tg-i81m">
     <img src="/img/노인이미지.jpg" style="height:50px;width:80px;"/>
    </td>
    <td class="tg-3xi5">이우명</td>
    <td class="tg-3xi5">남</td>
    <td class="tg-i81m">70</td>
  </tr>
</tbody>
</table>

</div>

</div>

</div>