var pweq = false;
var overlayChk = false;
var overlayChk2 = false;

$('document').ready(function(){
   var elem = $('#nickname').val();
   console.log(elem);
   if(elem!=null){
      overlayChk2 = true;
   }
   
});


$('#overlay3').on('click',function(e){   
   var chkId2 = $('#nickname').val();   
   var nickname = document.getElementById('nickname').value;
   
   console.log('닉넴중복체크 아이디 chkId2 : '+chkId2);
   console.log('nickname : '+nickname);
   
   $.ajax({
      type:'get',
      url:'overlay3.ajax',
      data:{'nickname':chkId2},
      dataType:'json',
      success:function(data){
         console.log(data);
         if(data.overlay3 == 0){
            if(nickname == chkId2){
               alert('사용 가능한 닉네임 입니다.');
               overlayChk2 = true;
            }
            
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
    }else if($confirm_password.val() == ''){
        alert('비밀번호 확인을 해주세요!');
        $confirm_password.focus();
        console.log("2");
    }else if($nickname.val() == ''){
        alert('닉네임을 입력해 주세요!');
        $nickname.focus();
        console.log("3");
    }else if($post_num.val() == null){
        alert('우편번호를 입력해 주세요!');
        console.log("4");
    }else if($phone_num.val() == null){
        alert('전화번호를 입력해 주세요!');
        console.log("5");
    }else if($email.val() == ''){
        alert('이메일 입력해 주세요!');
        $email.focus();
        console.log("6");
    }else if($interest_biz_id.val() == '.'){
        alert('관심업종을 선택해 주세요!');
        console.log("7");
    }else{
        overlayChk = true;
        var param = {};
        param.interest_biz_id = $interest_biz_id;
        param.newpassword = $newpassword.val();
        param.confirm_password = $confirm_password.val();
        param.nickname = $nickname.val();
        param.post_num = $post_num.val();
        param.phone_num = $phone_num.val();
        param.email = $email.val();
        
        console.log(param);
        
    }
    
    $('#confirm_password').on('keyup',function(e){
        console.log('confirm_password: '+$('#confirm_password').val());
        console.log('newpassword: '+$('#newpassword').val());
         if($('#newpassword').val() == $(this).val()){
            $('#msg').css({'font-size': '10px', 'color': 'darkgreen'});
            $('#msg').html('비밀번호가 일치 합니다.');
            pweq = true;
         }else{
            $('#msg').css({'font-size': '10px', 'color': 'red'});
            $('#msg').html('비밀번호가 일치 하지 않습니다.');
         }   
      });
      
      if(pweq && overlayChk && overlayChk2){
         alert('회원정보 수정이 완료되었습니다');
         
         $.ajax({
            type:'post',
            url:'userSetting.do',
            data:{
               nickname=$nickname
               ,user_pw=$confirm_password
               ,email=$email
               ,phone_num=$phone_num
               ,post_num=$post_num
               ,sigungu=$sigungu
               ,sido=$sido
               ,left_addr=$left_addr
               ,interest_biz_id=$interest_biz_id
            },
            dataType:'json',
            success:function(data){
               console.log(data);
               
            },
            error:function(e){
               console.log(e);
            }
         });
   }
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