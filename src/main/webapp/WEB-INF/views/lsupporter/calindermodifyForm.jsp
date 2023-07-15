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
            <h3 class="caltitle mt-2" style="text-align:center;">일정수정</h3>
          </div>
        </div>
        
<button type="button" class="btn btn-lg btn-custom backbtn mb-2" onclick="CloseWindow();">
  <span class="button-icon">&larr;</span>
  <span class="button-text">뒤로가기</span>
</button>
<button onclick="modify();">수정</button>

  
<div class="row">
<div class="col-12">

<form action="calindermodify" method="POST" id="sendForm">
<table>
<fmt:formatDate value="${calinder.regDate }" var="regDate" pattern="yyyy-MM-dd"/>
<thead>
  <tr>
    <th style="text-align:center;" class="">제목</th>
     <td style="display:none" class="modal_content">
      </td>
      <td class="modal_content">
      <input type="text" name="title"value="${calinder.title }"/>
      <input type="hidden" name="id" value="${calinder.id }"/>
      </td>
    <th style="text-align:center;" class="">내용</th>
      <td class="modal_content">
    <textarea rows="5" cols="5" name="content" placeholder="${calinder.content }"></textarea>
      </td>
    <th style="text-align:center;" class="">날짜</th>
      <td class="modal_content">
  <input type="date" name="regDate" value="${regDate }">
  <input style="display:none;" type="date" name="updateDate"  id='currentDate'/>

      </td>
  </tr>
</thead>
  <tbody>
    <tr>
     
    
    
      
    </tr>
  </tbody>



</table></form>



</div>

</div>
      
    </div>
  </div>
</div>

<script>
function modify(){
var form = $('#sendForm');
form.submit();
}
</script>

<script>
  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
</script>
 
  </div>



