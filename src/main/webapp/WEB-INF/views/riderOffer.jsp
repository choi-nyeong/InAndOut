<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라이더 제한하기</title>
<jsp:include page="realGnb.jsp"/>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link href="resources/css/home.css" rel="stylesheet">
<style>
	.main-box1 {
        border: 1px solid skyblue;
	    width: 50%;
	    border-radius: 10px;
	    margin-bottom: 10px;
	    margin-left: 30%;
	    padding: 10px;
    }

    .tag_top1 {
        margin-left: 40%;
	    color: skyblue;
	    width: 40%;
	    margin-bottom: 4%;
    }

    .main-box1 a {
        text-decoration: none;
        color: skyblue;
    }

    .main-box1 img {
        border-radius: 10px;
        margin-right: 5px;
    }
    
    .button-box{
    	position: absolute;
    	margin-left: 45%;
    	margin-top: -5%;
    }

    .hide-btn {
        background-color: lightgray;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        color: white;
        
    }
    .recognize{
    	background-color: skyblue;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        color: white;
        margin-bottom: 10px;
    }

   #list {
 		margin-top: 5%;
	}

    nav {
        margin-top: 20px;
    	margin-left: 45%;
    }
    .in {
        word-wrap: break-word;
    width: 10%;
    margin-left: 20%;;
    position: absolute;
    margin-top: -4%;
	}
	.out {
	    position: absolute;
    margin-left: 35%;
    margin-top: -4%;
    word-wrap: break-word;
    width: 10%;
	}
	.spanOUT {
    color: skyblue;
    position: absolute;
    margin-left: 32%;
    margin-top: -4%;
}
.spanIN{
	color: skyblue;
	position: absolute;
	margin-left: 17%;
    margin-top: -4%;
}
</style>
</head>
<body>
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
        <div class="content2">
        <c:choose>
        	<c:when test="${avg eq 0}">
           <img src="resources/img/dolphin0.png" style="width: 60px;"/>
           </c:when>
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
            <div class="parent">
              <div class="pfirst">제안요청</div>
              <div class="pthird">배송 진행</div>
                </div>
          <div class="child">
              <div class="cfirst">${rideroffer}</div>
              <div class="cthird">${riderdelivery}</div>
          </div>
    </div>
	
	<div id="list" > 
	
	</div>
	<div class="container1">                           
		<nav aria-label="Page navigation">
			<ul class="pagination" id="pagination"></ul>
		</nav>               
	</div>
	
</body>
<script>
		var myrouteshowPage = 1;
		var cnt = 5;
		myroutlistCall(myrouteshowPage);
		function myroutlistCall(page){
			   $.ajax({
			      type:'post',
			      url:'riderOffer.ajax',
			      data:{
			         'page':page,
			         'cnt':cnt
			      },
			      dataType:'json',
			      success:function(data){
			         console.log(data);
			         console.log("성공");
			         myroutlistPrint(data.list);
			         console.log(data.total);
			         document.getElementById("total").innerHTML = data.total; 
			         
			         // 총 페이지 수
			         // 현재 페이지
			         
			         //paging plugin
			         $('#pagination').twbsPagination({
			            startPage:data.currPage,      // 시작페이지
			            totalPages:data.pages,   // 총 페이지 수
			            visiblePages:5,   // 보여줄 페이지[1][2][3][4][5]
			            onPageClick:function(event,page){// 페이지 클릭시 동작되는 함수(콜백)
			               console.log(page, myrouteshowPage);
			               if (page != myrouteshowPage) {
			                  myrouteshowPage = page;
			                  myroutlistCall(page);
			                  }               
			            }
			         });
			      },
			      error:function(e){
			         console.log(e);
			      }
			   });
			}
		function myroutlistPrint(list,idx){
			var content='';
			content +='<h2 class="tag_top1">'+'총 '+'<span id="total">' +'</span>'+'건의 배송 제안 요청이 있어요.'+'</h2>';
			// java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
			// 해결방법 1. DTO 에서 Date 를 String 으로 반환
			// 해결방법 2. js 에서 변환
			list.forEach(function(item, idx){
			content += '<div class="main-box1">';
		    content += '<div>';
		    content += '<a href="riderOfferDetail?delivery_offer_no=' + item.delivery_offer_no + '">';
		    if (item.new_photo_name == null) {
		        content += '<img width="50" src="resources/photo/프로필 기본.png"/>' + item.nickname + '&nbsp;님';
		    } else {
		        content += '<img width="50" src="resources/photo/' + item.new_photo_name + '"/>' + item.nickname + '&nbsp;님';
		    }
		    content += '</a>';
		    content += '</div>';
		    content += '<div class="subject" style="color:skyblue;">' + item.subject + '</div>';
		    content += '<div class="delivery_offer_no" style="color:skyblue;">배송제안번호 : ' + item.delivery_offer_no + '</div>';
		    content += '<span class="spanIN">IN</span><div class="in" style="color:skyblue;">' + item.from_addr + '</div>';
		    content += '<span class="spanOUT">OUT</span><div class="out" style="color:skyblue;"> ' + item.to_addr + '</div>';
		    content += '<div class="button-box">';
		    content += '<button class="recognize" onclick="location.href=\'deliveryState.do?idx=' + item.delivery_offer_no + '\'">승인</button>';
		    content += '<div><button class="hide-btn" onclick="location.href=\'deliveryNone.do?idx=' + item.delivery_offer_no + '\'">거절</button></div>';
		    content += '</div>';
		    content += '</div>';
		});
		$('#list').empty();
		$('#list').append(content);
	}
</script>
</html>