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
<h2 style="color: #708090;">회원 히스토리 상세보기</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
	<table class = "mokrok">
			<tr>
				<td>아이디</td>
				<td>${dto.user_id}</td>

			</tr>	
			<tr>
				<td>닉네임</td>
				<td>${dto.nickname}</td>
			</tr>	
			<tr>
				<td>회원상태</td>
				<td>${dto.state_time}</td>
			</tr>	
			<tr>
				<td>처리자</td>
				<td>${dto.admin_id}</td>
			</tr>				
				<tr>
				<td>처리내용</td>
				<td>${dto.user_content}</td>
			</tr>			
		
			<tr>
				<td colspan="3" align="right">
					<button onclick="history.back()">닫기</button>
				</td>
			</tr>
		
	</table>
	
	
</article>
</body>
</html>