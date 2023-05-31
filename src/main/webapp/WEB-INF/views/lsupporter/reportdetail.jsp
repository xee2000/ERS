<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/reportdetail.css">
<!--   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> -->
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
<c:if test="${reportlsupporter.viewCheck == 0}">
<button type="submit" class="btn btn-danger btn-md ml-2" onclick="submit_go('remove', '${reportlsupporter.RNo}');">삭제</button>
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
    <th >보고서 번호</th>
    <td style="text-align:center;">
   ${reportlsupporter.RNo }번
    </td>
  </tr>
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
    <c:if test="${reportlsupporter.reType==1 }">
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
       	   
        <div class="report-content">
            <table>
            
                <tr>
                
                    <th style="text-align: center;">특이사항</th>
                    
                   <td >
              	${reportlsupporter.content}
				</td>
                </tr>
                <tr>
                    <th style="text-align: center;">전화유무</th>
                    <td> 
                    ${reportlsupporter.callCheck }
                    </td>
                </tr>
                 <fmt:formatDate value="${reportlsupporter.occurTime }" pattern="yy-MM-dd" var="occurTime"/>
                <tr>
                    <th style="text-align: center;">면담등록일</th>
                    <td> 
                    ${occurTime }
                    </td>
                </tr>
            </table>
            <!-- 추가적인 테이블 내용을 추가할 수 있습니다. -->
        </div>
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
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 290.333333px">
</colgroup>
<tbody>
  <tr>
    <th class="">확인내용</th>
    <td class="">
    ${reportlsupporter.content }
    </td>
  </tr>
  <fmt:formatDate value="${reportlsupporter.occurTime }" pattern="yy-MM-dd" var="occurTime"/>
  <tr>
    <th class="">상태등록일</th>
    <td class="">
  ${occurTime }
    </td>
  </tr>
  
</tbody>
</table>

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
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 150px;">
<col style="width: 287.333333px">
</colgroup>
<thead>
  <tr>
    <th class="tg-2xpi">파일첨부</th>
    <td >
  <c:forEach items="${reportlsupporter.reportFileList }" var="reportFileList">
<div class="col-md-12 col-sm-12 col-xs-12"  style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/ers/lsupporter/getFile?sfNo=${reportFileList.sfNo }';">
	<div class="info-box">
		<span class="info-box-icon bg-yellow">
			<i class="fa fa-copy"></i>
		</span>
		<div class="info-box-content">
			<span class ="info-box-text">
				<fmt:formatDate value="${reportFileList.regDate }" pattern="yyyy-MM-dd" />
			</span>
			<span class ="info-box-number">${reportFileList.filename }</span>
		</div>
	</div>
 </div>
</c:forEach>
    </td>
  </tr>
  <fmt:formatDate value="${reportlsupporter.occurTime }" pattern="yy-MM-dd" var="occurTime"/>
   <tr>
    <th class="">취소요청일</th>
    <td class="">
    ${occurTime }
    </td>
  </tr>
  
</thead>
</table>
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
<td colspan="3">
 ${reportlsupporter.content }
</td>
</tr>
<tr>
    <th class="">장기부재 등록일</th>
    <td class="">
    ${reportlsupporter.occurTime }
    </td>
  </tr>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
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
<div class="card-body" style="display: block;">
<div class="form-group">
<table style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 190px;">
<col style="width: 377.333333px">
</colgroup>
<thead>
<fmt:formatDate value="${reportlsupporter.occurTime }" pattern="yy-MM-dd" var="occurTime"/>
  <tr>
    <th>발생시간</th>
    <td style="text-align:center;">
   ${occurTime}
    </td>
  </tr>
</thead>
<tbody>
  <tr>
    <th>사건내용</th>
    <td>
      ${reportlsupporter.content }
    </td>
  </tr>
    <tr>
    <th>첨부파일</th>
    <td >
  <c:forEach items="${reportlsupporter.reportFileList }" var="reportFileList">
<div class="col-md-12 col-sm-12 col-xs-12"  style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/ers/lsupporter/getFile?sfNo=${reportFileList.sfNo }';">
	<div class="info-box">
		<span class="info-box-icon bg-yellow">
			<i class="fa fa-copy"></i>
		</span>
		<div class="info-box-content">
			<span class ="info-box-text">
				<fmt:formatDate value="${reportFileList.regDate }" pattern="yyyy-MM-dd" />
			</span>
			<span class ="info-box-number">${reportFileList.filename }</span>
		</div>
	</div>
 </div>
</c:forEach>
    </td>
  </tr>
</tbody>
</table>
</div>
</div>
</div>
<!--악성대상자 신고보고서 끝  -->

</div>
</c:if>

<script>
function submit_go(url, rNo) {
  if (url === 'remove') {
    Swal.fire({
      title: '<strong>보고서 삭제</strong>',
      icon: 'warning',
      html: '정말로 보고서를 삭제하시겠습니까?',
      showCloseButton: true,
      showCancelButton: true,
      focusConfirm: false,
      confirmButtonText: '삭제 <i class="fa fa-thumbs-up"></i>',
      confirmButtonAriaLabel: 'Delete processed successfully.',
      cancelButtonText: '취소 <i class="fa fa-thumbs-down"></i>',
      cancelButtonAriaLabel: 'Cancel report deletion.'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: '보고서 삭제',
          icon: 'success',
          html: '보고서가 성공적으로 삭제되었습니다.',
          timer: 2000,
          timerProgressBar: true,
          showConfirmButton: false
        }).then(() => {
          location.href = url + "?rNo=" + rNo;
        });
      }
    });
  }
}
</script>


<div style="height:300px;"></div>

<%@include file="../include/lsupporter/foot.jspf"%>