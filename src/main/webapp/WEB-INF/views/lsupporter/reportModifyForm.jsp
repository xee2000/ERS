<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/lsupporter/head.jspf"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/lsupporter/css/nonmemberreportForm.css">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> 
<div class="tab-pane" id="carewordlist">
<div class="col-md-12">
<div class="reportForm">
<div class="form-group row">

<h1 class="report_title" style="margin:0 auto;">보고서</h1>
</div>
</div>
</div>

<div class="row">
<div class="col-12 flex justify-end mb-1">
<button type="button" class="btn btn-dark btn-md backbtn" onclick="history.back();">뒤로가기</button>
<c:if test="${reportlsupporter.viewCheck == 0}">
<button type="submit" class="btn btn-primary btn-md" onclick="modify();">수정</button>
</c:if>
</div>
</div>

<table class="tg mb-3" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 249.333333px">
<col style="width: 252.333333px">
</colgroup>
<thead>
  <tr>
    <th >보고서 작성일자</th>
    <fmt:formatDate value="${reportlsupporter.regDate }" pattern="yy-MM-dd" var="regDate"/>
    <td style="text-align:center;">
   ${regDate }
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>대상자</th>
    <td style="text-align:center;">
    ${reportlsupporter.name}
</td>
  </tr>

  <tr>
    <th class="tg-2xpi">보고서 구분</th>
    <td class="tg-2xpi">
   <c:if test="${reportlsupporter.reType==1 }">
   응급상황보고서
   </c:if>
    <c:if test="${reportlsupporter.reType==2 }">
   고객면담보고서
   </c:if>
    <c:if test="${reportlsupporter.reType==3 }">
   건강상태보고서
   </c:if>
    <c:if test="${reportlsupporter.reType==4 }">
   서비스취소보고서
   </c:if>
    <c:if test="${reportlsupporter.reType==5 }">
   장기부재신청 보고서
   </c:if>
    <c:if test="${reportlsupporter.reType==6 }">
   악성대상자신고보고서
   </c:if>
    <c:if test="${reportlsupporter.reType==7 }">
   장비점검보고서
   </c:if>
    </td>
  </tr>
</tbody>
</table>


<c:if test="${reportlsupporter.reType ==2 }">
<!--고객면담  -->
<div class="flex">
  <div class="col-md-12">
      <div class="card-header">
        <h3 class="card-title report_title">고객면담보고서</h3>
       
      </div>
      <div class="card-body" style="display: block;">
        <div class="form-group">
          <form action="reportModify" name="form" method="post" role="form" id="sendForm1">
                    <input type="hidden" name="occurType" value="null"> 
                    <input type="hidden" name="occurTime" value="23-01-01"> 
                    <input type="hidden" name="rNo" value="${reportlsupporter.RNo }">
        <div class="report-content">
            <table>
            
                <tr>
                
                    <th style="text-align: center;">특이사항</th>
                    
                   <td>
              	<textarea name="content" cols="5" rows="5" id="summernote">${reportlsupporter.content }</textarea>
				</td>
                </tr>
                <tr>
                    <th style="text-align: center;">전화유무</th>
                    <td> 
                    <input type="radio" name="callCheck" value="전화함">전화함
                    <input class="ml-2" type="radio" name="callCheck" value="전화안함">전화안함
                    </td>
                </tr>
            </table>
            <!-- 추가적인 테이블 내용을 추가할 수 있습니다. -->
        </div>
        </form>
    </div>
</div>


</div>
</div>
</div>
</div>
<!--장비점검 보고서 끝  -->
</c:if>


<c:if test="${reportlsupporter.reType ==3 }">
<!--건강상태  -->
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">건강상태보고서</h3>
</div>
<div class="card-body" style="display: block;">
<div class="form-group">
<div class="report">	
        <div class="report-content">
