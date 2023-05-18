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
		<h2 style="color: #708090;">물품별 카테고리명 수정</h2>
		<hr style="border-top-width:2px; border-color:#b0cbd6;">					
		
		<!-- 검색 -->

    

    
   <!-- 표 -->
<form action="ad.goodsupdate.do" method="post" onsubmit="return submitForm()">
	<table class="mokrok">
	  <tr>
	    <th>업종 카테고리</th>
	    <th>
	   		${dto.biz_name}
	   		<input type = "text" name="biz_name" value="${dto.biz_name}" hidden/>
	    </th>
	  </tr>
	  <tr>
	    <th>물품별 기호</th>
	   	<th>
	   		${dto.goods_id}
	   		<input type = "text" name="goods_id" value="${dto.goods_id}" hidden/>
	    </th>
	   </tr>
	   <tr>
	    <th>
	      <input type="text" name="goods_name" oninput="checkCateName()" value="${dto.goods_name}"/>
	      <span id="nameLengthInfo"></span>
	    </th>
	  </tr>
	  <tr>
	    <th colspan="4">
	      <button type="submit">수정하기</button>
	      <button type="button" onclick="history.back()">닫기</button>
	    </th>
	  </tr>
	</table>
	</form>	
	</article>

</body>
<script>

var isDuplicateChecked = false; // 중복 체크 여부를 저장하는 변수


function checkCateName() {
  var cateNameInput = document.getElementsByName('cate_name')[0].value;
  if (cateNameInput.length > 10) {
    alert('별점항목명은 최대 10글자까지만 입력할 수 있습니다.');
    return false; // 폼 제출을 막기 위해 false 반환
  }
  return true; // 폼 제출을 허용하기 위해 true 반환
}


</script>



  



</html>