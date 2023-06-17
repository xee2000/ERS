<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="emergencyList" value="${dataMap.emergencyList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${pageMaker.cri }" />
<link rel="stylesheet" href="/resources/lsupporter/css/emergencylist.css">
<!-- Content Wrapper. Contains page content -->
<div class="row">
  <div class="col-12" style="background-color: #f2f2f2; padding: 10px; border-radius: 5px;">
    <p style="font-weight: bold; color: red; font-size: 1.5rem; margin-bottom: 10px;">내역 안내:</p>
    <p style="font-size: 1.5rem; line-height: 1.4;">본 내역의 경우 응급상황이 발생된 대상자의 누적된 응급내역이 표시됩니다. 보고서를 작성하신 경우 "작성완료"로 표기되며, 미작성은 "미작성"으로 표기됩니다. 작성완료의 경우 작성된 보고서 열람이 가능합니다.</p>
  </div>
</div>


<div class="row">
<div class="col-12 memberlistable">
				<form action="#" method="get">
						<table class="tg memberlistable table" style="width: 100%;">

<thead>
		<tr>
				<th class="tg-nqa4">사진</th>
				<th class="tg-nqa4">대상자명</th>
				<th class="tg-nqa4">성별</th>
				<th class="tg-nqa4">응급발생시간</th>
				<th class="tg-nqa4">
						보고서
						<br />
						<br />
						작성여부
				</th>
				<th class="tg-nqa4">열람여부</th>
		</tr>
</thead>
<c:forEach items="${emergencyList }" var="emergency" varStatus="status">
	<fmt:formatDate value="${emergency.occurTime }" pattern="MM-dd kk시mm분" var="occurTime" />
	<tbody>
			<tr>
					<td class="tg-73oq">
							<span class="manPicture" data-id="${emergancy.id }"
									style="width: 80px; height: 80px; display: block; margin: 0 auto;"
							></span>
					</td>
					<td class="tg-73oq membername" onclick="location.href='/ers/lsupporter/memberdetail?id=${emergancy.id}'">
							${emergency.name }</td>
					<td class="tg-73oq">${emergency.gender }</td>
					<td class="tg-73oq">${occurTime }</td>
					<c:if test="${emergency.RNo == 0 }">
							<td class="tg-73oq" style="color: red;">미작성</td>
					</c:if>

					<c:if test="${emergency.RNo != 0 }">
							<td class="tg-73oq" style="color:blue;text-decoration:underline;" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${emergency.RNo}">
									작성완료</td>
					</c:if>


					<c:if test="${emergency.viewCheck == null }">
							<td class="tg-73oq"></td>
					</c:if>
					<c:if test="${emergency.viewCheck == 0 }">
							<td class="tg-73oq">미열람</td>
					</c:if>
					<c:if test="${emergency.viewCheck == 1}">
							<td class="tg-73oq">열람</td>
					</c:if>
			</tr>

	</tbody>
</c:forEach>
						</table>
				</form>
		</div>
</div>
<%@include file="../include/lsupporter/pagination.jsp"%>

<!--foot -->


