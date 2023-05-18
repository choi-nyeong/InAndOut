<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	.main-box{
		border: 1px solid black;
		width: 40%;
		border-radius: 10px;
		margin-bottom: 10px;
		margin-left: 10px;
	}
	.button-box{
	}
	#m{
		display: inline-block;
	}
	.tag_top{
		margin-left: 10px;
	}
	img{
		border-radius: 10px;	
	}
</style>
</head>
<body>

	<jsp:include page="realGnb.jsp"/>
	
	<h2 class="tag_top">총 <div id="m"></div> 건의 배송 이력이 필터링되었습니다.</h2>
	<select class="dv-list" id="dv-ln" onchange="myfunction(this)">
		<option value="배송접수">배송접수</option>
		<option value="배송중">배송중</option>
		<option value="배송완료" selected>배송완료</option>
		<option value="배송실패">배송실패</option>
	</select>
	<c:forEach items="${deliveryHistory}" var="dh">
	
		<div class="main-box">
			<div>
				<c:if test="${dh.new_photo_name eq null}">
					<img  width="50" src="resources/photo/프로필 기본.png"/>${dh.nickname}&nbsp;님
				</c:if>
				<c:if test="${dh.new_photo_name ne null}">
					<img  width="50" src="resources/photo/${dh.new_photo_name}"/>${dh.nickname}&nbsp;님
				</c:if>
			</div>
			
			<div>${dh.subject}</div>
			<div>배송번호 : ${dh.delivery_accept_no}</div>
		
			<div>배송지 ${dh.to_addr}</div>
			<div>배송완료시간 ${dh.delivery_time}</div>
			
			<div>${dh.delivery_state}</div>
		</div>
	 </c:forEach>
</body>
<script>

	var cnt = document.getElementsByClassName("main-box").length;
	document.getElementById( "m" ).innerText = cnt;
	console.log(cnt);
	
</script>
</html>