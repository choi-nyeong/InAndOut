<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      font: bold;
      
      
 
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
  color: blue;
  font-weight: bold;
  
  
}

#banner{
	font-weight: bold;
}


.nbsp {
  width:860px;
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
   
@media(max-width:1200px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 1%;}
}
@media(max-width:980px){
#navbar{position: relative;position: fixed;width: 100%;top: 0;left: 0;}
#navbar .nbsp{ width: 1%; display: none;}
#navbar a{ visibility: hidden; width: 0%; display: none;}
}
  

   
   
    #header .menu_btn.lijo{top: 30%}
   #header .nav ul.gnb{position: absolute;top: 65px;transform: translateX(100%);left: 0;transition:.8s ease;width:100%; height: calc(100vh - 65px);background: #fff;overflow-y: auto;display: block}
   #header .nav ul.gnb li a{text-align: left}
   #header .nav ul.gnb.surya {transform: translateX(0%);}
   #header .nav ul.gnb li ul.sub{opacity: 1;visibility: visible;display:none;position:relative;padding-top:0px;width:100%;transition:0s;transform: translateY(0px);}
   #header .nav ul.gnb li ul.sub:after{display:none;}
   .hd_bg{display: none !important}
   }

</style>
<head>


  <link rel="stylesheet" href="style.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  <script type="text/javascript">
</script>
    <header>
      <nav>
		<div id="navbar">
		      <div class="logo"><img src="resources/photo/로고2.png" onclick="location.href='home'"></div>
		      
		      
		      <div id="banner">
					<a href="#">카테고리</a>
					<a href="#">갤러리</a>
		      </div>
		       <div class="nbsp">
					 		     
 		      </div>
		
	</nav>
	
</header>
	 <hr>
</head>
<body>



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

</script>
</html>