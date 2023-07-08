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


<div id="">
  <div id="modalContent">
    <div id="modalBody">
      <!-- 모달 창 -->
      <div class="callist">
        <div class="row">
          <div class="col-12">
            <h3 class="caltitle mt-2" style="text-align:center;">대상자 일정조회</h3>
          </div>
        </div>
        
<button type="button" class="btn btn-lg btn-custom backbtn mb-2" onclick="CloseWindow();">
  <span class="button-icon">&larr;</span>
  <span class="button-text">뒤로가기</span>
</button>

  
<div class="row">
<div class="col-12">


<table>

<thead>
  <fmt:formatDate value="${calinder.regDate}" pattern="MM-dd kk시mm분" var="regDate" />
  <fmt:formatDate value="${calinder.updateDate}" pattern="MM-dd kk시mm분" var="updateDate" />
  <tr>
    <th style="text-align:center;" class="">제목</th>
     <td style="display:none" class="modal_content">
        <input type="hidden" id="${calinder.id }">
      </td>
      <td class="modal_content">
       ${calinder.title }
      </td>
    <th style="text-align:center;" class="">내용</th>
      <td class="modal_content">
      ${calinder.content }
      </td>
    <th style="text-align:center;" class="">날짜</th>
      <td class="modal_content">
       ${regDate }
      </td>
      <c:if test="${calinder.updateDate != null}">
        <td class="modal_content">
         ${updateDate }
        </td>
      </c:if>
  </tr>
</thead>
  <tbody>
    <tr>
     
    
    
      
    </tr>
  </tbody>



</table>



</div>

</div>
      
    </div>
  </div>
</div>
 
  </div>



