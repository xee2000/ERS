<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/lsupporter/css/LsupporterMemberSearchList.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css"/>	
 <script src="/resources/lsupporter/js/common.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
	<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />



<div id="">
  <div id="modalContent">
    <div id="modalBody">
      <!-- 모달 창 -->
      <div class="callist">
        <div class="row">
          <div class="col-12">
            <h3 class="caltitle mt-2" style="text-align:center;">배정된 대상자 조회(응급포함)</h3>
          </div>
        </div>
        
<button type="button" class="btn btn-lg btn-custom backbtn mb-2" onclick="CloseWindow();">
  <span class="button-icon">&larr;</span>
  <span class="button-text">뒤로가기</span>
</button>

  <form>
          <table class="tg table table_list" style="undefined;table-layout: fixed; width: 100%;">
            <colgroup>
              <col style="width: 150.333333px">
              <col style="width: 300px">
            </colgroup>
            <tr>
              <th class="tg-l8qj">
                <div class="search_bar search_bar_main flex">
                  <div class="search_bar mb-2 flex">
                   <select class="keywordoption"name="searchType" id="searchType" >
   <option value="" disabled>검 색</option>
<option value="all" ${cri.searchType eq 'all' ? 'selected':'' }>전체</option>
<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>대상자명</option>
<option value="g" ${cri.searchType eq 'g' ? 'selected':'' }>성별</option>
<option value="r" ${cri.searchType eq 'r' ? 'selected':'' }>활동여부</option>
<option value="rd" ${cri.searchType eq 'rd' ? 'selected':'' }>남은정기상담일</option>
  </select>
                    <div class="search_container flex items-center">
                      <input class="searchinput" autocomplete="false" type="text" name="keyword" required="required" value="${cri.keyword}" id="search_keyword" onkeyup="handleEnterKey(event)">
                      <button type="button" class="absolute right-0 top-0 bottom-0 p-2 right-1.25" id="button" data-card-widget="search" onclick="list_go(1);">
                        <i class="fa fa-search" style="black;"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </th>
            </tr>
          </table>
        </form>

<div class="row">
<div class="col-12">


<table>

<thead>
  <tr>
    <th style="text-align:center;" class="">이미지</th>
    <th style="text-align:center;" class="">대상자명</th>
    <th style="text-align:center;" class="">성별</th>
    <th style="text-align:center;" class="">나이</th>
    <th style="text-align:center;" class="">상태<br/>구분</th>
  </tr>
</thead>
	<c:forEach var="member" items="${memberList}">
  <fmt:formatDate value="${member.occurTime}" pattern="MM-dd kk시mm분" var="occurTime" />
  <tbody>
    <tr>
      <td style="display:none" class="modal_content">
        <input type="hidden" id="memberIdInput">
      </td>
      <td style="display:none" class="modal_content">
        <input type="hidden" id="memberSCodeInput" class="member-sCode" value="${member.SCode}" />
      </td>
      
      
      <td class="modal_content">
        <img style="display:inline-block;" src="/resources/lsupporter/img/노인1.png" >
      </td>
      <td class="modal_content">
        <a href="#" onclick="selectMember('${member.id}', '${member.name}', '${member.SCode}')">${member.name}</a>
      </td>
      <td class="modal_content">
        ${member.gender}
      </td>
      <td class="modal_content">
        ${member.age}
      </td>
      <c:if test="${member.SCode == 0}">
        <td class="modal_content">
          미발생
        </td>
      </c:if>
      <c:if test="${member.SType == 1}">
        <td class="modal_content" style="color:red;">
          응급
        </td>
      </c:if>
       <c:if test="${member.SType == 2}">
        <td class="modal_content" style="color:red;">
          119
        </td>
      </c:if>
       <c:if test="${member.SType == 3}">
        <td class="modal_content" style="color:red;">
          화재
        </td>
      </c:if>
       <c:if test="${member.SType == 4}">
        <td class="modal_content" style="color:red;">
          활동미감지
        </td>
      </c:if>
       <c:if test="${member.SType == 5}">
        <td class="modal_content" style="color:red;">
          장기외출
        </td>
      </c:if>
    </tr>
  </tbody>
</c:forEach>



</table>


<%@include file="../include/lsupporter/pagination.jsp"%>

</div>

</div>
      
    </div>
  </div>
</div>
 
  </div>
<script>
function selectMember(memberId, memberName, memberSCode) {
  var parentWindow = window.opener;
  var searchInput = parentWindow.document.getElementById('searchinput');
  var memberIdInput = parentWindow.document.getElementById('memberIdInput');
  var memberSCodeInput = parentWindow.document.getElementById('memberSCodeInput');

  searchInput.value = memberName;
  memberIdInput.value = memberId;
  memberSCodeInput.value = memberSCode;

  // Close the child window after a delay
  setTimeout(function () {
    window.close();
  }, 100);
}
</script>

<script>
function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}
</script>


