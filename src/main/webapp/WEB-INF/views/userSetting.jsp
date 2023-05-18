<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="resources/css/home.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100&display=swap');
    </style>
    <body>
<jsp:include page="realGnb.jsp"/>
 </head>

<input type="hidden" name="user_id" value="${riderSetting.user_id}"/>
<input type="hidden" name="user_pw" value="${riderSetting.user_pw}"/>
	<header>
	  <nav id="nav" style="position: fixed;">
	   <a href="myPage.go">모아보기</a>
	   <a href="mySales.go">판매글</a>
	   <a href="myGallery.go">갤러리</a>
	   <a href="mySalesJjim.go">관심판매글</a>
	   <a href="myGalleryJjim.go">찜한갤러리</a>
	   <a href="userAuth.go" style="color:skyblue; text-decoration: underline;">설정</a>
	   
	   
	  </nav>
	  	<nav id="userauth" style="position: fixed;">
		<a href="userAuth.go" style="color:skyblue; text-decoration: underline;">회원정보수정</a>
		<a href="userBiz.go">인증판매자등록</a>
		</nav>
	</header>
	<form action="userSetting.do" method="post" enctype="multipart/form-data" onsubmit="return join()" >
	<h2 id="rdupdate" style="color: skyblue; display:block;">회원정보 수정</h2>
	<div id="rdidupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 아이디&nbsp;&nbsp;<input type="text" name="user_id" id="user_id" value="${riderSetting.user_id}" readonly/></h4>
	</div>
	<div id="rdnnupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 닉네임&nbsp;&nbsp;<input type="text" id="nickname" name="nickname" value="${riderSetting.nickname}"/>
			<button type="button" id="overlay3" class="test_btn1">중복체크</button>
			</h4>
	</div>
		<div id="rdpwupdate" style="float:left; margin-right:10px;">
				<h4 style="font-size:15px; color: skyblue; display:inline;">
				* 비밀번호&nbsp;&nbsp;
				<input type="password" name="newpassword" id="newpassword" size=24 placeholder="새 비밀번호 혹은 현재 비밀번호">
				</h4>
		</div>
		<div id="rdpwupdatecheck" style="float:left; margin-right:10px;">
				<h4 style="font-size:15px; color: skyblue; display:inline;">
				* 비밀번호 확인&nbsp;&nbsp;
				<input type="password" name="confirm_password" id="confirm_password" placeholder="비밀번호 확인">
				<span id="msg"></span>
				</h4>
		</div>
		
		<div id="rdaddrupdate" style="float:left; margin-right:10px;">
				
			<h4 style="font-size:15px; color: skyblue; display:inline;">* 주소 </h4>
			
			
			<!-- <input type="text" name="post_num" id="post_num"/>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    new daum.Postcode({
				        oncomplete: function(data) {
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
				        }
				    }).open();
				</script> -->
				<input type="text" id="sample6_postcode" name="post_num" placeholder="우편번호" value="${riderSetting.post_num}">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="findPost"><br>
				
			
		
		
		<input type="text" id="sample6_address" placeholder="주소" name="left_addr" value="${riderSetting.sido}&nbsp;${riderSetting.sigungu}&nbsp;${riderSetting.left_addr}" size=30><br>
		
		
		
		
		
			<h4 style="font-size:15px; color: skyblue; display:inline;">* 상세주소 </h4>
			
			<!-- <input type="text" name="left_addr" id="left_addr"/> -->
			<input type="text" id="sample6_detailAddress"  placeholder="상세주소">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			<input type="hidden" id="sido" name="sido">
			<input type="hidden" id="sigungu" name="sigungu">
			
		
		</div>

	<div id="rdemailupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 이메일&nbsp;&nbsp;<input type="text" name="email" id="email" value="${riderSetting.email}" size=10/>
			&nbsp;@&nbsp;
			<select name="emailaddr">
			<option value="naver.com" selected="selected">naver.com</option>
 			<option value="nate.com">nate.com</option>
  		<option value="gmail.com">gmail.com</option>
  		</select></h4>
	</div>
	<div id="rdphupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			* 전화번호&nbsp;&nbsp;<input type="text" name="phone_num" id="phone_num" value="${riderSetting.phone_num}"/></h4>
	</div>
	<div id="rdinterestupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			관심업종&nbsp;&nbsp;</h4>
			<select name="interest_biz_id" id="interest_biz_id" class="interest_biz_id">
			<option name="interest_biz_id" value=".">==선택==</option>
				    <option name="interest_biz_id" value="b001">카페</option>
				    <option name="interest_biz_id" value="b002">음식점</option>
				    <option name="interest_biz_id" value="b003">여가오락</option>
				    <option name="interest_biz_id" value="b004">교육</option>
				    <option name="interest_biz_id" value="b005">운동</option>
				    <option name="interest_biz_id" value="b006">미용</option>
				    <option name="interest_biz_id" value="b007">숙박업</option>
				    <option name="interest_biz_id" value="b008">반려동물</option>
				    <option name="interest_biz_id" value="b009">세탁업</option>
				    <option name="interest_biz_id" value="b010">도소매</option>
				    <option name="interest_biz_id" value="b011">기타</option>
  		</select>
	</div>
	<div id="rdphotoupdate" style="float:left; margin-right:10px;">
			<h4 style="font-size:15px; color: skyblue; display:inline;">
			프로필 사진&nbsp;&nbsp;</h4>
	<c:if test="${new_photo_name eq null}">
					<img src="resources/photo/프로필 기본.png">
					<input type="file" name="photo" />
				</c:if>
				<c:if test="${new_photo_name ne null}">
					<img src="/photo/${new_photo_name}" style="width: 130px;"/>
					<input type="file" name="photo" />
				</c:if>
	</div>
	
	<div>
	<input  id="riderupdatebutton3" type="button" onclick="location.href='./myPage.go?user_id=${riderSetting.user_id}'" value="돌아가기"/>
	<button id="riderupdatebutton4" type="submit" onclick="join()">저장</button>
	</div>