<form action="reportModify" name="form" method="post" role="form" id="sendForm2">
 <input type="hidden" name="rNo" value="${reportlsupporter.RNo }">
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23-01-01"> 
<input type="hidden" name="callCheck" value="">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 290.333333px">
</colgroup>
<tbody>
  <tr>
    <th class="">확인내용</th>
    <td class="">
    <textarea class="summernote" id="content" name="content" rows="3">${reportlsupporter.content }</textarea>
    </td>
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
</c:if>

<!--건강상태 보고서 끝  -->

<!--서비스취소  -->
<c:if test="${reportlsupporter.reType ==4 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">서비스취소보고서</h3>
</div>
<div class="card-body" style="display: block;">
<div class="form-group">
<form action="reportModify" name="form" method="post" role="form" id="sendForm3" enctype="multipart/form-data">
 <input type="hidden" name="rNo" value="${reportlsupporter.RNo }">
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23-01-01"> 
<input type="hidden" name="callCheck" value="">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 287.333333px">
</colgroup>
<thead>
  <tr>
    <td class="tg-2xpi">첨부파일</td>
    <td class="tg-l8qj">
   <div class="card-footer fileInput">
<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
	<!-- 첨부파일 썸네일 -->		
<c:forEach items="${reportlsupporter.reportFileList }" var="reportFileList" >
	<li class="attach-item" target-sfNo="${reportFileList.sfNo }" file-name="${reportFileList.filename }">																			
		<div class="mailbox-attachment-info ">
			<a class="mailbox-attachment-name" name="attachedFile" href="javascript:location.href='<%=request.getContextPath()%>/ers/getFile?sfNo=${reportFileList.sfNo }';" >													
				<i class="fas fa-paperclip"></i>
				${reportFileList.filename }&nbsp;&nbsp;
				<button type="button" onclick="removeFile_go('${reportFileList.sfNo }');return false;" style="border:0;outline:0;" class="btn btn-danger">X</button>																									
			</a>													
		</div>
	</li>
</c:forEach>
	</ul>
	<br/>														
</div>
    </td>
  </tr>
</thead>
</table>
</form>
</div>
</div>
</div>
</div>

</c:if>
<!--서비스취소 보고서 끝  -->

<!--장기부재  -->
<c:if test="${reportlsupporter.reType ==5 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">장기부재 신청서</h3>
</div>
<form action="reportModify" name="form" method="post" role="form" id="sendForm4">
 <input type="hidden" name="rNo" value="${reportlsupporter.RNo }">
<input type="hidden" name="callCheck" value="">
<input type="hidden" name="occurType" value="null"> 
<input type="hidden" name="occurTime" value="23-01-01"> 
<div class="card-body" style="display: block;">
<div class="form-group">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 140.333333px">
<col style="width: 135.333333px">
<col style="width: 188.333333px">
<col style="width: 149.333333px">
</colgroup>
<thead>
  <tr>
 <th>장기부재 사유</th>
<th colspan="3">

  <input type="radio" name="content" checked value="입원"/>입원&nbsp;&nbsp;
  <input type="radio" name="content" value="여행"/>여행&nbsp;&nbsp;
  <input type="radio" id="gita" name="content"value="기타" onclick="showTextarea()"/>기타
  <input type="text" name="content" id="detailsInput" style="display: none;" value="${reportlsupporter.content }"/>
</th>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
</form>
</div>
</div>
</c:if>

<!--장기부재신청서보고서 끝  -->

<!--악성대상자 신고 보고서  -->
<c:if test="${reportlsupporter.reType ==6 }">
<div class="flex">
<div class="col-md-12">
<div class="card-header">
<h3 class="card-title report_title">악성대상자 신고보고서</h3>

</div>
<form action="reportModify" name="form" method="post" role="form" id="sendForm5" enctype="multipart/form-data">
 <input type="hidden" name="rNo" value="${reportlsupporter.RNo }">
