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

<form action="userAuth.do" method="post">
	
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
		<a href="userAuth.go" style="color:skyblue; text-decoration: underline;">회원정보수정</a>
		<a href="userBiz.go">인증판매자등록</a>
		</nav>
	</header>

	
	
	<h2 id="rdupdate" style="color: skyblue; display:block;">비밀번호 인증</h2>
	
	<div style="float:left; margin-right:10px;">
				<h6 id="riderAuth" style="font-size:15px; color: grey; display:inline;">
				현재 비밀번호를 입력해주세요&nbsp;&nbsp;</h6>
				<input type="password" name="oripassword" id="oripassword">
				
		</div>
		
		<div>
	<input id="pwcheck1"type="button" onclick="location.href='./myPage.go'" value="돌아가기"/>
	<button id="pwcheck">확인</button>
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
<script type="text/javascript">

var msg = "${msg}";
if(msg !=""){
	 	alert(msg);
	 
}
	
$('#pwcheck').on('click',function(e){	
	var oripassword = document.getElementById("oripassword").value;
	console.log('oripassword : '+oripassword);

	$.ajax({
		type:'get',
		url:'pwcheck.ajax',
		data:{'oripassword':oripassword},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == oripassword){
				alert('비밀번호가 일치합니다');
				console.log(data);
			}else{
				alert('비밀번호가 일치하지 않습니다');
			}
			},
		error:function(e){
				
				console.log(e);
			}
			});
});

</script>
</html>