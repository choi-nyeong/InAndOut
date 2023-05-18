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
<h2 style="color: #708090;">회원 히스토리</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
	

		<table class = "mokrok">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>회원상태</th>
				<th>상태시각</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="list">
			<c:forEach items="${userhistory}" var="user" varStatus="status">
      <tr>
      	<td>${status.count}</td>
        <td>${user.user_id}</td>
        <td>${user.nickname}</td>
        <td>${user.user_state}</td>
        <td>${user.state_time}</td>
				<td><a href="ad.uhistory.detail.do?user_id=${user.user_id}&state_time=${user.state_time}">
         			 상세보기
        		</a></td>
       </tr>
        </c:forEach>

  </tbody>
	
	</table>


</article>
	
	
	
</body>
</html>