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
	<article>
<h2 style="color: #708090;">카테고리 목록 - 업종별</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">					
	
		<section class="wrapper">
		<!-- 검색 -->
		<form action="ad.search.do" method="get">
		    <label for="search-word">카테고리</label>
		    &nbsp&nbsp&nbsp
		    <input type="radio" name="category" value="업종별"/> 업종별
		    <input type="radio" name="category" value="물품별"/> 물품별
		
		    <button type="submit">검색</button>
		</form>

    <br/>
   <!-- 표 -->
   <div>
		<table>
			<thead>
				<tr>
					<th>업종별 기호</th>
					<th>카테고리명</th>
					<th>비고</th>

				</tr>
			</thead>
<%-- 			<tbody>
			<c:forEach items="${categorylist}" var="biz" varStatus="status">
	      <tr>
	      	<td><input type="checkbox"/></td>
	      	<td>${status.count}</td>
	        <td>${biz.biz_id}</td>
	        <td>${biz.biz_name}</td>
						
	        <td><button onclick="window.open('history.go?id=${gallery.gallery_no}')">히스토리</button>
					</td>
	       </tr>
	     </c:forEach>
	
	 	 		</tbody>		 --%>
	 	 		
			<tbody>
			
				<tbody id="list">
		
		
		  	</tbody>
		
         <tr>
           <th colspan="5" id="paging">  
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
		<button onclick="location.href='ad.catewrite.go'">등록</button>			
		</section>
	</article>

</body>

<script>
var showPage = 1;
listCall(showPage);


function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'category.ajax',
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
	      content +='<td>'+item.biz_id+'</td>';
	      content +='<td id="userdiv">'+item.biz_name+'</td>';
	      content +='<td id="subject"><a href="ad.goodsupdate.go?goods_id='+ item.goods_id +'">' + "수정" + '</a></td>';
	      content +='</tr>';
	      
	   });
	   
	   // list 요소의 내용 지우고 추가 - 페이징 처리 
	   $('#list').empty();
	   $('#list').append(content);
	}
	
	


</script>

</html>