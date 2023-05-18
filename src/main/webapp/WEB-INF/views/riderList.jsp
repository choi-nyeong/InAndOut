<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="realGnb.jsp"/>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	.main-box{
		border: 1px solid black;
		width: 40%;
		margin-bottom: 10px;
		border-radius: 10px;
		margin-left: 10px;
	}
	.button-box{
	}
	.tag_top{
		margin-left: 10px;
	}
	img{
		border-radius: 10px;
	}
</style>
</head>
<body>
	<div id="list"> 
	
	</div>
	<div class="container">                           
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
		      url:'riderList.ajax',
		      data:{
		         'page':page,
		         'cnt':cnt
		      },
		      dataType:'json',
		      success:function(data){
		         console.log(data);
		         console.log("성공");
		         myroutlistPrint(data.list);
		         
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
		   content += '<h2 class="tag_top">'+ '라이더 리스트' + '</h2>';
		   // java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
		   // 해결방법 1. DTO 에서 Date 를 String 으로 반환
		   // 해결방법 2. js 에서 변환
		   list.forEach(function(item, idx){
			   content += '<div class="main-box">';
			   content += '<div>';
			   content += '<a onclick="location.href=\'riderForm\'">';
			   if (item.new_photo_name == null) {
			       content += '<img  width="50" src="resources/photo/프로필 기본.png"/>' + item.nickname + '&nbsp;님';
			   } else {
			       content += '<img  width="50" src="resources/photo/' + item.new_photo_name + '"/>' + item.nickname + '&nbsp;님';
			   }
			   content += '</a>';
			   content += '</div>';
			   if (item.store_time == null) {
			   		content += '<div>' + item.sido + ' ' + item.sigungu + ' / ' + '7am~7pm' + '</div>';
			   } else {
				   content += '<div>' + item.sido + ' ' + item.sigungu + ' / ' + item.store_time + '</div>';
			   }
			   content += '<div class="button-box">';
			   content += '<button onclick="location.href=\'userOffer.do?rider_id=' + item.user_id + '&sales_no=4\'">견적신청</button>';
			   content += '</div>';
			   content += '</div>';
		   });
		   $('#list').empty();
		   $('#list').append(content);
		}

</script>
</html>