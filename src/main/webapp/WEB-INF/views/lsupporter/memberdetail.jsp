<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/memberdetail.css">


<div class="row">
<div class="col-12 flex justify-start mb-1">
<button type="button" class="btn btn-dark btn-lg">뒤로가기</button>
</div>
</div>
<div class="container-fluid">
<div class="row">
<div class="col-md-3">

<div class="card card-primary card-outline">
<div class="card-body box-profile">
<div class="text-center">
<img class="profile-user-img img-fluid img-circle" src="/img/노인1.jpg" style="width:200px;height:200px;" alt="">
</div>
<h3 class="profile-username text-center">김보건</h3>
</div>

</div>

<div class="card card-primary">
<div class="card-header">
<h3 class="card-title">기타 이력</h3>
</div>

<div class="card-body">
<div class="danger"><img class="danger_imgsize" src="/resources/lsupporter/img/사이렌.jpg"/> 
<span class="danger_status">응급발생정보</span></div><br/>
<div class="danger_list">
<span class="dangergo">총 응급출동건수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;→ 2건</span><br/>
<span class="dangergo">총 화재발생건수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;→ 2건</span>
</div>
<hr>
</div>
</div>
</div>



<div class="col-md-9">
<div class="card">
<div class="card-header p-2">
<ul class="nav nav-pills justify-around">
<li class="nav-item"><a class="tab_name" href="#activity" data-toggle="tab">대상자정보</a></li>
<li class="nav-item"><a class="tab_name" href="#familly" data-toggle="tab">가족정보</a></li>
<li class="nav-item"><a class="tab_name" href="#systemstatus" data-toggle="tab">서비스정보</a></li>
<li class="nav-item"><a class="tab_name" href="#carewordlist" data-toggle="tab">보고서</a></li>
</ul>
</div>
<div class="card-body">
<div class="tab-content">
<div class="tab-pane active" id="activity">

<form class="form-horizontal">

<table class="tg memberdetail" style="undefined;table-layout: fixed; width: 602px">
<colgroup>
<col style="width: 210.333333px">
<col style="width: 480.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-c6of">대상자명 </th>
    <th class="tg-3xi5">김보건</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c6of">나이</td>
    <td class="tg-3xi5">24</td>
  </tr>
  <tr>
    <td class="tg-c6of">전화번호</td>
    <td class="tg-3xi5">010-3238-7013</td>
  </tr>
  <tr>
    <td class="tg-c6of">고위험수준</td>
    <td class="tg-c6of">YES</td>
  </tr>
  <tr>
    <td class="tg-c6of">심장박동기 부착여부</td>
    <td class="tg-c6of">N</td>
  </tr>
    <tr>
    <td class="tg-c6of">대상자 구분</td>
    <td class="tg-c6of">노인</td>
  </tr>
  <tr>
    <td class="tg-c6of">거주지주소</td>
    <td class="tg-c6of">대전시 서구 용문동</td>
  </tr>
  <tr>
    <td class="tg-0lax">질병정보</td>
    <td class="tg-0lax">심혈관계 질환으로 장기간 투약상태</td>
  </tr>
  <tr>
    <td class="tg-0lax">복용약물내역</td>
    <td class="tg-0lax">당뇨약 2년째 복용중</td>
  </tr>
  <tr>
    <td class="tg-0lax">병원방문기록</td>
    <td class="tg-0lax">1년간 건양대 병원 주기적 방문상태</td>
  </tr>
  <tr>
    <td class="tg-0lax">심리상태</td>
    <td class="tg-0lax">아들과의 대면시 불안증세, 수전증 2년째 지속중</td>
  </tr>
  <tr>
    <td class="tg-0lax">가족과의 친분도</td>
    <td class="tg-0lax">가족과 대면을 힘겨워함 혼자있고 싶어함이 큰상태</td>
  </tr>
  <tr>
    <td class="tg-0lax">긴급연락망1<br/>(이름/관계/연락처)</td>
    <td class="tg-0lax">이정호/동료/010-3238-7013</td>
  </tr>
  <tr>
    <td class="tg-0lax">긴급연락망2<br/>(이름/관계/연락처)</td>
    <td class="tg-0lax">박제성/팀장/010-9898-9081</td>
  </tr>
  <tr>
    <td class="tg-0lax">긴급연락망3<br/>(이름/관계/연락처)</td>
    <td class="tg-0lax">최재혁/쩔친/010-2422-1517</td>
  </tr>
</tbody>
</table>
</form>



</div>

<!--세번째 탭  -->
<div class="tab-pane" id="familly">
<table class="tg familiy" style="undefined;table-layout: fixed; width: 605px">
<colgroup>
<col style="width: 180.333333px">
<col style="width: 400.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-c6of">가족구성원 정보</th>
    <th class="tg-3xi5">아들, 딸, 손자, 손녀</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c6of">보호자 이름</td>
    <td class="tg-3xi5">박제성</td>
  </tr>
  <tr>
    <td class="tg-c6of">보호자와의 관계</td>
    <td class="tg-c6of">동료</td>
  </tr>
  <tr>
    <td class="tg-c6of">보호자 연락처</td>
    <td class="tg-c6of">010-9898-9081</td>
  </tr>
