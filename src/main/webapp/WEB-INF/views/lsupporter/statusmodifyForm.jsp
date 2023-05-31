<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/statusmodifyForm.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<h3 class="title">생활지원사 정보수정</h3>
<div class="row">
<div class="col-12 flex justify-end mb-1">
<button type="button" class="btn btn-primary btn-lg">수정하기
<i class="fa fa-check"></i>
</button>
</div>
</div>
<div class="row">
<div class="col-12">
<form action="" method="get">
<table class="tg" style="undefined;table-layout: fixed; width: 100%;">
<colgroup>
<col style="width: 60px">
<col style="width: 150px">
</colgroup>
<tbody>
 <tr>
    <th class="tg-2xpi" style="vertical-align:middle;">이미지</th>
    <th class="tg-ynlj" style="display:flex;
    justify-content: center;">
<img class="tg-ynlj" src="/img/노인이미지.jpg" style="width:200px;height:200px;"/>
    </th>
  </tr>
 <tr>
    <th class="tg-2xpi">이름</th>
    <th class="tg-ynlj">
<input type="text" name="" value="홍길동" />
    </th>
  </tr>
  <tr>
    <td class="tg-yj5y">생년월일</td>
    <td class="tg-c3ow">
 <input type="text" name="birth" value="1997-08-01"  />
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">전화번호</td>
    <td class="tg-0lax">
   <input type="tel" name="" value="010-3238-7013" />
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">주소</td>
    <td class="tg-0lax">
<input type="tel" name="" value="대전시 동구 은어송로 51번길 71 301호"/>
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">아이디</td>
    <td class="tg-0lax">
    xee2000
    </td>
  </tr>
  <tr>
    <td class="tg-uqo3">비밀번호</td>
    <td class="tg-0lax">
    <input type="password"  name="" value="xee2000" />
    </td>
  </tr>
</tbody>
</table>
</form>

</div>
</div>
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->


<script>
/** 우편번호 찾기 */
function execDaumPostcode() {
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
              $("#postcode").val(data.zonecode);
              $("#address").val(data.roadAddress);
            }
        }).open();
    });
}
</script>
<div style="height:420px;">

</div>

<%@include file="../include/lsupporter/foot.jspf"%>