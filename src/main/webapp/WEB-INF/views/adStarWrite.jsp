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
		<h2 style="color: #708090;">별점 등록</h2>
		<hr style="border-top-width:2px; border-color:#b0cbd6;">					
		
		<!-- 검색 -->

    

    
   <!-- 표 -->
<form action="ad.starwrite.do" method="post" onsubmit="return submitForm()">
	<table class="mokrok">
	  <tr>
	    <th>구분기호</th>
	    <th>
	      <input type="text" name="cate_no"/>
	      <button type="button" class="input_no" onclick="checkDuplicate()">중복체크</button>
	    </th>
	  </tr>
	  <tr>
	    <th>별점항목명</th>
	    <th>
	      <input type="text" name="cate_name" class="input_cate" oninput="checkCateName()" />
	      <span id="nameLengthInfo"></span>
	    </th>
	  </tr>
	  <tr>
	    <th colspan="4">
	      <button type="submit">완료</button>
	      <button type="button" onclick="history.back()">닫기</button>
	    </th>
	  </tr>
	</table>
	</form>	
	</article>

</body>

<script>

var isDuplicateChecked = false; // 중복 체크 여부를 저장하는 변수

var msg = "${msg}"
if(msg != ""){
	alert(msg);
}
  

function checkCateNo() {
  var cateNoInput = document.getElementsByName('cate_no')[0].value;
  if (!/^star\d+$/.test(cateNoInput)) {
    alert('구분기호에는 "star"와 숫자만 입력할 수 있습니다.');
    return false; // 폼 제출을 막기 위해 false 반환
  }
  return true; // 폼 제출을 허용하기 위해 true 반환
}

function submitForm() {
  if (!isDuplicateChecked) {
    alert('중복 체크를 먼저 해야 합니다.');
    return false; // 폼 제출을 막기 위해 false 반환
  }

  return true; // 폼 제출을 허용하기 위해 true 반환
}

function checkDuplicate() {
    var cateNoInput = document.getElementsByName('cate_no')[0].value;
    var cateNameInput = document.getElementsByName('cate_name')[0].value;

    // 중복 체크를 위한 Ajax 요청
    $.ajax({
      type: 'get',
      url: 'staroverlay.ajax',
      data: { 'cate_no': cateNoInput },
      dataType: 'json',
      success: function(data) {
        console.log(data);
        if (data.staroverlay == 0) {
          alert('사용 가능한 구분기호입니다.');
          isDuplicateChecked = true; // 중복 체크 완료 표시
        } else {
          alert('이미 사용중인 구분기호 입니다.');
          isDuplicateChecked = false; // 중복 체크 실패 표시
          $('cate_no').val('');
        }
      },
      error: function(e) {
        console.log(e);
      }
    });

    // 별점항목명 길이 체크
    if (cateNameInput.length > 10) {
      alert('별점항목명은 최대 10글자까지만 입력할 수 있습니다.');
      isDuplicateChecked = false; // 중복 체크 실패 표시
    }
    
    if (!/^star\d+$/.test(cateNoInput)) {
        alert('구분기호에는 "star"와 숫자만 입력할 수 있습니다.');
        return false; // 폼 제출을 막기 위해 false 반환
      }
      return true; // 폼 제출을 허용하기 위해 true 반환
} 
  }

	   </script>
  




  



</html>