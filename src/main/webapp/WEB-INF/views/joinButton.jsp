<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 .container {
 			
		  font-family: arial;
		  font-size: 24px;
          margin-top: 10%;
    	margin-right: 30%;
    	margin-bottom: 30%;
    	margin-left: 28%;
		  
		  display: flex;
		  justify-content: space-between;
		  align-items: center; 
		  justify-content: center;
		 	width: 693px;
		 	height: 500px;
		  
		}
.container button{
		text-align: center;
		
		
	    width: 225px;
  			 height: 201px;
		
	

}
 .test_btn1{
            border-top-left-radius: 55px;
            border-bottom-left-radius: 55px;
            border-top-right-radius: 55px;
            border-bottom-right-radius: 55px;  
            margin-right: 80px;
            
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 28px
            
        }
       
        .test_btn1{
           border: 1px solid #3a4ca8;
            background-color: #3a4ca8;
            color: white;
            /* padding: 60px 30px 66px 26px; */
            font: 'Noto Sans KR', sans-serif;
        }
        .test_btn1:hover{
        	border: 1px solid #4e5da5;
            color:white;
            background-color: #4e5da5;
        }
        
  		.test_btn2{
            border-top-left-radius: 55px;
            border-bottom-left-radius: 55px;
            border-top-right-radius: 55px;
            border-bottom-right-radius: 55px;  
            
            
             font-family: 'Noto Sans KR', sans-serif;
             font-size: 28px;
            
        }
       
        .test_btn2{
             border: 1px solid #fd9f28;
            background-color: #fd9f28;
            color: white;
            /* padding: 60px 30px 66px 26px; */
            font: 'Noto Sans KR', sans-serif;
        }
        .test_btn2:hover{
        	border: 1px solid #f9af52;
            color:white;
            background-color: #f9af52;
        }
       
		
		
        
  
</style>
</head>
<body>
<jsp:include page="joinGnb.jsp"/>
<div class="container">
  <button onclick="location.href='userJoin.go'" class="test_btn1">
		일반 회원가입
	</button>
	<button onclick="location.href='riderJoin.go'" class="test_btn2">
		라이더 회원가입
	</button>
</div>
	
</body>
</html>