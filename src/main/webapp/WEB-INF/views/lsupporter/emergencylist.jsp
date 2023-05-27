<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
<c:set var="emergencyList" value="${dataMap.emergencyList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>
<link rel="stylesheet" href="/resources/lsupporter/css/emergencylist.css">
<!-- Content Wrapper. Contains page content -->



		<!-- Main content -->
		<section class="content-header">
<h3 class="emergancylist_title">응급발생 내역</h3>
<div class="row body_case">
		<div class="col-12">
		<div class="category_date_menubar">
		<div class="date">
		<label class="date_select">날짜조회 :</label>
		<input type="date" name="startday" style="width:250px;border:1px solid black;">&nbsp;&nbsp;<span class="dash">-</span>
		&nbsp;&nbsp;<input type="date" name="endday" style="width:250px;border:1px solid black;">
		</div>
  <div class="search_bar search_bar_main flex mb-5">
 <div class="search_bar mb-2 flex">
  <select class="keywordoption"name="searchType" id="searchType" >
   <option value="" disabled>검 색</option>
<option value="nbg" ${cri.searchType eq 'nbg' ? 'selected':'' }>전체</option>
<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
<option value="g" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
<option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>활동여부</option>
<option value="rd" ${cri.searchType eq 'rd' ? 'selected':'' }>남은정기상담일</option>
  </select>
<div class="search_container flex items-center">
  <input class="searchinput w-full" autocomplete="false" type="text" name="keyword" required="required" value="${cri.keyword}" id="search_keyword" onkeyup="handleEnterKey(event)">
  <button type="button" class="absolute right-0 top-0 bottom-0 p-2 right-1.25" id="button" data-card-widget="search" onclick="list_go(1);">
    <i class="fa fa-search"></i>
  </button>
</div>
  </div>
  </div>
  
  
		</div>
		
		
		
<div class="row">
<div class="col-12">
<div class="mt-2 mb-2 button buttens">
<button type="button" class="btn btn-dark btn-lg mt-2 mb-2 backbtn" onclick="history.back();">뒤로가기</button>
<button type="button" 
class="btn btn-lg mr-1 ml-1 btn-primary regist " onclick="location.href='/ers/lsupporter/emergencyreportForm'">등록</button>
</div>
</div>
</div>

<div class="row">
<div class="col-12 memberlistable">
<form action="#" method="get">
<table class="tg memberlistable table" style="width:100%;">
<colgroup>
<col style="width: 23px">
<col style="width: 100px">
<col style="width: 60px">
<col style="width: 60px">
<col style="width: 90px">
<col style="width: 90px">
<col style="width: 90px">
</colgroup>
<thead>
  <tr>
    <th class="tg-nqa4">번호</th>
    <th class="tg-nqa4">사진</th>
    <th class="tg-nqa4">대상자명</th>
    <th class="tg-nqa4">성별</th>
    <th class="tg-nqa4">응급발생시간</th>
    <th class="tg-nqa4">보고서<br/><br/>
    작성여부</th>
    <th class="tg-nqa4">열람여부</th>
  </tr>
</thead>
<c:forEach items="${emergencyList }" var="emergency" varStatus="status">
<fmt:formatDate value="${emergency.occurTime }" pattern="MM-dd kk시mm분" var="occurTime" />
<tbody>
  <tr>
    <td class="tg-73oq">${status.index+1 }</td>
    <td class="tg-73oq">
   <span class="manPicture" data-id="${emergancy.id }" style="width:80px;height:80px;display:block;margin:0 auto;"></span>
    </td>
    <td class="tg-73oq" onclick="location.href='/ers/lsupporter/memberdetail?id=${emergancy.id}'">
	${emergency.name }
</td>
    <td class="tg-73oq">
    ${emergency.gender }
    </td>
    <td class="tg-73oq">
    ${occurTime }
    </td>
    <c:if test="${emergency.RNo == 0 }">
      <td class="tg-73oq">
  		미작성
    </td>
    </c:if>
    
     <c:if test="${emergency.RNo != 0 }">
      <td class="tg-73oq" onclick="location.href='/ers/lsupporter/reportdetail?rNo='+${emergency.RNo}">
  		작성완료
    </td>
    </c:if>
    
    
     <c:if test="${emergency.viewCheck == null }">
      <td class="tg-73oq">
    </td>
    </c:if>
    <c:if test="${emergency.viewCheck == 0 }">
      <td class="tg-73oq">
  		미열람
    </td>
    </c:if>
    <c:if test="${emergency.viewCheck == 1}">
      <td class="tg-73oq">
  		열람
    </td>
    </c:if>
  </tr>
  
</tbody>
  </c:forEach>
</table>
</form>
</div>
</div>
<%@include file="../include/lsupporter/pagination.jsp"%>

		</div>
</div>


</section>
<!--foot -->


<script>

</script>


<%@include file="../include/lsupporter/foot.jspf"%>