</tbody>
</table>


</div>

<div class="tab-pane" id="systemstatus">
<div class="form-group row">
<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150.333333px">
<col style="width: 110.333333px">
<col style="width: 140.333333px">
<col style="width: 80.333333px">
<col style="width: 120.333333px">
<col style="width: 80.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-baqh">기기명</th>
    <th class="tg-baqh">모델명</th>
    <th class="tg-baqh">설치일자</th>
    <th class="tg-baqh">교체여부</th>
    <th class="tg-baqh">교체일자</th>
    <th class="tg-baqh">수신상태</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax">게이트웨이</td>
    <td class="tg-0lax">GY-1111</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">교체함</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">수신양호</td>
  </tr>
  <tr>
    <td class="tg-0lax">화재경보기</td>
    <td class="tg-0lax">FY-1111</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">교체함</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">수신양호</td>
  </tr>
  <tr>
    <td class="tg-0lax">활동감지기</td>
    <td class="tg-0lax">AY-1111</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">교체함</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">수신양호</td>
  </tr>
  <tr>
    <td class="tg-0lax">출입문감지기</td>
    <td class="tg-0lax">GY-1111</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">교체함</td>
    <td class="tg-0lax">2020-10-10</td>
    <td class="tg-0lax">수신양호</td>
  </tr>
</tbody>
</table>
</div>


</div>

<!--다섯번째 탭  -->
<div class="tab-pane" id="carewordlist">

<div class="row ">
		<div class="category_date_menubar">
		<div class="date flex">
		<input class="dateselectbar"type="date" name="startday">&nbsp;&nbsp;
		<input class="dateselectbar" type="date" name="endday">
		</div>
  <div class="search_bar mb-5 flex">
  <select class="keywordoption"id="카테고리" name="category">
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
  
  
		</div>
<div class="row">
		<div class="col-12">
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens">
<button type="button" 
class="btn mr-1 btn-primary regist" onclick="location.href='/usr/home/reportForm'">등록</button>
<button type="button" 
class="btn btn-danger delete">삭제</button>
</div>
</div>
</div>

<div class="row">
<div class="col-10">
<form action="#" method="get">
<table class="tg" style="undefined;table-layout: fixed; width: 492px">
<colgroup>
<col style="width: 120.333333px">
<col style="width: 55.333333px">
<col style="width: 140.333333px">
<col style="width: 80.333333px">
<col style="width: 170.333333px">
<col style="width: 120.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-baqh">
      <input type="checkbox" id="selectAll">
      전체선택
    </th>
    <th class="tg-baqh">번호</th>
    <th class="tg-baqh">상담일자</th>
    <th class="tg-baqh">상담자</th>
    <th class="tg-baqh">보고서 구분</th>
    <th class="tg-baqh">열람 여부</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax">
      <input type="checkbox" class="text-center check_box"/>
    </td>
    <td class="tg-0lax">1</td>
    <td class="tg-0lax">2020-01-01</td>
    <td class="tg-0lax">김형민</td>
    <td class="tg-0lax">고객상담...</td>
    <td class="tg-0lax">Y</td>
  </tr>
  <tr>
    <td class="tg-0lax">
      <input type="checkbox" class="text-center check_box"/>
    </td>
    <td class="tg-0lax">2</td>
    <td class="tg-0lax">2020-01-02</td>
    <td class="tg-0lax">박지성</td>
    <td class="tg-0lax">악성대상자신고</td>
    <td class="tg-0lax">N</td>
  </tr>
</tbody>

</table>
</form>
</div>
</div>


		</div>
</div>


		</div>
</div>

</div>
</div>

</div>

</div>

</div>

</div>


<script>
$(function() {
	  // 전체선택 체크박스를 클릭할 때
	  $("#selectAll").click(function() {
	    // 전체선택 체크박스가 체크되어 있는 경우
	    if ($(this).prop("checked")) {
	      // 모든 체크박스를 체크
	      $(".check_box").prop("checked", true);
	    } else {
	      // 모든 체크박스의 체크를 해제
	      $(".check_box").prop("checked", false);
	    }
	  });

	  // 개별 체크박스를 클릭할 때
	  $(".check_box").click(function() {
	    // 모든 체크박스가 체크되어 있는 경우
	    if ($(".check_box:checked").length == $(".check_box").length) {
	      // 전체선택 체크박스를 체크
	      $("#selectAll").prop("checked", true);
	    } else {
	      // 전체선택 체크박스의 체크를 해제
	      $("#selectAll").prop("checked", false);
	    }
	  });
	});


</script>



<%@include file="../include/lsupporter/foot.jspf"%>
