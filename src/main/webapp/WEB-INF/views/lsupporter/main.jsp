<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/main.css">

		<!-- Main content -->
		<section class="content-header" style="height:1200px">

		<div class="row">
  <div class="col-md-12">
    <div class="consulting_status">
      <h5 class="nowactovity mb-2">당일 상담자 활동 현황</h5>
      <div class="emergany_status_list">
        <div class="col-lg-3 col-3">
          <div class="small-box bg-primary">
           <div class="inner">
      <h3>${futureDate+clearDate+notmachine }명</h3>
      <p>상담전체</p>
    </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="nowcare" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-3">
          <div class="small-box bg-primary">
            <div class="inner">
              <h3>${futureDate }명</h3>
              <p>상담예정자</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="nowcare" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-3">
          <div class="small-box bg-primary">
            <div class="inner">
              <h3>${clearDate }명</h3>
              <p>상담완료</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="nowcare" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-3">
          <div class="small-box bg-warning">
            <div class="inner">
              <h3>${notmachine }명</h3>
              <p>미수신</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="nowcare" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<div class="row mb-4">
  <div class="col-md-12">
    <div class="consulting_status">
      <h5 class="nowemergancy mb-2">응급발생 현황</h5>
      <div class="emergany_status_list">
        <div class="col-lg-3 col-3">
          <div class="small-box bg-danger">
            <div class="inner">
              <h3>${emergancyall }명</h3>
              <p>응급발생자</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-3">
          <div class="small-box bg-danger">
            <div class="inner">
              <h3>${emergancyno }명</h3>
              <p>미처리</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="container-fluid">
		<div class="row mx-auto">
		
		</div>
		<div class="col-12 menu_bar">
		<div class="menu_list">
				<div class="item">
						<ul class="menu_bar flex">
						<li class="col-3">
  <div class="card card-outline">
    <div class="card-body box-profile">
      <div class="text-center">
        <img class="profile-user-img img-fluid rounded-circle" onclick="location.href='/ers/lsupporter/carelist'" src="/resources/lsupporter/img/돌봄업무.jpg" style="width: 200px; height: 200px;" alt="" onmouseover="this.style.border='2px solid red';" onmouseout="this.style.border='none';">
      </div>
      <h3 class="profile-username text-center" onclick="location.href='/ers/lsupporter/carelist'" style="cursor: pointer;">돌봄업무</h3>
    </div>
  </div>
</li>

<li class="col-3">
  <div class="card card-outline">
    <div class="card-body box-profile">
      <div class="text-center">
        <img class="profile-user-img img-fluid rounded-circle" onclick="location.href='/ers/lsupporter/emergancylist'" src="/resources/lsupporter/img/응급.png" style="width: 200px; height: 200px;" alt="" onmouseover="this.style.border='2px solid red';" onmouseout="this.style.border='none';">
      </div>
      <h3 class="profile-username text-center" onclick="location.href='/ers/lsupporter/emergancylist'" style="cursor: pointer;">응급발생내역</h3>
    </div>
  </div>
</li>
</ul>
</div>
</div>
</div>

<div class="row">
<div class="col-12">
<ul class="menu_bar flex">
<li class="col-3">
  <div class="card card-outline">
    <div class="card-body box-profile">
      <div class="text-center">
        <img class="profile-user-img img-fluid rounded-circle" onclick="location.href='/ers/lsupporter/calmain'" src="/resources/lsupporter/img/캘린더.jpg" style="width: 200px; height: 200px;" alt="" onmouseover="this.style.border='2px solid red';" onmouseout="this.style.border='none';">
      </div>
      <h3 class="profile-username text-center" onclick="location.href='/ers/lsupporter/calmain'" style="cursor: pointer;">일정관리</h3>
    </div>
  </div>
</li>

<li class="col-3">
  <div class="card card-outline">
    <div class="card-body box-profile">
      <div class="text-center">
        <img class="profile-user-img img-fluid rounded-circle" onclick="location.href='/ers/lsupporter/reportlist'" src="/resources/lsupporter/img/보고서.jpg" style="width: 200px; height: 200px;" alt="" onmouseover="this.style.border='2px solid red';" onmouseout="this.style.border='none';">
      </div>
      <h3 class="profile-username text-center" onclick="location.href='/ers/lsupporter/reportlist'" style="cursor: pointer;">보고서</h3>
    </div>
  </div>
</li>
</ul>
</div>
</div>


</section>
<!--foot -->

<script>

</script>

<%@include file="../include/lsupporter/foot.jspf"%>





