<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="realGnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.min.js"></script>
</head>

<body>
<jsp:include page="adminbox.jsp"/>
<%--  <jsp:include page="realGnb.jsp"/>--%>
<article>
	

	<h2 style="color: #708090;">회원 목록</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
	
	

	<div id="content">
		<label> 회원분류</label> &nbsp
	   <label><input type="checkbox" name="user_div" value="default">전체</label>
	   <label><input type="checkbox" name="user_div" value="일반">사용자(일반)</label>
	   <label><input type="checkbox" name="user_div" value="인증">사용자(인증)</label>
	   <label><input type="checkbox" name="user_div" value="라이더">&라이더</label>
	   <label><input type="checkbox" name="user_div" value="관리자">관리자</label>
		
		<br/>
		

    
		<div class="search-container">
					회원검색 &nbsp 
		    <input type="text" id="searchInput" placeholder="제목 또는 작성자를 입력">
		    <button id="searchButton"><alt="Search">검색</button>
		</div>

 
		<table class = "mokrok">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>회원분류</th>
					<th>회원상태</th>
					<th>상세보기</th>
				</tr>
			</thead>
		
			<tbody>
			
				<tbody id="list">
		
		
		  	</tbody>
		
         <tr>
           <th colspan="6" id="paging">  
             <div class="container">                  
               <nav aria-label="Page navigation">
                 <ul class="pagination justify-content-center" id="pagination"></ul>
               </nav>
             </div>
           </th>
         </tr>				
	

  		</tbody>  	
	
	</table>

	</div>
</article>


</body>

<script>

var showPage = 1;
var checkuserdiv ='default';
var checkuserstate ='default';
var searchText = 'default';
// console.log(checked);
listCall(showPage);

//검색어에 따른 출력 
$('#searchButton').click(function(){
   //검색어 확인 
   searchText = $('#searchInput').val();
   listCall(showPage);
   searchText = 'default';
   $('#pagination').twbsPagination('destroy');
});


//회원분류에 따른 출력 
$('input[name="user_div"]').click(function(){
   var checkedValues = [];
   $('input[name="user_div"]:checked').each(function() {
      checkedValues.push($(this).val());
   });
   checkuserdiv = checkedValues;
   listCall(showPage);
   $('#pagination').twbsPagination('destroy');
});

// 회원상태에 따른 출력
$('input[name="user_state"]').click(function(){
   var checkedValues = [];
   $('input[name="user_state"]:checked').each(function() {
      checkedValues.push($(this).val());
   });
   checkuserstate = checkedValues;
   listCall(showPage);
   $('#pagination').twbsPagination('destroy');
});


/* // 회원분류에 따른 출력 
$('input[name="user_div"]').change(function(){
	checkuserdiv = $(this).val();
   console.log(selectedSort);
   listCall(showPage);
  $('#pagination').twbsPagination('destroy');
});

// 회원상태에 따른 출력
$('input[name="user_state"]').change(function(){
	checkuserstate = $(this).val();
   console.log(selectedSort);
   listCall(showPage);
  $('#pagination').twbsPagination('destroy');
}); */


function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'list.ajax',
	      data:{
	         'page':page,
					 'userdiv':checkuserdiv,
					 'userstate':checkuserstate,
	         'search':searchText
	      },
	      dataType:'json',           
	      success:function(data){
	         console.log(data);
	         listPrint(data.list);
	         
	         // 페이징 처리를 위해 필요한 데이터
	         // 1. 총 페이지의 수
	         // 2. 현재 페이지
	         console.log(data.list); // arraylist 로 값 들어옴
	         
	         // Paging Plugin (j-query의 기본기능을 가지고 만들었기 때문에  plugin)
	         $('#pagination').twbsPagination({
	         startPage:1, // 시작 페이지
	         totalPages:data.pages,// 총 페이지 수 
	         visiblePages:5,// 보여줄 페이지
	         onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
	            console.log(page,showPage);
	            if(page != showPage){
	               showPage=page;
	               listCall(page);
	          
	            }
	         }
	         });
	      }
	   });
	}

// list 받아와서 보여줌
function listPrint(list){
	   var content ='';
	   
	   list.forEach(function(item){
	      
	      // 배열 요소들 반복문 실행 -> 행 구성 + 데이터 추가 
	      content +='<tr>';
	      content +='<td>'+item.user_id +'</td>';
	      content +='<td>'+item.nickname+'</td>';
	      content +='<td id="userdiv">'+item.user_div_name+'</td>';
	      content +='<td id="userstate"> ' + item.user_state + '</td>';
	      content +='<td id="subject"><a href="ad.userdetail.do?user_id='+ item.user_id +'">' + "상세보기" + '</a></td>';
	      content +='</tr>';
	      
	   });
	   
	   // list 요소의 내용 지우고 추가 - 페이징 처리 
	   $('#list').empty();
	   $('#list').append(content);
	}







</script>


</html>