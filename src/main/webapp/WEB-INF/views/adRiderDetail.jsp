<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="realGnb.jsp"/>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="adminbox.jsp"/>
<article>

	<h2 style="color: #708090;">&라이더 회원 신청 정보</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
	
		<table class = "mokrok">
			<tr>
				<td>아이디</td>
				<td>${rider.user_id}</td>
			</tr>	
			<tr>
				<td>닉네임</td>
				<td>${rider.nickname}</td>
			</tr>	
			<tr>
				<td>이름</td>
				<td>${rider.post_num}</td>
			</tr>	
			<tr>
				<td>주소</td>
				<td>${rider.sido}</td>
			</tr>		
			<tr>
				<td>주소</td>
				<td>${rider.sigungu}</td>
			</tr>				
			<tr>
				<td>주소</td>
				<td>${rider.left_addr}</td>
			</tr>				
					
			<tr>
				<td>전화번호</td>
				<td>${rider.phone_num}</td>
			</tr>				
			<tr>
				<td>이메일</td>
				<td>${rider.email}</td>
			</tr>									
			<tr>
				<td>회원분류</td>
				<td>${rider.user_div_name}</td>
			</tr>	
			<tr>
				<td>회원상태</td>
				<td>${rider.user_state}
										<td><input type ="button" onclick="location.href='./ad.riderdetail.extra.do?user_id=${rider.user_id}'"
							value="추가정보"/></td>
				</td>
			</tr>				
			<tr>
				<td colspan="3" align="right">
					<button onclick="history.back()">닫기</button>
				</td>
			</tr>
		
	</table></article>
<script>
</script>

</body>



</html>