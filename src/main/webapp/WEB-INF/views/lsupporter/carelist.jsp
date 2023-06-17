<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="carelist" value="${dataMap.carelist }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<link rel="stylesheet" href="/resources/lsupporter/css/emergencylist.css">
<!-- Content Wrapper. Contains page content -->
		
<div class='row'>
  <div class="col-12" style="background-color: #f2f2f2; padding: 10px; border-radius: 5px;">
    <p style="font-weight: bold; color: red; font-size: 1.5rem;">정기상담 안내:</p>
    <p style="font-size: 1.5rem;">본 정기상담의 경우 <span style="font-weight: bold; color: red;">장애인으로 구분된 경우</span> 보고서 작성일 기준 <span style="font-weight: bold; color: red;">14일</span>로 등록되며, <span style="font-weight: bold; color: red;">독거노인의 경우</span> <span style="font-weight: bold; color: red;">30일</span>로 등록됩니다.</p>
  </div>
</div>


<div class="row">
<div class="col-12 memberlistable">
<table class="tg memberlistable table" style="width:100%;">

<thead>
  <tr>
	 <th class="tg-nqa4">선택</th>
    <th class="tg-nqa4">사진</th>
    <th class="tg-nqa4">대상자명</th>
    <th class="tg-nqa4">나이</th>
    <th class="tg-nqa4">성별</th>
    <th class="tg-nqa4">활동여부</th>
    <th class="tg-nqa4">남은정기상담일</th>

  </tr>
</thead>
   <c:forEach items="${carelist}" var="care">
   <fmt:formatDate value="${care.activeTime}" pattern="yy-MM-dd" var="activeTime"/>
   <fmt:formatDate value="${care.regDate}" pattern="yy-MM-dd" var="regDate"/>
  <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yy-MM-dd" var="currentDate" />
  <tr>
    <td style="display:none;">
      <span id="memType">${care.memType}</span>
    </td>
   <c:if test="${care.RNo != 0 }">
    <td class="tg-73oq">
      <input type="checkbox" class="text-center check_box checkbox"  name="selectedMembers" value="${care.RNo}"/>
    </td>
   </c:if>
   <c:if test="${care.RNo == 0 }">
    <td class="tg-73oq">
    </td>
   </c:if>
    <td class="tg-73oq">
      <span class="manPicture" data-id="${care.id}" style="width:80px;height:80px;display:block;margin:0 auto;"></span>
    </td>
    <td class="tg-73oq membername" onclick="location.href='/ers/lsupporter/memberdetail?id=${care.id}'">
      ${care.name}
    </td>
    <td class="tg-73oq">
      ${care.age}
    </td>
    <td class="tg-73oq">
      ${care.gender}
    </td>
    <td class="tg-73oq">
      <c:choose>
        <c:when test="${activeTime == currentDate}">
          활동중
        </c:when>
        <c:otherwise>
          미활동
        </c:otherwise>
      </c:choose>
    </td>
  <c:if test="${care.RNo !=0 }">
    <td class="tg-73oq">
      <span class="regDate" style="color: ${care.d_day le 3 ? 'red' : 'black'};">${care.d_day == 0 ? '금일상담' : care.d_day lt 0 ? care.d_day*-1 += '일 지남' : care.d_day += '일전'}</span>
    </td>
  </c:if>
    <c:if test="${care.RNo == 0 }">
    <td class="tg-73oq" style="color:black;">
     신규대상자
    </td>
    </c:if>
  </tr>
</c:forEach>
</table>
</div>
</div>
<%@include file="../include/lsupporter/pagination.jsp"%>

<!--foot -->


