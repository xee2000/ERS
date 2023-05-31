<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/lifeupdate.css">

<style>
    .tg {
        border-collapse: separate;
        border-spacing: 5px;
    }
    
    .tg th {
        padding: 10px;
    }
    
    .tg td {
        padding: 10px;
    }
    
    .tg textarea {
        border: 2px solid black;
        padding: 5px;
    }
    
    .tg textarea:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 5px #3498db;
    }
</style>
<div class="row">
<div class="col-12 flex mb-2">
<button type="button" class="btn btn-primary btn-md ml-2" onclick="modify_go();">정보수정
<i class="fa fa-check"></i>
</button>
</div>
</div>
<div class="container-fluid">
<div class="row">	

<div class="col-md-8">
<div class="card">
<div class="card-header p-2" style="background-color:#007bff;color:white;">
<ul class="nav nav-pills justify-around" >
<li class="nav-item" style="    font-family: 'MICEGothic Bold';font-size:2rem;" >대상자정보</li>
</ul>
</div>
<div class="card-body">
    <div class="tab-content">
        <form class="form-horizontal" action="lifemodify" method="post" id="form">
            <input type="hidden" name="id" value="${memberdetail.id}"> 
            
            <table class="tg">
                <tbody>
                    <tr>
                        <th class="tg-0lax" style="font-weight:bold;font-size:1.2rem;font-family: 'TheJamsil5Bold';">대상자명 </th>
                        <td class="tg-0lax">${memberdetail.name}</td>
                    </tr>
                    
                    <tr>
                         <th class="tg-0lax" style="font-weight:bold;font-size:1.2rem;font-family: 'TheJamsil5Bold';">질병정보</th>
                        <td class="tg-0lax">
                            <textarea name="orgdisease" style="border-radius:5px;" cols="50" placeholder="${memberdetail.orgdisease}"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                         <th class="tg-0lax" style="font-weight:bold;font-size:1.2rem;font-family: 'TheJamsil5Bold';">복용약물내역</th>
                        <td class="tg-0lax">
                            <textarea name="drug" style="border-radius:5px;"  cols="50"placeholder="${memberdetail.drug}"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <th class="tg-0lax" style="font-weight:bold;font-size:1.2rem;font-family: 'TheJamsil5Bold';">심리상태</th>
                        <td class="tg-0lax">
                            <textarea name="mentalstatus" style="border-radius:5px;"cols="50"  placeholder="${memberdetail.mentalstatus}"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <th class="tg-0lax" style="font-weight:bold;font-size:1.2rem;font-family: 'TheJamsil5Bold';">알러지</th>
                        <td class="tg-0lax">
                            <textarea name="allergy" style="border-radius:5px;"  cols="50" placeholder="${memberdetail.allergy}"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

</div>

</div>

<div class="col-md-4">
<div class="card">
<div class="card-header p-2" style="background-color:#007bff;color:white;">
<ul class="nav nav-pills justify-around">
<li class="nav-item" style="    font-family: 'MICEGothic Bold';font-size:2rem;" >최근 작성된<br/> 건강상태보고서</li>
</ul>
</div>
<div class="card-body">
<div class="tab-content">


<table class="tg type03">
<tbody>
<tr>
 <th class="tg-0lax" style="font-weight:bold;font-size:1.2rem;font-family: 'TheJamsil5Bold';">상세내용</th>
</tr>
  <tr>
  
   
    <td class="tg-0lax">
    <textarea name="" id="" cols="30" rows="10" readonly placeholder="${lifereport.content }" rows="6"></textarea>
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

<script>
    function modify_go() {
        var form = $('#form');
        var isValid = true;

        // Check if any field is empty
        form.find('textarea').each(function() {
            if ($(this).val().trim() === '') {
                isValid = false;
                return false; // Exit the loop
            }
        });

        if (isValid) {
            Swal.fire({
                title: '확인',
                icon: 'question',
                text: '건강상태를 수정하시겠습니까?',
                confirmButtonText: '확인',
                showCancelButton: true,
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        } else {
            Swal.fire({
                title: '공란 알림',
                icon: 'warning',
                text: '빈 내용을 입력해주세요.',
                confirmButtonText: '확인'
            });
        }
    }
</script>

<%@include file="../include/lsupporter/foot.jspf"%>
