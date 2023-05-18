<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/joinform.css" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">



<style>

.file-preview-container img {
  max-width: 300px;
  max-height: 255px;
}

h5{
	font-size:10px;
	color: gray;

}

</style>
<head>
<jsp:include page="joinGnb.jsp"/>

</head>

<body>


	<br>
	<br>
	<br>
	<br>
	<h2>회원가입</h2>
	<br>
	<br>
	<br>
	<br>
	<a id="essential">* 필수 기입 항목입니다.</a>
	<br>
	<br>
	
	
	<form action="userRegist.do" method="post" enctype="multipart/form-data">  
	<table>
	
	
	

		<tr>
			<th>*아이디</th>
			<td>
				<input type="text" name="user_id" id="user_id"/>
				<button type="button" id="overlay" class="test_btn1">중복체크</button>
				
			</td>
		</tr>
		<tr>
			<th></th>
			<td>
				
				<h5>아이디는 영문, 숫자를 포함한 5자 이상으로 입력해주세요.</h5>
			</td>
		</tr>
		
		<tr>
			<th>*비밀번호</th>
			<td><input type="password" name="user_pw" id="user_pw"/>
			 <span id="togglePassword" class="eye-icon far fa-eye"></span>
			</td>
			
			
		</tr>
		<tr>
			<th></th>
			<td>
				
				<h5>비밀번호는 한글을 제외한 영문, 숫자, 특수문자만 입력 가능합니다.</h5>
			</td>
		</tr>
		
		
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" name="confirm" id="confirm"/>
				<i class="fa fa-eye" id="togglePassword"></i>
				<span id="msg"></span>
			</td>
		</tr>
		
		
		<tr>
			<th>*이름</th>
			<td><input type="text" name="user_name" id="user_name"/></td>
		</tr>
		<tr>
			<th>*닉네임</th>
			<td>
				<input type="text" name="nickname" id="nickname"/>
				<button type="button" id="overlay2" class="test_btn1">중복체크</button>
			</td>
		</tr>
		
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
		<tr>
			<th>*주소</th>
			<td>
			
				<input type="text" id="sample6_postcode" name="post_num" placeholder="우편번호"  readonly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="findPost">
				
				
			
			</td>
		</tr>
		<tr>
		<td></td>
		<td><input type="text" id="sample6_address" placeholder="주소" name="left_addr" readonly><br></td>
		</tr>
		
		
		<tr>
		
			<th>상세주소</th>
			<td>
			<!-- <input type="text" name="left_addr" id="left_addr"/> -->
			<input type="text" id="sample6_detailAddress"  placeholder="상세주소" >
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly>
			<input type="hidden" id="sido" name="sido">
			<input type="hidden" id="sigungu" name="sigungu">
			</td>
		</tr>
		
		
		<tr>
			  <th>*전화번호</th>
			  <td>
			    <select name="phone_num" id="phone_num">
			      <option value="010">010</option>
			      <option value="011">011</option>
			      <option value="012">012</option>
			    </select>
			    -
			   <input name="phone_num2" type="text" id="phone_num2" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 4)">
			    -
			    <input name="phone_num3" type="text" id="phone_num3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 4)">
			  </td>
			</tr>
		<tr>
			<th>*이메일</th>
			<td><input type="text" name="email" id="email"/> 
			&nbsp; @ &nbsp; 
			<select id="url" name="url">
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="daum.com">daum.com</option>
			</select>
			</td>
		</tr>
		<input type="hidden" id="user_state" name="user_state" value="정상" />
		<tr>
			<th>*관심업종</th>
			<td>	
				<select name="interest_biz_id" id="interest_biz_id">
					 <option value=".">==선택==</option>
				    <option value="b001">카페</option>
				    <option value="b002">음식점</option>
				    <option value="b003">여가오락</option>
				    <option value="b004">교육</option>
				    <option value="b005">운동</option>
				    <option value="b006">미용</option>
				    <option value="b007">숙박업</option>
				    <option value="b008">반려동물</option>
				    <option value="b009">세탁업</option>
				    <option value="b010">도소매</option>
				    <option value="b011">기타</option>
			  	</select>
			  	
		  	</td>
		</tr>
		</table>
		
		<!--  
		<tr>
			<th colspan="2">
				<button onclick="join()">가입</button>
				<button onclick="location.href='./'">돌아가기</button>
			</th>
		</tr>
		-->
	
		<br>
	
	<br>
	<br>
	<br>
	
	<h4>추가정보</h4> <h6>더 정확한 정보를 원하시면 꼭 기입해주세요:)</h6>
	
	<hr>
	<table>
	
	
	

	
	
			<tr>
				<th>프로필 추가</th>
				<td>
	
					
					<div class="file-wrapper flie-wrapper-area">
					  <div class="float-left">
					    <span class="label-plus"><i class="fas fa-plus"></i></span>
					    <button type="button">
					    <div id="preview"><img id="preview" src="resources/photo/프로필 기본.png"/></div>
					    
					    <input type="file" name="profile" id="file1" class="upload-box upload-plus" accept="image/*">
					    <div class="file-edit-icon">
					    
					      <!-- <a href="#" class="preview-edit">수정</a> -->
					      <br>
					      <br>
					      <img href="#" class="preview-de" src="resources/photo/free-icon-cancel-8532372.png"></img>
					      </button>
					    </div>
					  </div>
					</div>
				<br>
						<h6 id="des">
							※ 프로필 사진은 10MB 용량 이하의 이미지만 첨부 가능합니다
						</h6>
				</td>
			</tr>
	
	<tr>
			<th>업종</th>
			<td>
			<select name="biz" id="biz" id="biz">
					<option value=".">==선택==</option>
				    <option value="b001">카페</option>
				    <option value="b002">음식점</option>
				    <option value="b003">여가오락</option>
				    <option value="b004">교육</option>
				    <option value="b005">운동</option>
				    <option value="b006">미용</option>
				    <option value="b007">숙박업</option>
				    <option value="b008">반려동물</option>
				    <option value="b009">세탁업</option>
				    <option value="b010">도소매</option>
				    <option value="b011">기타</option>
			  	</select>
		  	</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	
	
	
	
	
	<h4>인증사용자 추가 정보</h4> <h6>*판매를 원하시는 회원은 인증사용자로 등록해주세요:)</h6>
	<hr>
	<br>
	

	
	

	
	<table>
		
		<tr>
			<th>사업자등록번호</th>
			<td>
			<input type="text" name="biz_num" id="biz_num" maxlength="10"/>
			<button type="button" class="test_btn3">사업자 등록확인</button>
			</td>
		</tr>
		
		<tr>
			<th>상호명</th>
			<td>
				<input type="text" name="store_name" id="store_name"/>
				
			</td>
		</tr>
		
		 <tr>
		  <th>사업자등록증</th>
		  <td>
		    <div class="file-preview-container">
		      <input type="file" onchange="workURL(this);" name="bizprofile" id="file2">
		      <br>
		      <img id="previeww" />
		      <button type="button" class="btn btn-sm btn-danger delete-file-button" style="display: none;">
		        <i class="fas fa-trash-alt"></i>
		      </button>
		    </div>
		    <h6 id="des">※ 참고할 수 있는 파일을 10MB 용량 이하의 이미지, ZIP, PDF 등의 파일 형태로 첨부해주세요.
		      <br>
		      첨부파일 관련 URL주소가 있다면 상품 소개 입력창에 남겨주세요.
		    </h6>
		  </td>
		</tr> 
		<tr>
			<td><br><br></td>

		</tr>
		<br>
		<br>
		<br>
		<br>
		
		
		<tr>
			<th colspan="2">
				 <button type="button" class="test_btn2" onclick="checkInput()">입력확인</button>
			      <button class="test_btn2" id="registerButton" style="display: none;">등록</button>
			      <button type="button" onclick="location.href='./'" class="test_btn2">돌아가기</button>
    		</th>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	 </form>  
