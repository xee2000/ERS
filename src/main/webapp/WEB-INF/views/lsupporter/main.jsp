<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>

		<!-- Main content -->
		<section class="content-header" style="height:1000px">
<div class="col-12">
<h3 class="loginname mb-4">${lsupporterstatus.name }생활지원사님 환영합니다.</h3>
</div>
		<div class="row" >
  <div class="col-md-12">
    <div class="consulting_status">
      <h5 class="nowactovity mb-5">당일 상담자 활동 현황</h5>
      <div class="emergany_status_list">
        <div class="col-lg-3 col-3">
          <div class="small-box bg-primary">
           <div class="inner" id="noweducationactive">
      <h3>${futureDate+notmachine }명</h3>
      <p class="info_text">상담전체</p>
    </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="carelist" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-3">
          <div class="small-box bg-primary">
            <div class="inner" id="noweducationfuture">
              <h3>${futureDate }명</h3>
              <p class="info_text">상담예정자(기기수신)</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="carelist" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
       
        <div class="col-lg-3 col-3">
          <div class="small-box bg-warning">
            <div class="inner" id="noweducationmiss">
              <h3>${notmachine }명</h3>
              <p class="info_text">미수신</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="carelist" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<div class="row mb-4">
  <div class="col-md-12">
    <div class="consulting_status">
      <h5 class="nowemergancy mb-5 mt-3">3일간의 응급발생 현황</h5>
      <div class="emergany_status_list">
        <div class="col-lg-3 col-3">
          <div class="small-box bg-danger">
            <div class="inner" id="emergencyaction" >
              <h3>${emergencyall }명</h3>
              <p class="info_text">응급발생자</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="emergencylist" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>

      <div class="col-lg-3 col-3">
          <div class="small-box bg-danger">
            <div class="inner" id="emergencymiss">
              <h3>${emergencymiss }명</h3>
              <p class="info_text">미처리</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="emergencylist" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        
        <div class="col-lg-3 col-3">
          <div class="small-box bg-danger">
            <div class="inner" id="emergencyclear">
              <h3>${emergencyclear }명</h3>
              <p class="info_text">처리완료</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="emergencylist" class="small-box-footer">자세히 보기 <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card card-outline">
  <div class="card-body box-profile">
      <div class="text-center">
        <img class="profile-user-img img-fluid rounded-circle" onclick="location.href='/ers/lsupporter/list'" src="/resources/lsupporter/img/보고서.jpg" style="width: 200px; height: 200px;" alt="" onmouseover="this.style.border='2px solid red';" onmouseout="this.style.border='none';">
      </div>
      <h3 class="profile-username text-center" onclick="location.href='/ers/lsupporter/list'" style="cursor: pointer;">보고서</h3>
    </div>
    
    <div class="card-body box-profile">
      <div class="text-center">
        <img class="profile-user-img img-fluid rounded-circle" onclick="location.href='/ers/lsupporter/calinder'" src="/resources/lsupporter/img/보고서.jpg" style="width: 200px; height: 200px;" alt="" onmouseover="this.style.border='2px solid red';" onmouseout="this.style.border='none';">
      </div>
      <h3 class="profile-username text-center" onclick="location.href='/ers/lsupporter/calinder'" style="cursor: pointer;">캘린더</h3>
    </div>
  </div>
   </div>

</section>
<!--foot -->

<script>

function autoRefresh_div()
{
var currentLocation = window.location;
$("#emergencyaction").load(currentLocation + ' #emergencyaction');
$("#emergencymiss").load(currentLocation + ' #emergencymiss');
$("#emergencyclear").load(currentLocation + ' #emergencyclear');
$("#noweducationmiss").load(currentLocation + ' #noweducationmiss');
$("#noweducationfuture").load(currentLocation + ' #noweducationfuture');
$("#noweducationaction").load(currentLocation + ' #noweducationaction');
$("#noweducationclear").load(currentLocation + ' #noweducationclear');
}
setInterval('autoRefresh_div()', 3000);
</script> 

<Script>
function zoomImage(event, element) {
	  event.preventDefault(); // Prevent the default behavior of the link
	  element.querySelector('img').classList.toggle("zoomed");
	  setTimeout(function() {
	    window.location.href = element.href;
	  }, 500); // Delay the page navigation to allow the zoom animation to finish
	}
</Script>
<%@include file="../include/lsupporter/foot.jspf"%>



