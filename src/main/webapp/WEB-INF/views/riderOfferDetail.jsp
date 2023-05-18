<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제한 상세보기</title>
<jsp:include page="realGnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.main-box{
		border : 1px solid skyblue;
		width: 40%;
		border-radius: 10px;
		margin-left: 10px;
		margin-top: 10px;
		padding-bottom: 5%;
	}
	.Xbutton{
		float: right;
		padding-right:5px;
		padding-top:5px;
	}
	.left-box{	
		float: left;
		padding-right : 10px;
		padding-left:10px;
	}
	.right-box{
		margin-left: 200px; 
		margin-bottom: 10px;
	}
	.button-box{
		margin-top: 30px;
		margin-left: 40%;
		padding-bottom: 10px;
	}
	img.imgP{
		border-radius: 10px;
	}
	img.imgS{
	}
	span.star_name{
		font-size: 1px;
	}
</style>
</head>
<body>

	
	
	<div class="main-box">
	
		<div class="Xbutton"> 
		<a onclick="location.href='riderOffer.go'">
			<img width="20" src="resources/photo/1683523045633.png"/>
		</a>
	</div>
		<div class="profile-box" style=color:skyblue;>
			<c:if test="${dto.new_photo_name eq null}">
				<img class="imgP" width="50" src="resources/photo/프로필 기본.png"/>${dto.nickname}&nbsp;판매자님
			</c:if>
			<c:if test="${dto.new_photo_name ne null}">
				<img class="imgP" width="50" src="resources/photo/${dto.new_photo_name}"/>${dto.nickname}&nbsp;판매자님
			</c:if>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;
				<c:choose>
				  <c:when test="${dto.star_score eq 0}">
	              	<img src="resources/img/dolphin0.png" style="width: 30px;"/>
	              	<span class="star_name">(별점평균(${dto.star_score}))</span>
	              </c:when>
	              <c:when test="${dto.star_score eq 1}">
	              	<img src="resources/img/dolphin1.png" style="width: 30px;"/>
	              	<span class="star_name">(별점평균(${dto.star_score}))</span>
	              </c:when>
	              <c:when test="${dto.star_score eq 2}">
	              	<img src="resources/img/dolphin1.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin2.png" style="width: 30px;"/>
	              	<span class="star_name">(별점평균(${dto.star_score}))</span>
	              </c:when>
	              <c:when test="${dto.star_score eq 3}">
	              	<img src="resources/img/dolphin1.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin2.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin3.png" style="width: 30px;"/>
	              	<span class="star_name">(별점평균(${dto.star_score}))</span>
	              </c:when>
	              <c:when test="${dto.star_score eq 4}">
	              	<img src="resources/img/dolphin1.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin2.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin3.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin4.png" style="width: 30px;"/>
	              	<span class="star_name">(별점평균(${dto.star_score}))</span>
	              </c:when>
	              <c:when test="${dto.star_score eq 5}">
	              	<img src="resources/img/dolphin1.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin2.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin3.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin4.png" style="width: 30px;"/>
	              	<img src="resources/img/dolphin5.png" style="width: 30px;"/>
	              	<span class="star_name">(별점평균(${dto.star_score}))</span>
	              </c:when>
           </c:choose>
	        </span>
			<div><button onclick="location.href='chat.go'">채팅 보내기</button></div>
			<hr>
		</div>
			
			<div class="left-box" style="color:skyblue;">
			<div> 품목명 : ${dto.subject}</div>
			<div>카테고리 : ${dto.biz_name} > ${dto.goods_name}</div>
			<div>판매내용 : ${dto.content}</div>
			
			<div>
				<c:if test="${dto.new_photo_name eq null}">
					<img class="imgS" width="150" src="resources/img/defaultIMG.png"/> <!-- defaultIMG.png  -->
				</c:if>
				<c:if test="${dto.new_photo_name ne null}">
					<img class="imgS" width="150" src="resources/photo/${dto.new_photo_name}"/>
				</c:if>
			</div>
		</div> 
		
		<div class="right-box" style="color:skyblue;">
			<div>배송제안번호 : ${dto.delivery_offer_no}</div>
			<div>제안일자 : ${dto.offer_date}</div>
			<div>인수희망주소 : ${dto.from_addr}</div>
			<div>인도희망주소 : ${dto.to_addr}</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</div>	
			
		<div class="button-box">
			<button onclick="location.href='deliveryState.do?idx=${dto.delivery_offer_no}'">승인</button>	
			<button onclick="location.href='deliveryNone.do?idx=${dto.delivery_offer_no}'">거절</button>
		</div>
	</div>
</body>
<script>

</script>
</html>