</form>
	
	<hr>
<div class="main-box">
        <div class="profile-box">
        <c:if test="${new_photo_name eq null}">
        	<img src="resources/photo/프로필 기본.png" width="150px">
        </c:if>
        <img src="/photo/${new_photo_name}" width="150px">
            <div class="title-nickname">
            <h2>${dto.nickname}</h2>
            </div>
        </div>
        <div class="content">
        <c:choose>
        	<c:when test="${avg eq 1}">
        	<img src="resources/img/dolphin1.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 2}">
        	<img src="resources/img/dolphin2.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 3}">
        	<img src="resources/img/dolphin3.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 4}">
        	<img src="resources/img/dolphin4.png" style="width: 60px;"/>
        	</c:when>
        	<c:when test="${avg eq 5}">
        	<img src="resources/img/dolphin5.png" style="width: 60px;"/>
        	</c:when>
        </c:choose>        
        </div>
            <div id="avgdolphin">&nbsp;&nbsp;나의 &돌핀 단계 : ${avg}단계&nbsp;&nbsp;</div>
            <hr>
            <div class="parent">
		        <div class="pfirst">판매글</div>
		        <div class="psecond">갤러리</div>
		        <div class="pthird">나의 관심</div>
		    		</div>
		    		<div class="child">
		        <div class="cfirst">${countsales}</div>
		        <div class="csecond">${countgallery}</div>
		        <div class="cthird">${countinterest}</div>
        		</div>

        </div>
</body>
<!--다음 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
var msg = "${msg}";
if(msg !=""){
	 	alert(msg);
	 
}
function join(){     
    var $user_id = $('#user_id');
    var $newpassword = $('#newpassword');
    var $confirm_password = $('#confirm_password');
    var $nickname = $('#nickname');
    var $post_num = $('#sample6_postcode');
    var $phone_num = $('#phone_num');
    var $email = $('#email');
    var $interest_biz_id = $("#interest_biz_id option:selected").val();
    var $sigungu = $("#sigungu");
    var $sido = $("#sido");
    var $left_addr = $("#left_addr");
    var pweq = false;
    
    console.log($interest_biz_id);
    
    if($newpassword.val().length == 0){
        alert('비밀번호를 입력해 주세요!');
        console.log("1");   
        $newpassword.focus();
        return false;
    }else if($confirm_password.val() == ''){
        alert('비밀번호 확인을 해주세요!');
        $confirm_password.focus();
        console.log("2");
        return false;
    }else if($nickname.val() == ''){
        alert('닉네임을 입력해 주세요!');
        $nickname.focus();
        console.log("3");
        return false;
    }else if($post_num.val() == null){
        alert('우편번호를 입력해 주세요!');
        console.log("4");
        return false;
    }else if($phone_num.val() == null){
        alert('전화번호를 입력해 주세요!');
        console.log("5");
        return false;
    }else if($email.val() == ''){
        alert('이메일 입력해 주세요!');
        $email.focus();
        console.log("6");
        return false;
    }else if($interest_biz_id.val() == '.'){
        alert('관심업종을 선택해 주세요!');
        console.log("7");
        return false;
    }else{
        var overlayChk = true;
        var param = {};
        param.interest_biz_id = $interest_biz_id;
        param.newpassword = $newpassword.val();
        param.confirm_password = $confirm_password.val();
        param.nickname = $nickname.val();
        param.post_num = $post_num.val();
        param.phone_num = $phone_num.val();
        param.email = $email.val();
        
        console.log(param);
        
    }}


$('#confirm_password').on('keyup',function(e){
    console.log('confirm_password: '+$('#confirm_password').val());
    console.log('newpassword: '+$('#newpassword').val());
     if($('#newpassword').val() == $(this).val()){
        $('#msg').css({'font-size': '10px', 'color': 'darkgreen'});
        $('#msg').html('비밀번호가 일치 합니다.');
        var pweq = true;
     }else{
        $('#msg').css({'font-size': '10px', 'color': 'red'});
        $('#msg').html('비밀번호가 일치 하지 않습니다.');
     }   
  });
if(pweq && overlayChk){
    alert('회원정보 수정이 완료되었습니다');
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
                  
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
          //승범형커스텀 ㅠㅠ 감사해요 
            document.getElementById("sido").value = data.sido;
            document.getElementById("sigungu").value = data.sigungu;  
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}



</script>
</html>