<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    
    }


    .logo{
  padding-top:0px;
	}

	.logo img{
	  width:80px;
	  cursor:pointer;
	  margin: 4px 0px -10px 0px;
	}
	

    body {
      font-family: 'Noto Sans KR', sans-serif;
      
      
 
    }




    a:link {
      text-decoration: none;
      
    }

    a:visited {
      
}

    a:hover {
      color: #21325D;
    }

    a:active {
     
    }



header{
  height:70px;
  
}

#navbar {
  position: fixed;
  top:0;
  width: 100%;
  display: flex;
  transition: top 0.8s;
  line-height: 3rem;
  padding: 0px 8%;
  z-index:2;
  background:white;
  
}

#navbar a {
  float: left;
  display: block;
  color: #333;
  text-decoration: none;
  margin: 4px 10px 10px 20px;
  font-size:1rem;
 
  
}


#navbar a:hover {
  color: #4f54d9;
  font-weight: bold;
  
  
}


.nbsp {
  width:860px;
}


.loginbax{
	width: 27%;
	margin-right: 13px;

}

.loginOutline{
	display: flex;
		justify-content: flex-end;
		align-items: center; 
		justify-content: flex-star;
		
		
}

.realLogin{
	display: flex;
		justify-content: center;
		align-items: center; 
		justify-content: flex-star;
		margin-right: 13px;

}
  
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
        
       
#id{
	margin-right: 5px;

}
#login{
	margin-right: 3px;

}
#join{
	

}


@media(max-width:1913px){
   #navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
   #navbar .nbsp{ width: 45%;}
   }
@media(max-width:1750px){
   #navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
   #navbar .nbsp{ width: 40%;}
   }
@media(max-width:1564px){
   #navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
   #navbar .nbsp{ width: 35%;}   

@media(max-width:1378px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 30%;}
}
@media(max-width:1280px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 20%;}
}   
@media(max-width:1204px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 1%;}
}
@media(max-width:980px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 1%; display: none;}
#navbar a{ visibility: hidden; width: 0%; display: none;}
}
  
 
</style>
<head>

 <header>
 

 								<c:if test="${dto.new_photo_name eq null}">
						  			<nav>
										<div id="navbar">
										     
										      <div class="logo"><img src="resources/photo/로고2.png" onclick="location.href='home'"></div>
										      
										      
										     
										      <div >
													<a href="#">판매글</a>
													<a href="#">갤러리</a>
										      </div>
										       <div class="nbsp">
													 		     
								 		      </div>
										       <div class="loginOutline">
													
											            <input type="text" id="id" class="loginbax">
											            <input type="password" id="pw" class="loginbax">
								           		 	
										      </div>
										     
										      <div class="realLogin">
													 <!-- <a id="login"onclick="login()" class="test_btn1">login</a> -->
													  <button id="login" onclick="login()" class="test_btn1">로그인</button>
													 
													<button id="join" onclick="location.href='join.go'" class="test_btn1">회원가입</button>
											 </div>
										 </div>
												
									</nav>
					     		</c:if>
					     			
					     		 
									<c:if test="${dto.new_photo_name ne null}">
											 <nav>
											<div id="navbar">
											      <div class="logo"><img src="resources/photo/로고2.png" onclick="location.href='afterLogin.go'" ></div>
														<a href="salesList.do">Store</a>
														<a href="galleryList.do">Gallery</a>
											       <div class="nbsp">		     
									 		      </div>
										 		      <div id="etc">
														       <div id="location">
																				            거주  지역
															            <button  class="test_btn1">지역활동인증</button>
												           		 	
														      	</div>
														      	
														      	
														     	<div  id="lol">
														     		
														     		  <c:if test="${dto.new_photo_name eq null}">
														     		 <img src="resources/photo/프로필 기본.png" id="profile" onclick="location.href='profile.go'">
														     		 </c:if>
														     		 
														     		 <c:if test="${dto.new_photo_name ne null}">
														     		 <img src="resources/photo/${dto.new_photo_name}" id="profile" onclick="location.href='profile.go'">
														     		 </c:if>
																	<img src="resources/photo/logout.png" id="logout" onclick="location.href='home'">
																	<img src="resources/photo/free-icon-letter-1250663.png" id="chating" onclick="location.href='chatlist.go'">
															 </div>
															 
															 
																      <div class="dropdown">
																    <button  class="test_btn1">글쓰기</button>
																    <div class="dropdown-content">
																      <a href="salesWrite.go" id="drop">판매글 등록</a>
																      <a href="galleryWrite.go"  id="drop">갤러리 등록</a>
																      
																      
																      
																    </div>
																  </div>
															 
															 
													 </div>
												
										</nav>
									</c:if>
 
 
	 
</header>



  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
  <title>INaNdOUT</title> 
  <link rel="stylesheet" href="style.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  <script type="text/javascript">
</script>
   
 
    
</head>
<body>
<br>


	${msg}
	<a href="salesWrite.go">판매글 등록</a>
	<a href="salesList.do?biz_id=b01">b01판매글 보기</a>
	<a href="salesList.do?biz_id=b02">b02판매글 보기</a>
	<a href="galleryWrite.go">갤러리 등록</a>
	<a href="galleryList.do">갤러리보기</a>

<br>
<br>
<br>


<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>
<h1>gnbNav.js Example</h1>

<ul id="gnb1">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
<h1>gnbNav.js Example</h1>
<ul id="gnb">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
<h1>gnbNav.js Example</h1>
<ul id="gnb">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>




</body>
<script>
var prevScrollpos = window.pageYOffset; 

window.onscroll = function() { 
  

  var currentScrollpos = window.pageYOffset; 
  

  if (prevScrollpos > currentScrollpos) { 

    document.getElementById("navbar").style.top = "0"; 

  } else { 

    document.getElementById("navbar").style.top = "-100px"; 
  }
  

  prevScrollpos = currentScrollpos; 

}


//slider

new Swiper('.swiper', {
	pagination : { // 페이징 설정
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
  
	navigation : { // 네비게이션 설정
		nextEl : '.swiper-button-next0', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev0', // 이번 버튼 클래스명
	},
});


///top

$( window ).scroll( function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.top' ).fadeIn();
	} else {
		$( '.top' ).fadeOut();
	}
} );

//로그인 관련 아작스!!

function login(){
	
	console.log($('#id').val(),$('#pw').val());
	$.ajax({
		type:'post',
		url:'login.ajax',
		data:{
			id:$('#id').val(),
			pw:$('#pw').val()
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success == 1){
				alert('로그인에 성공 했습니다.');
				location.href='afterLogin.go';
			}else{
				alert('아이디 또는 비밀번호를 확인해 주세요!');
			}			
		},
		error:function(e){
			consol.log(e);
			alert('아이디 또는 비밀번호를 확인해 주세요!');
		}		
	});

}



</script>
</html>