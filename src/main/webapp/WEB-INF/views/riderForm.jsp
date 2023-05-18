<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">



<style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
   	}
    body {
    	
      font-family: 'Noto Sans KR', sans-serif;

    }
#user_id{
	width: 69%;}
#email{
	width: 35%;
}
#url{
	width: 40%;
}

#workNumber{
	width: 40%;
}
#nickName{
	width: 40%;

}
#phone2{
	width: 40%;
}
#biz_num{
	width: 60%;
}
table{
	margin: 0 auto;

}

table, th, td{
	border: 0px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

h2{
text-align: center;

}
h4{
	padding: 0% 0% 0% 25%;
	color: blue;
}

h5{
	font-size:10px;
	color: gray;

}


h6{
	padding: 0% 0% 0% 25%;
	color: gray;
}
#des{
	padding: 0%;
	color: gray;
}
#profile{
	width: 120px;
}

#intro{
	 width: 100%;
    height: 8.25em;
    
    resize: none;

}
#news{
	 width: 80%;
    height: 8.25em;
    
    resize: none;

}

      		#findPost{
            border-top-left-radius: 7px;
            border-bottom-left-radius: 7px;
            border-top-right-radius: 7px;
            border-bottom-right-radius: 7px;  
            
            margin-right:6px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 13px;
             
            
        }
       
        #findPost{
            border: 1px solid #227cff;
            background-color: #227cff;
            color: white;
            padding: 6px 14px 6px 13px;
            font: 'Noto Sans KR', sans-serif;
        }
        #findPost:hover{
            color:white;
            background-color: #3788fd;
        }
        

/*버튼꾸미기!!!  */
  			.test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
            
            margin-right:-4px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 13px;
            
        }
       
        .test_btn1{
            border: 1px solid #227cff;
            background-color: #227cff;
            color: white;
            padding: 5px 10px 5px 10px;
            font: 'Noto Sans KR', sans-serif;
        }
        .test_btn1:hover{
            color:white;
            background-color: #3788fd;
        }
  		.test_btn2{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
            
            margin-right:6px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 15px;
            
        }
       
        .test_btn2{
            border: 1px solid #227cff;
            background-color: #227cff;
            color: white;
            padding: 6px 22px 6px 22px;
            font: 'Noto Sans KR', sans-serif;
        }
        .test_btn2:hover{
            color:white;
            background-color: #3788fd;
        }
        
        .preview-edit{
        	border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
            
            margin-right:-4px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 13px;
        
        }
         .preview-edit{
			
            color: white;
            padding: 5px 10px 5px 10px;
            font: 'Noto Sans KR', sans-serif;
            width: 45px;
        
        }
        .preview-edit:hover{
            color:white;
            background-color: #3788fd;
        }
        
       .preview-de{
            
            
            margin-right:-5px;
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 15px;
            
        }
       
        .preview-de{
            
            color: white;
            padding: 5px 10px 5px 10px;
            font: 'Noto Sans KR', sans-serif;
            width: 45px;
        }
        .preview-de:hover{
            cursor:pointer;
        }
        
    /*  알림 팝업창*/
 /* .custom-popup {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: none;
  justify-content: center;
  align-items: center;
}

.popup-content {
  background-color: white;
  padding: 20px;
  border-radius: 4px;
} */

	
        
  


</style>
<head>
<jsp:include page="joinGnb.jsp"/>

</head>

