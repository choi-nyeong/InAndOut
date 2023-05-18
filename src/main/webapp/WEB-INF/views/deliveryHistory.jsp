`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 히스토리</title>
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
	
	h2{
		
	}

    nav {
        margin-top: 20px;
    	margin-left: 36%;
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
	select.dv-list{
		margin-left: 30%;
    	margin-top: 6%;
	}
	.filer{
		margin-left: 30%;
	}
	.date {
    position: absolute;
    margin-left: 55%;
    margin-top: -5%;
}
.spanDelivery_state {
        position: absolute;
    margin-left: 73%;
    margin-top: -5%;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	<select class="dv-list" id="dv-ln" onchange="filtering()">
		<option>==선택==</option>
		<option value="배송접수">배송접수</option>
		<option value="배송중">배송중</option>
		<option value="배송완료">배송완료</option>
		<option value="배송실패">배송실패</option>
	</select>
	
		
	 <div id="list">
	 	<h2 class="filer">배송 필터링을 해주세요</h2>
	 	
	 </div>
	 
</body>
<script>
	
	function filtering(){
		console.log($(".dv-list").val());
		var val = $(".dv-list").val();
			$.ajax({
				type: 'post',
				url: 'filtering.ajax',
				data: {
					delivery_state:val
				},
				dataType: 'json',
				success: function(data){
					console.log("success");
					filtering1(data.list);
					document.getElementById("total").innerHTML = data.total; 
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	function filtering1(list,idx){
		var content='';
		content +='<h2 class="tag_top1">'+'총 '+'<span id="total">' +'</span>'+'건의 배송 이력이 필터링되었습니다.'+'</h2>';
		// java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
		// 해결방법 1. DTO 에서 Date 를 String 으로 반환
		// 해결방법 2. js 에서 변환
		list.forEach(function(item, idx){
			content += '<div class="main-box1">';
			content += '<div>';
			if (item.new_photo_name == null) {
			  content += '<img  width="50" src="resources/photo/프로필 기본.png"/>' + item.nickname + '&nbsp;님';
			} else {
			  content += '<img  width="50" src="resources/photo/' + item.new_photo_name + '"/>' + item.nickname + '&nbsp;님';
			}
			content += '</div>';
			
			content += '<div class="subject"> ' + item.subject + '</div>';
			content += '배송번호 : <span class="delivery_offer_no>' + item.delivery_accept_no + '</span>';
			content += '<div class ="to_addr" >배송지 ' + item.to_addr + '</div>';
			var date = new Date(item.delivery_time);
		    content += '<div class="date">' + date.toLocaleDateString('ko-KR') + ' ' + date.toLocaleTimeString('ko-KR') + '</div>';
			content += '<span class="spanDelivery_state">' + item.delivery_state + '</span>';
			content += '</div>';
			});
			$('#list').empty();
			$('#list').append(content);
	}
</script>
</html>