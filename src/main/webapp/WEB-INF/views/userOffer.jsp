<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 제한 요청</title>
<jsp:include page="realGnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.main-box{
  border: 1px solid skyblue;
  width: 40%;
  border-radius: 10px;
  margin-left: 10px;
  margin-top: 10px;
  padding-bottom: 2%;
  color: skyblue;
}

hr {
  color: skyblue;
}

.Xbutton {
  float: right;
  padding-right: 5px;
  padding-top: 5px;
}

.left-box {
  float: left;
  padding-top: 15px;
  padding-left: 20px;
}

.right-box {
  margin-left: 200px;
  padding-top: 10px;
}

.button-box {
  margin-top: 160px;
  margin-left: 300px;
}

.hide-btn,.recognize  {
	background-color: lightgray;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	color: white;
}
img.imgP {
  border-radius: 10px;
}

img.imgS {}

span.star_name {
  font-size: 1px;
}

div.profile-box {
  padding-top: 5px;
  padding-left: 10px;
}
</style>
</head>
<body>

	

	<form action="write.do"> 
		<div class="main-box">
			<div class="Xbutton"> 
				<a onclick="location.href='riderList.go'">
					<img width="20" src="resources/photo/1683523045633.png"/>
				</a>
			</div>
				<div class="profile-box" >
					<c:if test="${dto.new_photo_name eq null}">
						<img class="imgP"  width="50" src="resources/photo/프로필 기본.png"/>${dto.nickname}&nbsp;라이더님 
					</c:if>
					<c:if test="${dto.new_photo_name ne null}">
						<img class="imgP" width="50" src="resources/photo/${dto.new_photo_name}"/>${dto.nickname}&nbsp;라이더님 
					</c:if>
				<span class="star">&nbsp;&nbsp;&nbsp;&nbsp;
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
					<hr style=color:skyblue;>
				</div>

			<div class="left-box">			
				<div>판매번호 : <span>${dtoS.sales_no}</span></div>
				<div>카테고리 : ${dtoS.biz_name} > ${dtoS.goods_name}</div>
				<div>판매내용 : ${dtoS.content}</div>
				<div>
					<c:if test="${dto.new_photo_name eq null}">
						<img class="imgS"  width="150" src="resources/img/defaultIMG.png"/> <!-- defaultIMG.png  -->
					</c:if>
					<c:if test="${dto.new_photo_name ne null}">
						<img class="imgS" width="150" src="resources/photo/${dto.new_photo_name}"/>
					</c:if>
				</div>
			</div> 
				
				<div class="right-box">
					<div>인수희망주소
						<span>
							<textarea name="from_addr" >${dtoS.from_addr}</textarea>			<!-- insert from_addr  -->
						</span>	
					</div>																	
					<div>인도희망주소
						<span>
							<textarea name="to_addr"></textarea>											<!-- insert to_addr  -->
						</span>	
					</div>								
				</div>
			<input style="display:none" name="user_div" value="${dto.user_div}"/>	<!-- insert id rider_id -->	
			<input style="display:none" name="rider_id" value="${dto.user_id}"/>		<!-- insert id rider_id -->
			<input style="display:none" name="user_id" value="${dtoS.user_id}"/>		<!-- insert id rider_id -->
			<input style="display:none" name="sales_no" value="${dtoS.sales_no}"/>	<!-- insert id rider_id -->
			
			<div class="button-box">
				<button class="hide-btn">제안요청하기</button>
				<button class="recognize" type="button" onclick="location.href='riderList.go'">취소하기</button>
			</div>
		</div>
	</form>
</body>
<script>
</script>
</html>