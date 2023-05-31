<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/lsupporterstatus.css">
<style>
    .input-field {
        position: relative;
    }

    .input-field input {
        border: 1px solid #000;
        border-radius: 5px;
        width: 100%;
        transition: box-shadow 0.3s;
    }

    .input-field input:focus {
        outline: none;
        border-color: #1E90FF;
        box-shadow: 0 0 5px 0 rgba(30, 144, 255, 0.5);
    }
</style>

<div class="mb-1 text-right card-primary">
<button type="button" class="btn btn-success btn-md mr-2" onclick="modify_go();">수정</button>
</div>
<div class="container-fluid">
<div class="row">
<div class="col-md-3" style="margin-top: 11%;">

<div class="card card-primary card-outline" style="height:96%;">
<div class="card-body box-profile">
<div class="text-center">
<div class="row"  style="height:200px;">

<form class="form-horizontal" role="form" action="statusmodify">

<input type="hidden" name="wid"  value="${lsupporter.wid }"/>				
<input type="hidden" name="oldPicture"  value="${lsupporter.picture }"/>				
<input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none" />
<div class="input-group col-md-12">
	<div class="col-md-12" style="text-align: center;">
<div class="lsuppPicture" data-id="${lsupporter.wid }" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto; margin-bottom:5px;"></div>														
<div class="input-group input-group-sm">
	<label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
	<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled
		value="${lsupporter.picture.split("\\$\\$")[1] }"/>
			<input id="picture" class="form-control" type="hidden" name="uploadPicture" />
		</div>						
	</div>												
</div>

	
	
</div>
</div>
</div>

</div>

</div>



<div class="col-md-9">
<div class="card">
<div class="card-header p-2">
<ul class="nav nav-pills justify-around">
<li class="nav-item"><a class="tab_name" href="#activity" data-toggle="tab">정보조회</a></li>
</ul>
</div>
<div class="card-body">
<div class="tab-content" style="margin:0 auto;">
<div class="tab-pane active" id="activity">


<table class="type03">
 <tr>
    <th scope="row">이름</th>
    <td>
    ${lsupporter.name }
    </td>
  </tr>
  <tr>
    <th scope="row">생년월일</th>
    <td>${lsupporter.birth }</td>
  </tr>
  <tr>
    <th scope="row">* 이메일</th>
    <td>
    
   <div class="input-field">
    <input type="email" name="email" value="${lsupporter.email}">
</div>
    </td>
  </tr> 
  <tr>
    <th scope="row">아이디</th>
    <td>${lsupporter.wid }</td>
  </tr>
  <tr>
    <th scope="row">* 비밀번호</th>
    <td>
      <div class="input-field">
    <input type="password" name="pwd" value="${lsupporter.pwd}">
    	</div>
    </td>
  </tr>
</table>
</form>
</div>
		</div>
</div>
</div>
</div>

</div>

</div>
<div style="height:400px;"></div>

<script>
	function modify_go(){
		//alert("click modify btn");
		var form = $('form[role="form"]');		
		form.submit();
	}
	function changePicture_go(){
		//alert("picture changed");
		var picture = $('input[id="inputFile"]')[0];
		
		if (picture.files && picture.files[0]) {
			var reader = new FileReader();
			
			reader.readAsDataURL(picture.files[0]);
			 
			reader.onload = function (e) {
				var pictureView = $('div#pictureView')[0];
				//이미지 미리보기	        	
			 	pictureView.style.backgroundImage = "url("+e.target.result+")";
			 	pictureView.style.backgroundPosition="center";
			 	pictureView.style.backgroundSize="cover";
			 	pictureView.style.backgroundRepeat="no-repeat";			
			}
		}
	}
</script>



<%@include file="../include/lsupporter/foot.jspf"%>