<body>
	<br>
	<br>
	<br>
	<br>
	
	<h2> 라이더 회원가입</h2>
	<br>
	<br>
	<form action="riderRegist.do" method="post" enctype="multipart/form-data">
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
			<th>*닉네임(상호명)</th>
			<td>
				<input type="text" name="nickname" id="nickname"/>
				<button type="button" id="overlay2" class="test_btn1">중복체크</button>
			</td>
		</tr>
		
		<tr>
			<th>*주소</th>
			<td>
			
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
				<input type="text" id="sample6_postcode" name="post_num" placeholder="우편번호" readonly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="findPost"><br>
				
				
			
			</td>
		</tr>
		<tr>
		<td></td>
		<td><input type="text" id="sample6_address" placeholder="주소" name="left_addr"><br></td>
		</tr>
		
		
		<tr>
		
			<th>*상세주소</th>
			<td>
			<!-- <input type="text" name="left_addr" id="left_addr"/> -->
			<input type="text" id="sample6_detailAddress"  placeholder="상세주소">
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
			<!-- <input name="phone_num2" type="text" id="phone_num2" maxlength="4" oninput="validateInput(this)">
				<div id="custom-popup" class="custom-popup">
				  <div class="popup-content">
				    <span id="popup-message"></span>
				  </div>
				</div> -->

				 -
		    <input name="phone_num3" type="text" id="phone_num3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 4)">
			</td>
		</tr>
		<tr>
			<th>*이메일</th>
			<td><input type="text" name="email" id="email"/> 
			&nbsp; @ &nbsp; 
			<select id="url" name="url">
			<option value="naver.com">naver</option>
			<option value="gmail.com">gmail</option>
			<option value="daum.com">daum</option>
			</select>
			</td>
		</tr>
		<input type="hidden" id="user_state" name="user_state" value="가입대기" />
		<tr>
			
			
				<input type="hidden" name="interest_biz_id" value="b012" id="interest_biz_id" />
					 
			  	

		
		<!--  
		<tr>
			<th colspan="2">
				<button onclick="join()">가입</button>
				<button onclick="location.href='./'">돌아가기</button>
			</th>
		</tr>
		-->
	</table>
	<br>
	<h4>라이더 추가 정보</h4> <h6>*라이더정보를 상세히 기입해주세요:)</h6>
	<hr>
	<br>
	
	<table>
		<tr>
			<th>프로필 추가</th>
			<td>

				
				<div class="file-wrapper flie-wrapper-area">
				  <div class="float-left">
				    <span class="label-plus"><i class="fas fa-plus"></i></span>
				    <button type="button">
				    <div id="preview"><img id="preview" src="resources/photo/프로필 기본.png"/></div>
				    
				    <input type="file" name="profile" id="file" class="upload-box upload-plus" accept="image/*">
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
			<th>사업자등록번호</th>
			<td>
			<input type="text" name="biz_num" id="biz_num" maxlength="10"/>
			<button type="button" class="test_btn3">사업자 등록확인</button>
			</td>
		</tr>
		<tr>
			<th>소개</th>
			<td>
			<textarea name="intro" id="intro"></textarea>
			</td>
		</tr>
		<tr>
			<th>소식</th>
			<td>
				<textarea type="text" name="news" id="news"></textarea>
				
			</td>
		</tr>
		<tr>
			<th>영업시간</th>
			<td>
				<input type="time" name="store_time" id="store_time"/>
				~
				<input type="time" name="store_time2" id="store_time2"/>
				
			</td>
			
		</tr>
		
		
		<tr>
				<th>사업자등록증</th>
				<td>
					
				 	<input type="file" onchange="workURL(this);" name="bizprofile"  >
				 	<br>
				 	<img id="previeww" />		
			
					<h6 id="des">※ 참고할 수 있는 파일을 10MB 용량 이하의 이미지, ZIP, PDF 등의 파일 형태로 첨부해주세요.
					<br>
					첨부파일 관련 URL주소가 있다면 상품 소개 입력창에 남겨주세요.
					</h6>
				</td>
		</tr>
		<tr>
			<td><br><br></td>

		</tr>

		
		
		<tr>
			<th colspan="2">
				 <button type="button" class="test_btn2" onclick="checkInput()">입력확인</button>
			      <button class="test_btn2" id="registerButton" style="display: none;">등록</button>
			      <button type="button" onclick="location.href='./'" class="test_btn2">돌아가기</button>
    		</th>
		</tr>
	</table>
	</form>
	<br><br>	<br><br><br>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>


var pweq = false;
var overlayChk = false;
var overlayChk2 = false;

/*
function join(){
	
	if(pweq && overlayChk && overlayChk2){
		
		var $user_id = $('#user_id');
		var $user_pw = $('#user_pw');
		var $user_name = $('#user_name');
		var $nickname = $('#nickname');
		var $post_num = $('#post_num');
		var $phone_num = $('#phone_num');
		var $email = $('#email');
		var $interest_biz_id = $('#interest_biz_id');
		
		
		
		if($user_id.val()==''){
			alert('아이디를 입력해 주세요!');
			$user_id.focus();
		}else if($user_pw.val()==''){
			alert('비밀번호를 입력해 주세요!');
			$user_pw.focus();
		}else if($user_name.val() == ''){
			alert('이름을 입력해 주세요!');
			$user_name.focus();
		}else if($nickname.val() == ''){
			alert('닉네임을 입력해 주세요!');
			$nickname.focus();
		}else if($post_num.val() == null){
			alert('우편번호를 입력해 주세요!');
		}else if($phone_num.val() == null){
			alert('전화번호를 입력해 주세요!');
		}else if($email.val() == ''){
			alert('이메일 입력해 주세요!');
			$email.focus();
		}else if($interest_biz_id.val() == '.'){
			alert('관심업종을 선택해 주세요!');
		}else{
			var param = {};
			param.interest_biz_id = $interest_biz_id.val();
			console.log(param);
			/*
			var param = {};
			param.user_id = $user_id.val();
			param.user_pw = $user_pw.val();
			param.user_name = $user_name.val();
			param.nickname = $nickname.val();
			param.post_num = $post_num.val();
			param.phone_num = $phone_num.val();
			param.email = $email.val();
			param.interest_biz_id = $interest_biz_id.val();
			
			console.log(param);
			
			 
			$.ajax({
				type:'post',
				url:'join.ajax',
				data:param,
				dataType:'json',
				success:function(data){
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
			
		}
		
		
	}else{
		alert('아이디 중복 체크와 비밀번호 확인을 해 주세요');
	}	
}
*/


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
	if($('#user_pw').val() == $(this).val()){
		$('#msg').css({'font-size': '10px', 'color': 'darkgreen'});
		$('#msg').html('비밀번호가 일치 합니다.');
		pweq = true;
	}else{
		$('#msg').css({'font-size': '10px', 'color': 'red'});
		$('#msg').html('비밀번호가 일치 하지 않습니다.');
	}	
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
$('#file').change(handleFileSelect);
$('.file-edit-icon').on('click', '.preview-de', function () {
    $("#preview").empty()
    $("#file").val("");
});
$('.preview-edit').click( function() {
  $("#file").click();
} );


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

//다음 지도 api
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