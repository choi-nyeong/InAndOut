<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="realGnb.jsp"/>
<meta charset="UTF-8">
</head>
<script>
function confirmSubmit() {
	var r= confirm("정말로 회원 상태를 변경하시겠습니까?");
    if (r == true) {
      return true;  
    	
    } else {
        return false; // 폼 제출 막기
    }
} 


</script>
<body>
<jsp:include page="adminbox.jsp"/>

<article>
<h2 style="color: #708090;">회원 상태변경</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
	<form action="ad.updateUserState" id="myForm" method="post" onsubmit ="return confirmSubmit()">
	<table class = "mokrok">

			<tr>
				<td>아이디</td>
				<td>${user.user_id}
  			<input type="text" name="user_id" value="${user.user_id}" hidden></td>
			</tr>	
			<tr>
				<td>처리자</td>
				<td>	${loginId} <!-- session -->
  			<input type="text" name="admin_id" value="${loginId}" hidden> </td>
			</tr>					
			<tr>
				<td>회원상태</td>
				<td>
				<input type="radio" id="radioValueNormal" name="user_state" value="정상" ${user.user_state eq '정상' ? 'checked' : ''}> 정상
				<input type="radio" id="radioValueBlocked" name="user_state" value="블록" ${user.user_state eq '블록' ? 'checked' : ''}> 블록

				</td>
				
			</tr>									
			
			<tr>
				<td>처리사유</td>
				<td><textarea name="user_content">${user.user_content}</textarea></td>
			</tr>					
				

			<tr>
			 	<th colspan="6">
			 		<button type="submit" onclick="confirmSubmit()">완료</button>
			 		<button type="button" onclick="history.back()">닫기</button>
			 	</th>
				
			
			</tr>
		
	</table>	
</form>
		
</article>	


	
</body>
</html>