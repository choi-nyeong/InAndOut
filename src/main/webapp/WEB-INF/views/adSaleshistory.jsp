<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="realGnb.jsp"/>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.min.js"></script>
</head>
<body>
<jsp:include page="adminbox.jsp"/>
	
	<article>
		<h2 style="color: #708090;">판매글 히스토리</h2>
		<hr style="border-top-width:2px; border-color:#b0cbd6;">					
		
		<!-- 검색 -->

    

    
   <!-- 표 -->

	<table class="mokrok">
	  <tr>
	    <th>구분기호</th>
	    <th>
	   		${user.sales_no}
	    </th>
	  </tr>
	  <tr>
	    <th>별점항목명</th>
	    <th>
				${user.report_no}
	    </th>
	    
	    <th>
				${user.user_id}
	    </th>	    
	    
	    <th>
				${user.cate_no}
	    </th>	    
	    
	    <th>
				${user.report_date}
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