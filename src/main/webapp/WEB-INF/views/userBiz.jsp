<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="resources/css/home.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap');
    </style>
    <body>
<jsp:include page="realGnb.jsp"/>
 </head>

<form action="userBiz.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_id" value="${riderSetting.user_id}"/>
<input type="hidden" name="user_pw" value="${riderSetting.user_pw}"/>
	<header>
	   <nav id="nav" style="position: fixed;">
	   <a href="myPage.go">모아보기</a>
	   <a href="mySales.go">판매글</a>
	   <a href="myGallery.go">갤러리</a>
	   <a href="mySalesJjim.go">관심판매글</a>
	   <a href="myGalleryJjim.go">찜한갤러리</a>
	   <a href="userAuth.go" style="color:skyblue; text-decoration: underline;">설정</a>
	   
	   
	  </nav>
	  	<nav id="userauth" style="position: fixed;">
		<a href="userAuth.go">회원정보수정</a>
		<a href="userBiz.go" style="color:skyblue; text-decoration: underline;">인증판매자등록</a>
		</nav>
	</header>
	
	<div id="storename" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 상호명&nbsp;&nbsp;<input type="text" name="store_name" id="store_name"/></h4>
	</div>
	<div id="biznum" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 사업자등록번호&nbsp;&nbsp;<input type="text" id="biz_num" name="biz_num"/>
			<button type="button" id="overlay4" class="test_btn2">확인하기</button>
			</h4>
	</div>
		
		
	<div id="bizauthphoto">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 사업자등록증&nbsp;&nbsp;</h4>
	<c:if test="${biz_photo eq null}">
					<input type="file" name="photo" />
				</c:if>
				<c:if test="${biz_photo ne null}">
					<img src="/photo/${biz_photo}" style="width: 130px;"/>
					<input type="file" name="photo" />
				</c:if>
	</div>
	
	<div id="riderupdatebutton4">
	<input type="button" onclick="location.href='./riderPage'" value="돌아가기"/>
	<button type="submit">저장</button>
	</div>
	</form>
	
	<hr>
				<div class="main-box">
        <div class="profile-box">
        <c:if test="${new_photo_name eq null}">
        	<img src="resources/photo/프로필 기본.png" width="150px">
        </c:if>
        <img src="/photo/${new_photo_name}" width="150px">
            <div class="title-nickname">
            <h2>${dto.nickname}</h2>
            </div>
        </div>
        <div class="content">
        <c:choose>
        	<c:when test="${avg eq 1}">
        	<img src="resources/img/dolphin1.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 2}">
        	<img src="resources/img/dolphin2.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 3}">
        	<img src="resources/img/dolphin3.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 4}">
        	<img src="resources/img/dolphin4.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 5}">
        	<img src="resources/img/dolphin5.png" style="width: 60px;"/>
        	</c:when>
        </c:choose>        
        </div>
            <div id="avgdolphin">&nbsp;&nbsp;나의 &돌핀 단계 : ${avg}단계&nbsp;&nbsp;</div>
            <hr>
            <div class="parent">
		        <div class="pfirst">판매글</div>
		        <div class="psecond">갤러리</div>
		        <div class="pthird">나의 관심</div>
		    		</div>
		    		<div class="child">
		        <div class="cfirst">${countsales}</div>
		        <div class="csecond">${countgallery}</div>
		        <div class="cthird">${countinterest}</div>
        		</div>

        </div>
</body>
<!--다음 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script type="text/javascript">

$('#overlay4').on('click',function(e){	
	var $biz_num = $('#biz_num');
	console.log('사업자 인증번호 : '+ $('#biz_num').val());
	var data = {
	    "b_no": [$('#biz_num').val()]
	}; 

	console.log(JSON.stringify(data));
	
	$.ajax({
	    url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=nVrNlyhgw%2BhJSbEpOUAI7wOMOImM0h7wWZVrZgTQM82cIsyAWfeiz43Ws4UaaiDGd%2BJqh%2FitjOcIphtyk4eApQ%3D%3D",  
	    type: "POST",
	    data: JSON.stringify(data),
	    dataType: "JSON",
	    contentType: "application/json",
	    accept: "application/json",
	    success: function(data) {
	        console.log('API 호출 성공:');
	        console.log('tax_type : ', data.data[0].tax_type);
	        console.log(data);
	        if(data.data[0].b_stt == ''){
	        	alert('국세청에 등록되지 않은 사업자등록번호입니다.');
	        }else{
	        	alert('국세청에 등록된 사업자등록번호입니다.');
	        }
	    },
	    error: function(xhr, status, error) {
	        console.log('API 호출 실패:');
	        console.log(error);

	    }
	});
});

</script>
</html>