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
margin-left:61.5%;
}
.caltitle{
font-family: 'MBC1961GulimM';
text-align:center;
}
.table_list{
margin-left:4%;
margin:0 auto;
}
@font-face {
font-family: 'MBC1961GulimM';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2') format('woff2');
font-weight: normal;
font-style: normal;
}
.table thead th{
border-bottom:none;
}

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-size:1.3rem;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-size:1.5rem;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-l8qj{background-color:#7D72A6FF;font-size:1.5rem;font-family: 'MBC1961GulimM';text-align:center;vertical-align:middle;color:white}
.tg .tg-0lax{text-align:center;vertical-align:middle;background-color:white;}
</style>



<div class="callist">
<div class="row">
<div class="col-12">
<h3 class="caltitle mt-2">일정상세조회</h3>
<div class="row">
<div class="col-12 button_map mt-2 mb-1">
<button type="button" class="btn btn-danger btn-sm ">창닫기</button>
</div>
</div>
</div>
</div>


<table class="tg table table_list" style="undefined;table-layout: fixed; width: 333px">
<colgroup>
<col style="width: 170.333333px">
<col style="width: 182.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-l8qj">대상자명</th>
    <th class="tg-0lax">홍길동</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-l8qj">상담일자</td>
    <td class="tg-0lax">2020-06-03</td>
  </tr>
  <tr>
    <td class="tg-l8qj">다음 상담예정일</td>
    <td class="tg-0lax">미정</td>
  </tr>
  <tr>
    <td class="tg-l8qj">상담목적</td>
    <td class="tg-0lax">대상자요청</td>
  </tr>
  <tr>
    <td class="tg-l8qj">확인내용</td>
    <td class="tg-0lax">곧 추석이라....</td>
  </tr>
  <tr>
    <td class="tg-l8qj">담당 생활지원사 </td>
    <td class="tg-0lax">김보건</td>
  </tr>
</tbody>
</table>

</div>