</body>



<!--다음 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>







function join() {
	  if  (pweq && overlayChk && overlayChk2) {
	  /*   var $user_id = $('#user_id');
	    var $user_pw = $('#user_pw');
	    var $user_name = $('#user_name');
	    var $nickname = $('#nickname');
	    var $post_num = $('#post_num');
	    var $phone_num = $('#phone_num'); 
	    var $email = $('#email');
	    var $interest_biz_id = $('#interest_biz_id');
	   
	    var $post_num = $('#sample6_postcode');
	    
	    var $sigungu = $('#sigungu');
	    var $biz_num = $('#biz_num');
	    var $store_name = $('#store_name');
	    
	    var $sido = $('#sido');
	    var $left_addr = $('#left_addr');
	    var $phone_num2 = $('#phone_num2');
	    var $phone_num3 = $('#phone_num3');
	    var $user_state = $('#user_state');
	    var $left_addr = $('#sample6_address');
	    var $biz = $('#biz');
	    
	   
	    var file1 = $('#file1')[0].files[0]; // 파일 업로드를 위한 input 태그
	    var file2 = $('#file2')[0].files[0];

	   var $post_numTest = $('#sample6_postcode'); */
	    
	    
	    if ($user_id.val() == '') {
	      alert('아이디를 입력해 주세요!');
	      $user_id.focus();
	    }/*  else if ($user_pw.val() == '') {
	      alert('비밀번호를 입력해 주세요!');
	      $user_pw.focus();
	    } else if ($user_name.val() == '') {
	      alert('이름을 입력해 주세요!');
	      $user_name.focus();
	    } else if ($nickname.val() == '') {
	      alert('닉네임을 입력해 주세요!');
	      $nickname.focus();
	    }else if ($phone_num.val() == null) {
	      alert('전화번호를 입력해 주세요!');
	    } else if ($email.val() == '') {
	      alert('이메일 입력해 주세요!');
	      $email.focus();
	    } else if ($interest_biz_id.val() == '.') {
	      alert('관심업종을 선택해 주세요!');
	    } */else {
	    	
	    	
	      // FormData 객체 생성
	     
	      
	      
	     /*  var formData = new FormData();
	      formData.append('user_id', $user_id.val());
	      formData.append('user_pw', $user_pw.val());
	      formData.append('user_name', $user_name.val());
	      formData.append('nickname', $nickname.val());
	      formData.append('post_num', $post_num.val());
	      formData.append('phone_num', $phone_num.val()); 
	      formData.append('email', $email.val());
	      formData.append('interest_biz_id', $interest_biz_id.val());
	     
	    	    formData.append('file1', file1);
	    	    formData.append('file2', file2);
	    	    
	    	    
	    	    
	      formData.append('phone_num', phone_num);
	    
	      formData.append('sample6_postcode', $post_num.val());
	      formData.append('sigungu', $sigungu.val());
	      formData.append('biz_num', $biz_num.val());
	      formData.append('store_name', $store_name.val());
	      
	      formData.append('sido', $sido.val());
	      formData.append('left_addr', $left_addr.val());
	      formData.append('phone_num2', $phone_num2.val());
	      formData.append('phone_num3', $phone_num3.val());
	      formData.append('user_state', $user_state.val());	
	      
	      formData.append('sample6_address', $left_addr.val());
	      formData.append('biz', $biz.val());
	      
	    
	      
	      
	      console.log(formData);

	      // ajax 요청
	      $.ajax({
	        url: 'join.ajax', // 
	        type: 'POST',
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function (data) {
	          console.log(data);
	          if(data.success == 1){
					alert('회원가입이 완료 되었습니다.');
					location.href = './';
				}else{
					alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요!');
				}
			},
			error:function(e){
				console.log(e);
				alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요!');
			}
		});
	       */

		}
		
	}else{
		alert('아이디 중복 체크와 비밀번호 확인을 해 주세요');
	}	
}


