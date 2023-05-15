<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/mypage.css">

<!-- Main content -->
<section class="content-header" style="height: 1100px;">
		<div class="container-fluid">
				<div class="row title">

						<h3 class="menu_list_name ">마이페이지</h3>
				</div>
				<div class="col-12 menu_bar">
						<div class="menu_list">
								<div class="item">
										<ul class="menu_bar flex">
												<li class="col-6">
														<div class="card card-outline">
																<div class="card-body box-profile">
																		<div class="text-center">
																				<img class="profile-user-img img-fluid img-circle" onclick="location.href='/ers/lsupporter/nowcare'"
																						src="/resources/lsupporter/img/돌봄업무.jpg" style="width: 600px; height: 400px;" alt=""
																				>
																		</div>
																		<h3 class="profile-username text-center">당일 돌봄내역</h3>
																</div>

														</div>
												</li>
												<li class="col-6">
														<div class="card card-outline">
																<div class="card-body box-profile">
																		<div class="text-center">
																				<img class="profile-user-img img-fluid img-circle"
																						onclick="location.href='/ers/lsupporter/lsupporterstatus'" src="/resources/lsupporter/img/정보수정.jpg"
																						style="width: 600px; height: 400px;" alt=""
																				>
																		</div>
																		<h3 class="profile-username text-center">정보수정</h3>
																</div>

														</div>
												</li>
										</ul>

								</div>

						</div>
				</div>
		</div>

</section>
<!--foot -->


<%@include file="../include/lsupporter/foot.jspf"%>