<input type="hidden" name="callCheck" value="">
<input type="hidden" name="occurType" value="null"> 
<div class="card-body" style="display: block;">
<div class="form-group">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 190px;">
<col style="width: 377.333333px">
</colgroup>
<thead>
<fmt:formatDate value="${reportlsupporter.occurTime }" pattern="yy-Mm-dd" var="occurTime"/>
  <tr>
    <th>발생시간</th>
    <td style="text-align:center;">
   <input type="date" name="occurTime" value="${occurTime}">
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>사건내용</th>
    <td>
      <textarea name="content" rows="3">${fn:escapeXml(reportlsupporter.content) }</textarea>
    </td>
  </tr>
    <tr>
    <th>첨부파일</th>
    <td >
    <button class="btn btn-primary"	onclick="addFile_go()" type="button" id="addFileBtn">파일추가</button>
 <div class="card-footer fileInput">
<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
	<!-- 첨부파일 썸네일 -->		
<c:forEach items="${reportlsupporter.reportFileList }" var="reportFileList" >
	<li class="attach-item" target-sfNo="${reportFileList.sfNo }" file-name="${reportFileList.filename }">																			
		<div class="mailbox-attachment-info ">
			<a class="mailbox-attachment-name" name="attachedFile" href="javascript:location.href='<%=request.getContextPath()%>/ers/lsupporter/getFile?sfNo=${reportFileList.sfNo }';" >													
				<i class="fas fa-paperclip"></i>
				${reportFileList.filename }&nbsp;&nbsp;
				<button type="button" onclick="removeFile_go('${reportFileList.sfNo }');return false;" style="border:0;outline:0;" class="btn btn-danger">X</button>																									
			</a>													
		</div>
	</li>
</c:forEach>
	</ul>
	<br/>														
</div>							
</div>
    </td>
  </tr>
</tbody>
</table>
</div>
</div>
</form>
</div>
<!--악성대상자 신고보고서 끝  -->

</div>
</c:if>


<!--기타에 입력한경우 내용이 나오도록  -->



<script>
function showTextarea() {
  var detailsInput = $('#detailsInput');
  var gita = $('#gita');

  if (gita.is(':checked')) {
    detailsInput.show();
  } else {
    detailsInput.hide();
  }
}
</script>

<script>
function modify() {

	  var form = $('form[role="form"]');
		var inputs = $('input[name="uploadFile"]');
		
		for(var input of inputs){
			if(input.value==""){
				alert("파일을 선택하세요.");
				input.focus();
				input.click();
				return;
			}
		}
	  
	  if (form.length > 0) {
		  Swal.fire({
		        icon: "info",
		        title: "수정",
		        text: `보고서를 수정하시겠습니까?.`,
		        showCancelButton: true,
		        confirmButtonText: "확인",
		    }).then((res) => {
		    	form.submit(); 
		        /* Read more about isConfirmed, isDenied below */
		        if (res.isConfirmed) {
		         
		        }
		        else{
		            //취소
		        }
		    });
	  }

}
</script>

<script>

var dataNum=0;
function addFile_go(){
	//alert("add file btn");
	
	var attachedFile=$('a[name="attachedFile"]').length;	//기존파일
	var inputFile=$('input[name="uploadFile"]').length;		//추가된 파일
	var attachCount=attachedFile+inputFile; //기존파일 + 추가된파일 개수
	
	if(attachCount >0){
		alert("파일은 1개만 업로드 가능합니다.");
		return;
	}
	
	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	
	div.append(input).append("<button onclick='remove_go("+dataNum+");'style='border:0;outline:0;'class='btn btn-danger' type='button'>X</button>");
	$('.fileInput').append(div);
	dataNum++;
}

function remove_go(dataNum){
	//alert(dataNum);
	$('div[data-no="'+dataNum+'"]').remove();
}

function removeFile_go(sfNo) {
	//alert(ano);
	var li = $('li[target-sfNo="'+sfNo+'"]');
	if(!confirm(li.attr("file-name")+"을 정말 삭제하겠습니까?")){
		return;
	}
	
	li.remove();
	var input=$('<input>').attr({"type":"hidden",
			"name":"deleteFile",
			"value":li.attr("target-sfNo")
	});
	$('form[role="form"]').prepend(input);
}
</script>


<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>