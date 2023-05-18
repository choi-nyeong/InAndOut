<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="adminbox.jsp"/>
<article>
	

	<h2 style="color: #708090;">회원 목록</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
		<form>
			<label for="myCheck">회원분류</label> &nbsp
      <input type="checkbox" id="myCheck" value="all" onclick="myFunction()">전체
      <input type="checkbox" id="myCheck" value="normal" onclick="myFunction()">사용자(일반)
      <input type="checkbox" id="myCheck" value="verified" onclick="myFunction()">사용자(인증)
      <input type="checkbox" id="myCheck" value="rider" onclick="myFunction()">&라이더
    </form>
    
 		<form>
 			<label>회원상태</label> &nbsp
      <label><input type="checkbox" name="user-state" value="all">전체</label>
      <label><input type="checkbox" name="user-state" value="waiting">대기</label>
      <label><input type="checkbox" name="user-state" value="normal">정상</label>
      <label><input type="checkbox" name="user-state" value="blocked">블록</label>
      <label><input type="checkbox" name="user-state" value="withdrawn">탈퇴</label>
    </form>  
    
    <form>
      <label for="search-word">검색어:</label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="id">아이디</option>
        <option value="nickname">닉네임</option>
      </select>
      <input type="text" id="search-word" name="search-word">
      <input type="submit" value="검색">
    </form>
		<table class = "mokrok">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>회원분류</th>
				<th>회원상태</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="list">
			<c:forEach items="${userlist}" var="user" varStatus="status">
      <tr>
      	<td>${status.count}</td>
        <td>${user.user_id}</td>
        <td>${user.nickname}</td>
        <td>${user.user_div_name}</td>
        <td>${user.user_state}</td>
				<td><a href="ad.userdetail.do?user_id=${user.user_id}">정보보기</a></td>
       </tr>
        </c:forEach>

  </tbody>
	
	</table>


</article>

<script>

</script>
</body>



</html>