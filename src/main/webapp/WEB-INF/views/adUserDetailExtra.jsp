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
<jsp:include page="adModal.jsp"/>
<jsp:include page="adminbox.jsp"/>
<article>
<h2 style="color: #708090;">회원 추가 정보</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
 	<table class = "mokrok">
	
			
			<tr>
				<td>아이디</td>
				<td>${user.user_id}</td>
			</tr>	
			<tr>
				<td>닉네임</td>
				<td>${user.nickname}</td>
			</tr>								
			<tr>
				<td>회원분류</td>
				<td>${user.user_div_name}</td>

			</tr>	
				<tr>
				<td>상호명</td>
				<td>${user.store_name}</td>
			</tr>		
			<tr>
				<td>사업자등록번호</td>
				<td>${user.biz_num}</td>
			</tr>			
			<tr>
				<td>업종</td>
				<td>${user.biz}</td>
			</tr>					
			<tr>
				<td>인증상태</td>
				<td>${user.state}</td>
				<td>
				<button id="myBtn" onclick ="">인증변경</button>

				</td>
				
			</tr>	
			<div id="myModal" class="modal">
		  <div class="modal-content">
			  	<form action="history_userstate.do" method = "post">
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>처리자 ${loginId}</h2> <!-- 세션체크해서 로그인 한 놈 출력 -->
			      <input type = "text" name="admin_id" value="${loginId}" hidden/>
			    </div>
			    <div class="modal-body">
						<h2>사용자 ${user.user_id}</h2>
				   		<input type = "text" name="user_id" value="${user.user_id}" hidden/>
				   		<input type = "text" name="user_state" value="${user.user_state}"hidden/>
			    	<p>처리사유</p>
			      <p><textarea name="user_content">${user.user_content}</textarea></p>
			
			    </div>
			    <div class="modal-footer">
					 <button onclick="changeuser" id="updateBtn" type="submit" class="btn btn-success">완료</button>
			    </div>
				</form>
			  </div>
			</div>				
			
			
			
			
			<tr>
				<td>사업자등록증</td>
				<td><img width="500" src="/photo/${user.new_photo_name}"/></td>
			</tr>			
			<tr>
				<td colspan="3" align="right">
					<button onclick="location.href='./ad.userlist.do'">닫기</button>
				</td>
			</tr>
		
	</table>	
	</article>
	</body>
		<script>


		
		// Get the modal
		var modal = document.getElementById("myModal");
		
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
	

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 

		btn.onclick = function() {
		  modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal	
		span.onclick = function() {
		  modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
		
    </script>	
</html>