var pweq = false;
var overlayChk = false;
var overlayChk2 = false;



  
  /// 유효성 검사
function checkInput() {
   
	
     if  (pweq && overlayChk && overlayChk2 ) {
    	 
	     var $user_id = $('#user_id');
	    var $user_pw = $('#user_pw');
	    var $user_name = $('#user_name');
	    var $nickname = $('#nickname');
	    var $post_num = $('#post_num');
	    var $phone_num = $('#phone_num'); 
	    var $email = $('#email');
	    var $interest_biz_id = $('#interest_biz_id');
	    var $post_num = $('#sample6_postcode');
	    var $sigungu = $('#sigungu');
	    var $biz_num = $('#biz_num');
	    var $store_name = $('#store_name');
	    var $sido = $('#sido');
	    var $left_addr = $('#left_addr');
	    var $phone_num2 = $('#phone_num2');
	    var $phone_num3 = $('#phone_num3');
	    var $user_state = $('#user_state');
	    var $left_addr = $('#sample6_address');
	    var $biz = $('#biz');
	    
	   
	  

	   var $post_numTest = $('#sample6_postcode'); 
	    
	    
	    if ($user_id.val() == '') {
	      alert('아이디를 입력해 주세요!');
	      $user_id.focus();
	    }else if (!validateUserId($user_id.val())) {
	        alert('아이디는 영어와 숫자를 조합한 5글자 이상이어야 합니다.');
	        $user_id.focus();
	      }  else if ($user_pw.val() == '') {
	      alert('비밀번호를 입력해 주세요!');
	      $user_pw.focus();
	    }else if (!/^[a-zA-Z0-9!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]*$/.test($user_pw.val())) {
	        alert('비밀번호는 한글을 제외한 영문, 숫자, 특수문자만 입력 가능합니다.');
	        $user_pw.focus();
	      }else if ($user_name.val() == '') {
	      alert('이름을 입력해 주세요!');
	      $user_name.focus();
	    } else if ($nickname.val() == '') {
	      alert('닉네임을 입력해 주세요!');
	      $nickname.focus();
	    }else if ($phone_num.val() == '') {
	      alert('전화번호를 입력해 주세요!');
	    }else if ($post_num.val() == '') {
	      alert('우편번호 찾기를 해주세요!');
	    } else if ($email.val() == '') {
	      alert('이메일 입력해 주세요!');
	      $email.focus();
	    } else if ($interest_biz_id.val() == '.') {
	      alert('관심업종을 선택해 주세요!');
	    } else  {
	    	 alert('회원가입 준비가 됐습니다. 등록 버튼을 눌러주세요!');
	    	 document.getElementById('registerButton').style.display = 'inline-block';
    // 모든 필드의 유효성을 통과했을 경우
	    } 
	    
     } else  {
    	 alert('아이디 중복 체크와 비밀번호 확인을 해 주세요');
      
    }
  }

