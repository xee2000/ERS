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
	
	<!-- 사이트 공통 CSS -->
	<link rel="stylesheet" href="/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="/bootstrap/dist/css/adminlte.min.css?v=3.2.0">
	<!-- 사이트 공통 JS -->
	<script src="/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script src="/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
	<script src="/bootstrap/dist/js/demo.js"></script>
	
<style>
.button_map{
margin-left:65%;
}
.caltitle{
font-family: 'MBC1961GulimM';
text-align:center;
}
.table_list{
margin-left:2%;
font-size:1.5rem;
}
@font-face {
font-family: 'MBC1961GulimM';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2') format('woff2');
font-weight: normal;
font-style: normal;
}
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:1.5rem;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-2unq{background-color:#7D72A6FF;font-size:22px;text-align:center;vertical-align:middle;color:white;font-family: 'MBC1961GulimM';}
.tg .tg-0lax{text-align:center;vertical-align:middle}
.table_list{
margin:0 auto;
}


</style>



<div class="callist">
<div class="row">
<div class="col-12 mt-3">
<h3 class="caltitle">일정내역</h3>

<div class="row">
<div class="col-12 button_map mb-1">
<button type="button" class="btn btn-danger btn-sm">창닫기</button>
</div>
</div>
</div>
</div>

<table class="tg table table_list" style="undefined;table-layout: fixed; width: 260px">
<colgroup>
<col style="width: 100.333333px">
<col style="width: 100.333333px">
<col style="width: 110.333333px">
<col style="width: 110.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-2unq">이미지</th>
    <th class="tg-2unq">대상자명</th>
    <th class="tg-2unq">상담목적</th>
    <th class="tg-2unq">상담여부</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax">
    <img src="/img/노인이미지.jpg" style="width:80px;height:80px;"/>
    </td>
    <td class="tg-0lax" onclick="location.href='/usr/home/caldetail'">홍길동</td>
    <td class="tg-0lax">정기상담</td>
    <td class="tg-0lax">상담완료</td>
  </tr>
</tbody>
</table>

</div>