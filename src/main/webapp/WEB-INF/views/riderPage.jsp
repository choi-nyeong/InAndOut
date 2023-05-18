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
	<header>
	  <nav id="nav">
	   <a href="riderPage" style="color:skyblue; text-decoration: underline;">프로필</a>
	   <a href="riderSetting.go">회원정보수정</a>
	  </nav>
	</header>
	<article id="article">
		<div id="runtime" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			영업시간<h5 style="display:inline;">&nbsp;&nbsp;${extra.store_time}</h5></h4>
		</div>
		<div id="location" style="float:left;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			위치<h5 style="display:inline;">&nbsp;&nbsp;${dto.sido}&nbsp;${dto.sigungu}</h5></h4>
		</div>
		<div id="intro" style="float:left;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			소개<h5 style="display:inline;">&nbsp;&nbsp;${extra.intro}</h5></h4>
		</div>
		<div id="news" style="float:left;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			소식<h5 style="display:inline;">&nbsp;&nbsp;${extra.news}</h5></h4>
		</div>
	</article>
	
	<input class=updatebutton type="button" onclick="location.href='./riderUpdate.go?user_id=${dto.user_id}'" value="수정하기"/>
	
	<hr style="align: right; border:1px solid #878787; margin: 33% 0 0 25%; width: 60% !important;"/>
	
			
				<div id="star001">
				<h2 style="color: skyblue; display:block;">내 리뷰 통계</h2>
				<h5 style="display:inline;">물품 상태 좋아요</h5>
				<c:choose>
        	<c:when test="${star001 eq 1}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star001 eq 2}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star001 eq 3}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star001 eq 4}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/><img src="resources/img/dolphin4.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star001 eq 5}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/><img src="resources/img/dolphin4.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin5.png" style="width: 35px;"/>
        	</c:when>
        </c:choose>  
	      </div>
	      
      <div id="star002">
      <h5 style="display:inline;">시간 잘 지켜요&nbsp;&nbsp;</h5>
			<c:choose>
        	<c:when test="${star002 eq 1}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star002 eq 2}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star002 eq 3}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star002 eq 4}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/><img src="resources/img/dolphin4.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star002 eq 5}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/><img src="resources/img/dolphin4.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin5.png" style="width: 35px;"/>
        	</c:when>
        </c:choose>  
      </div>
      <div id="star003">
      <h5 style="display:inline;">친절해요</h5>
			<c:choose>
        	<c:when test="${star003 eq 1}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star003 eq 2}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star003 eq 3}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star003 eq 4}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/><img src="resources/img/dolphin4.png" style="width: 35px;"/>
        	</c:when>
        	<c:when test="${star003 eq 5}">
        	<img src="resources/img/dolphin1.png" style="width: 35px;"/><img src="resources/img/dolphin2.png" style="width: 35px;"/>
        	<img src="resources/img/dolphin3.png" style="width: 35px;"/><img src="resources/img/dolphin4.png" style="width: 35px;"/><img src="resources/img/dolphin5.png" style="width: 35px;"/>
        	</c:when>
        </c:choose>  
      </div>
			

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
</head>
</html>