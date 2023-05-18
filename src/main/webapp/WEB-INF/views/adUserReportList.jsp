<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="realGnb.jsp"/>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.min.js"></script>
</head>
<body>
<jsp:include page="adminbox.jsp"/>
	
<article>

	<h2 style="color: #708090;">회원 신고 목록</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
		<form>
			<label for="myCheck">처리상태</label> &nbsp
      <input type="checkbox" id="myCheck" value="all" onclick="myFunction()">전체
      <input type="checkbox" id="myCheck" value="normal" onclick="myFunction()">처리대기
      <input type="checkbox" id="myCheck" value="verified" onclick="myFunction()">처리완료
    </form>
    
    
    <form>
      <label for="search-word">조회</label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="id">아이디</option>
        <option value="nickname">닉네임</option>
      </select>
      <input type="text" id="search-word" name="search-word">
      <input type="submit" value="검색">
    </form>
    
		<table class = "mokrok">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>회원분류</th>
				<th>회원상태</th>
				<th>신고내용</th>
			</tr>
		</thead>
<%-- 		<tbody id="list">
			<c:forEach items="${ureportlist}" var="ureportlist" varStatus="status">
      <tr>
      	<td>${ureportlist.report_no}</td>
        <td>${ureportlist.user_id}</td>
        <td>${ureportlist.nickname}</td>
        <td>${ureportlist.user_div_name}</td>
        <td>${ureportlist.user_state}</td>
        <td><a href='detail.ureport.do?report_no=${ureportlist.report_no}'>상세보기</a>
				</td>
       </tr>
        </c:forEach>

  </tbody> --%>
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


</article>
<script>

var showPage = 1;
listCall(showPage);


function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'ureport.ajax',
	      data:{
	         'page':page,

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

//list 받아와서 보여줌
function listPrint(list){
	   var content ='';
	   
	   list.forEach(function(item){
	      
	      // 배열 요소들 반복문 실행 -> 행 구성 + 데이터 추가 
	      content +='<tr>';
	      content +='<td>'+item.report_no+'</td>';
	      content +='<td id="userdiv">'+item.user_id+'</td>';
	      content +='<td id="userdiv">'+item.nickname+'</td>';
	      content +='<td id="userdiv">'+item.user_div_name+'</td>';
	      content +='<td id="userdiv">'+item.user_state+'</td>';
	      content +='<td id="subject"><a href="detail.ureport.do?report_no='+ item.report_no +'">' + "상세보기" + '</a></td>';
	      content +='</tr>';
	      
	   });
	   
	   // list 요소의 내용 지우고 추가 - 페이징 처리 
	   $('#list').empty();
	   $('#list').append(content);
	}


</script>

</body>



</html>