function validateUserId(userId) {
	  return /^[a-zA-Z0-9]{5,}$/.test(userId);
	}



$(function() {
    // 주소 입력값이 한글인 경우 숫자로 입력해달라는 안내 메시지를 띄우는 함수
    function checkAddress() {
      var address = $('#sample6_address').val();
      if (/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(address)) {
        $('#address_alert').show();
      } else {
        $('#address_alert').hide();
      }
    }
    
    // 주소 입력값이 변경될 때마다 checkAddress 함수를 실행
    $('#sample6_address').on('input', checkAddress);
  });


$('#overlay').on('click',function(e){	
	var chkId = $('#user_id').val();	
	console.log('중복체크 요청 : '+chkId);
	
	$.ajax({
		type:'get',
		url:'overlay.ajax',
		data:{'user_id':chkId},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.overlay == 0){
				alert('사용 가능한 아이디 입니다.');
				overlayChk = true;
			}else{
				alert('이미 사용중인 아이디 입니다.');
				$('#user_id').val('');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
});
$('#overlay2').on('click',function(e){	
	var chkId2 = $('#nickname').val();	
	console.log('닉네임중복체크 요청 : '+chkId2);
	
	$.ajax({
		type:'get',
		url:'overlay2.ajax',
		data:{'nickname':chkId2},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.overlay2 == 0){
				alert('사용 가능한 닉네임 입니다.');
				overlayChk2 = true;
			}else{
				alert('이미 사용중인 닉네임 입니다.');
				$('#nickname').val('');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
});

$('#confirm').on('keyup',function(e){
	console.log('confirm_password: '+$('#confirm'));
	console.log('newpassword: '+$('#user_pw'));
	if($('#user_pw').val() == $(this).val()){
		$('#msg').css({'font-size': '10px', 'color': 'darkgreen'});
		$('#msg').html('비밀번호가 일치 합니다.');
		pweq = true;
	}else{
		$('#msg').css({'font-size': '10px', 'color': 'red'});
		$('#msg').html('비밀번호가 일치 하지 않습니다.');
	}	
});




function sample6_execDaumPostcode() {

	  console.log("실행.");
	  // 우편번호 찾기 실행
	  new daum.Postcode({
	    oncomplete: function(data) {
	      // 우편번호 입력란에 값 할당
	      document.getElementById('sample6_postcode').value = data.zonecode;
	      // 주소 입력란에 값 할당
	      document.getElementById('sample6_address').value = data.address;
	      // 상세주소 입력란 활성화
	      document.getElementById('sample6_detailAddress').disabled = false;
	      document.getElementById('sample6_extraAddress').disabled = false;
	      // 시/도, 시/군/구 정보 입력란에 값 할당
	      document.getElementById('sido').value = data.sido;
	      document.getElementById('sigungu').value = data.sigungu;
	    }
	  }).open();
	}
	
/*  
//api 입력하고 나서 상세주소를 입력할 수 있도록
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      var fullAddr = ''; 
      var extraAddr = '';

      if (data.userSelectedType === 'R') {
        fullAddr = data.roadAddress;
      } else {
        fullAddr = data.jibunAddress;
      }

      if (data.userSelectedType === 'R') {
        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }

        if (data.buildingName !== '' && data.apartment === 'Y') {
          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }

        if (extraAddr !== '') {
          extraAddr = ' (' + extraAddr + ')';
        }

        document.getElementById('sample6_extraAddress').value = extraAddr;
      } else {
        document.getElementById('sample6_extraAddress').value = '';
      }

      document.getElementById('sample6_postcode').value = data.zonecode;
      document.getElementById('sample6_address').value = fullAddr;
      document.getElementById('sample6_detailAddress').value = '';
      document.getElementById('sample6_detailAddress').readOnly = false;
      document.getElementById('sample6_detailAddress').focus();
    }
  }).open();
}

document.getElementById('sample6_detailAddress').readOnly = true;

*/	



//사업자 등록증 삭제 기능

function handleFileSelect(event) {
  var input = this;
  if (input.files && input.files.length) {
    var reader = new FileReader();
    var $previewContainer = $(input).closest('.file-preview-container');
    var $previewImage = $previewContainer.find('img');
    var $deleteButton = $previewContainer.find('.delete-file-button');
    
    $deleteButton.show();
    $deleteButton.off('click');
    $deleteButton.on('click', function() {
      $previewContainer.find('img').attr('src', '');
      $(input).val('');
      $deleteButton.hide();
    });
    
    reader.onload = (function (e) {
      $previewImage.attr('src', e.target.result);
    });
    reader.readAsDataURL(input.files[0]);
  }
}

$(document).ready(function() {
  $('#file1').change(handleFileSelect);
});


//파일 미리보기!
console.log()
function handleFileSelect(event) {
    var input = this;
    console.log(input.files)
    if (input.files && input.files.length) {
        var reader = new FileReader();
        this.enabled = false
        reader.onload = (function (e) {
        console.log(e)
            $("#preview").html(['<img class="thumb" src="', e.target.result, '" title="', escape(e.name), '"/>'].join(''))
        });
        reader.readAsDataURL(input.files[0]);
    }
}
$('#file1').change(handleFileSelect);
$('.file-edit-icon').on('click', '.preview-de', function () {
    $("#preview").empty()
    $("#file1").val("");
});
$('.preview-edit').click( function() {
  $("#file1").click();
} );

//원하는 크기로

function handleFileSelect(event) {
    var input = this;
    console.log(input.files)
    if (input.files && input.files.length) {
        var reader = new FileReader();
        this.enabled = false
        reader.onload = (function (e) {
            var img = new Image();
            img.onload = function() {
                var canvas = document.createElement("canvas");
                var ctx = canvas.getContext("2d");
                var MAX_WIDTH = 300; // 변경할 가로 크기
                var MAX_HEIGHT = 300; // 변경할 세로 크기
                var width = img.width;
                var height = img.height;

                if (width > height) {
                    if (width > MAX_WIDTH) {
                        height *= MAX_WIDTH / width;
                        width = MAX_WIDTH;
                    }
                } else {
                    if (height > MAX_HEIGHT) {
                        width *= MAX_HEIGHT / height;
                        height = MAX_HEIGHT;
                    }
                }

                canvas.width = width;
                canvas.height = height;
                ctx.drawImage(img, 0, 0, width, height);
                var dataurl = canvas.toDataURL("image/jpeg"); // 이미지를 JPEG 형식으로 변환
                $("#preview").html(['<img class="thumb" src="', dataurl, '" title="', escape(e.name), '"/>'].join(''));
            }
            img.src = e.target.result;
        });
        reader.readAsDataURL(input.files[0]);
    }
}

$('#file1').change(handleFileSelect);
$('.file-edit-icon').on('click', '.preview-de', function () {
    $("#preview").empty()
    $("#file1").val("");
});

$('.preview-edit').click( function() {
    $("#file1").click();
});

//사업자 등록증 미리보기 및 삭제 코드



// 사업자 등록증!	
function workURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('previeww').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('previeww').src = "";
	  }
	}

// 다음 지도 api
 function sample6_execDaumPostcode() {
		console.log("실행.");
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
    
    
    //사업자 등록 api
    
    $(document).ready(function(){
  $('.test_btn3').on('click', function(){
    var bizNum = $('#biz_num').val();
    var data = {
      "b_no": [bizNum]
    };
    $.ajax({
      url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=e18xz2nUHjGbEsKOfvMhNjoXOcjNNRwEwSw%2BmCJe3vkmSiKJ9IZaY4Y0CM1YT9SV1i%2F6EWdDPYbxXV8PHG1LMQ%3D%3D",
      type: "POST",
      data: JSON.stringify(data),
      dataType: "JSON",
      contentType: "application/json",
      accept: "application/json",
      success: function(result) {
    	  console.log(result);
    	  if (result.match_cnt === 1 && result.data[0].b_stt === '폐업자') {
    		  alert('해당 사업자 번호는 이미 폐업되어서 사용할 수 없는 번호입니다. 확인 후 다시 시도해 주세요.');
    		}else if (result.match_cnt === 1 && result.data[0].b_stt === '계속사업자') {
    		  alert('"계속사업자"로 등록된 사업자 등록 번호이므로 사용이 가능합니다. 계속 회원가입을 진행 해 주세요');
    		} else if (result.match_cnt === 1) {
    		  alert('등록된 사업자 등록 번호입니다. 계속 회원가입을 진행 해 주세요.');
    		} else {
    		  alert('인증되지 않은 사업자 등록 번호입니다.');
    		}
    	},
    	error: function(result) {
    	    console.log(result.responseText);
    	}
    });
  });
});

    //사업자 등록 확인 알람
    

/// 성공 확인 알람
 var msg = "${msg}";
 	 if(msg !=""){
 		 	alert(msg);
 		 
 	 }


/// 비밀번호 알려주는 자스
$(document).ready(function() {
  // 비밀번호 보기/가리기 기능
  $('#togglePassword').on('click', function() {
    var passwordField = $('#confirm');
    var fieldType = passwordField.attr('type');
    if (fieldType === 'password') {
      passwordField.attr('type', 'text');
      $('#togglePassword').removeClass('fa-eye').addClass('fa-eye-slash');
    } else {
      passwordField.attr('type', 'password');
      $('#togglePassword').removeClass('fa-eye-slash').addClass('fa-eye');
    }
  });
});


//마찬가지 비밀번호 보여주는
const togglePassword = document.querySelector('#togglePassword');
const passwordInput = document.querySelector('#user_pw');

togglePassword.addEventListener('click', function () {
  const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
  passwordInput.setAttribute('type', type);
  togglePassword.classList.toggle('fa-eye');
  togglePassword.classList.toggle('fa-eye-slash');
});

</script>
</html>