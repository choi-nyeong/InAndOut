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
<jsp:include page="adModal.jsp"/>
<article>
<h2 style="color: #708090;">신고 판매글 상세보기</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
 	<table class = "mokrok">
	

			<tr>
				<td>신고자</td>
				<td>${dto.user_id}</td>
			</tr>	
			<tr>
				<td>신고된 번호</td>
				<td>${dto.report_whom}</td>
			</tr>	
			<tr>
				<td>블라인드 상태</td>
				<td><c:if test="${dto.blind}">블라인드</c:if><c:if test="${!dto.blind}">정상</c:if></td>
			</tr>	
			<tr>
				<td>처리 상태</td>
			<td>${dto.report_state}</td>
			</tr>	
			<tr>
				<td>신고일자</td>
				<td>${dto.report_date}</td>
			</tr>	
			<tr>
				<td>신고사유</td>
				<td>${dto.report_reason}</td>

			</tr>			
			<tr>
				<td colspan="3" align="right">
					<button onclick="location.href='salesreportlist.do'">닫기</button>
				</td>
			</tr>
	
				<button id="sMyBtn" >처리</button>
			<button id="sYourBtn" >반려</button>
			
			<div id="sMyModal" class="modal">
			  <div class="modal-content">
			  	<form action="ad.sblind.do" method = "post">
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>처리자 ${loginId}</h2>
			      <input type = "text" name="report_id" id="report_id" value="${dto.report_id}" hidden/>
			
			    </div>
			    <div class="modal-body">
						<input type = "text" name="report_no" id="report_no" value="${dto.report_no}" hidden/>
			    	<p>처리사유</p>
			      <p><textarea name="report_content">${dto.report_content}</textarea></p>
			
			    </div>
			    <div class="modal-footer">
					 <button id="updateBtn" type="submit" class="btn btn-success">완료</button>
			    </div>
			  </div>
				</form>
			</div>	
			
			<div id="sYourModal" class="modal">
			  <div class="modal-content">
			  	<form action="ad.sblind.go" method = "post">
			    <div class="modal-header">
			      <span class="close">&times;</span>

			      <h2>처리자 ${loginId}</h2>
			      <input type = "text" name="report_id" value="${loginId}" hidden/>
			    </div>
			    <div class="modal-body">
						<input type = "text" name="report_no" value="${dto.report_no}" hidden/>
			    	<p>처리사유</p>
			      <p><textarea name="report_content">${dto.report_content}</textarea></p>
			
			    </div>
			    <div class="modal-footer">
					 <button id="updateBtn" type="submit" class="btn btn-success">완료</button>
			    </div>
			  </div>
				</form>
			</div>			
		
	</table>	
	
</article>
		<script>

		
		// Get the modal
		var smodal = document.getElementById("sMyModal");
		var symodal = document.getElementById("sYourModal");
		// Get the button that opens the modal
		var sbtn = document.getElementById("sMyBtn");
		var sybtn = document.getElementById("sYourBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		sybtn.onclick = function() {
		  symodal.style.display = "block";
		}		
		sbtn.onclick = function() {
		  smodal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal	
		  span.onclick = function() {
		    smodal.style.display = "none";
		    symodal.style.display = "none";
		  }
	  
	  window.onclick = function(event) {
	    if (event.target == smodal || event.target == symodal) {
	      smodal.style.display = "none";
	      symodal.style.display = "none";
	    }
		}
	 
    </script>	
</body>
</html>