<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="realGnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.min.js"></script>
</head>
<body>
<jsp:include page="adminbox.jsp"/>
	
	<article>
		<h2 style="color: #708090;">갤러리 히스토리</h2>
		<hr style="border-top-width:2px; border-color:#b0cbd6;">					
		
		<!-- 검색 -->

    

    
   <!-- 표 -->

	<table class="mokrok">
	  <tr>
	    <th>구분기호</th>
	    <th>
	   		${dto.gallery_no}
	    </th>
	  </tr>
	  <tr>
	    <th>상호명</th>
	    <th>
				${dto.store_name}
	    </th>
	  </tr>
	  <tr>
	    <th colspan="4">

	      <button type="button" onclick="history.back()">닫기</button>
	    </th>
	  </tr>
	</table>

	</article>

</body>
<script>



</script>



  



</html>