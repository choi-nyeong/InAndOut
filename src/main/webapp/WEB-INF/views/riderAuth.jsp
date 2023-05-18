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

<form action="riderAuth.do" method="post">
<input type="hidden" name="user_id" value="${riderSetting.user_id}"/>
<input type="hidden" name="user_pw" value="${riderSetting.user_pw}"/>
	<header>
	  <nav id="nav">
	   <a href="riderPage" >프로필</a>
	   <a href="riderSetting.do" style="color:skyblue; text-decoration: underline;">회원정보수정</a>
	  </nav>
	</header>
	<h2 id="rdupdate" style="color: skyblue; display:block;">비밀번호 인증</h2>
	
	<div style="float:left; margin-right:10px;">
				<h6 id="riderAuth" style="font-size:15px; color: gray; display:inline;">
				현재 비밀번호를 입력해주세요&nbsp;&nbsp;</h6>
				<input type="password" name="oripassword" id="oripassword">
				
		</div>
		
	<div>
	<input id="pwcheck1"type="button" onclick="location.href='./riderPage'" value="돌아가기"/>
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
        <div class="content2">
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
            <div class="parent">
		        <div class="pfirst">제안요청</div>
		        <div class="pthird">배송 진행</div>
		    		</div>
		    <div class="child">
		        <div class="cfirst">${rideroffer}</div>
		        <div class="cthird">${riderdelivery}</div>
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