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
	<h2 style="color: #708090;">회원 정보</h2>
		<hr style="border-top-width:2px; border-color:#b0cbd6;">
 	<table class = "mokrok">
	
			
			<tr>
				<td>아이디</td>
				<td>${user.user_id}</td>
				<td><input type="button" onclick="location.href='./user.history.go?user_id=${user.user_id}'" 
						value="히스토리"/></td>
			</tr>	
			<tr>
				<td>닉네임</td>
				<td>${user.nickname}</td>
			</tr>	
			<tr>
				<td>이름</td>
				<td>${user.post_num}</td>
			</tr>	
			<tr>
				<td>주소</td>
				<td>${user.sido}</td>
			</tr>		
			<tr>
				<td></td>
				<td>${user.sigungu}</td>
			</tr>				
			<tr>
				<td></td>
				<td>${user.left_addr}</td>
			</tr>				
					
			<tr>
				<td>전화번호</td>
				<td>${user.phone_num}</td>
			</tr>				
			<tr>
				<td>이메일</td>
				<td>${user.email}</td>
			</tr>					
			<tr>
				<td>관심업종</td>
				<td>${user.biz_name}</td>
			</tr>					
			<tr>
				<td>회원분류</td>
				<td>${user.user_div_name}</td>
				<td><input type ="button" onclick="location.href='./ad.userdetail.extra.do?user_id=${user.user_id}'"
							value="추가정보"/></td>
			</tr>	
			<tr>
				<td>회원상태</td>
				<td>${user.user_state}</td>
				<td><input type="button" onclick="location.href='./ustatechange.do?user_id=${user.user_id}'" 
							value="상태변경"/></td>
			</tr>				
			<tr>
				<td colspan="3" align="right">
					<button onclick="history.back()">닫기</button>
				</td>
			</tr>
		
	</table>

</body>
</html>