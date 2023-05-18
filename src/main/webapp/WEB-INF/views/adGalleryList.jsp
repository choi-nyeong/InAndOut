<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="realGnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="adminbox.jsp"/>
	
	<article>
	<h2 style="color: #708090;">갤러리목록</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">

		<!-- 검색 -->
			<form>
	      <label for="search-word">   
	      검색어 
	      </label>
	      &nbsp&nbsp&nbsp
	      <select name="search-type">
	        <option value="id">아이디</option>
	        <option value="nickname">닉네임</option>
	        <option value="subject">제목</option>
	        <option value="store-name">상호명</option>
	      </select>
	      <input type="text" id="search-word" name="search-word">
	      <input type="submit" value="검색">
    </form>
    
    
    <button onclick="blind()">블라인드</button>
    <button onclick="noblind()">블라인드 해제</button>

    
   <!-- 표 -->
   <div>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="all"/></th>
					<th>번호</th>
					<th>제목</th>
					<th>상호명</th>
					<th>아이디</th>
					<th>등록일자</th>
					<th>갤러리 상태</th>
					<th>히스토리</th>
				</tr>
			</thead>
<%-- 			<tbody>
			<c:forEach items="${glist}" var="gallery">
	      <tr>
	      	<td><input type="checkbox"/></td>
	        <td>${gallery.gallery_no}</td>
	        <td>${gallery.gallery_subject}</td>
	        <td>${gallery.store_name}</td>
	        <td>${gallery.user_id}</td>
	        <td>${gallery.gallery_date}</td>
	        <td><button onclick="window.open('history.go?id=${gallery.gallery_no}')">히스토리</button>
					</td>
	       </tr>
	     </c:forEach>
	
	 	 		</tbody>	 --%>	
	 	 		
			<tbody>
			
				<tbody id="list">
		
		
		  	</tbody>
		
         <tr>
           <th colspan="8 id="paging">  
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
listCall(showPage);


function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'gallery.ajax',
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
	   
	   list.forEach(function(item,index){
	      
	      // 배열 요소들 반복문 실행 -> 행 구성 + 데이터 추가 
	      content +='<tr>';
	      content +='<td><input type="checkbox" name="check"></td>';
	      content +='<td>'+item.gallery_no+'</td>';
	      content +='<td id="userdiv"><a href="galleryDetail.do?gallery_no='+ item.gallery_no +'">' + truncateString(item.gallery_subject, 16) + '</a></td>';
	      content +='<td>'+item.store_name+'</td>';
	      content +='<td>'+item.user_id+'</td>';
	      var date = new Date(item.gallery_date);
          content += '<td>' + date.toLocaleDateString('ko-KR')+'</td>';
	        if (item.blind == 1) {
	            content += '<td>블라인드</td>';
	        } else {
	            content += '<td>정상</td>';
	        }
	      content +='<td id="subject"><a href="history.go?gallery_no='+ item.gallery_no +'">' + "상세보기" + '</a></td>';

	      content +='</tr>';
	      
	   });
	   
	   // list 요소의 내용 지우고 추가 - 페이징 처리 
	   $('#list').empty();
	   $('#list').append(content);

	   
	   
	}
	   $('#all').click(function(e){
	   var $chk = $('input[type="checkbox"]');
	   	
	   if($(this).is(':checked')){
	      $chk.prop('checked',true);
	   }else{
	      $chk.prop('checked',false);
	   }
		console.log($chk);
	 
  
	   });
	   
	   

	   
	   function blind(){
			
		   var checkBoxArr = [];
			// 체크박스중에서 체크 된 놈 가져올 것 
			 $("input:checkbox[name='check']:checked").each(function() {
				 checkBoxArr.push($(this).val()); 
				 console.log(checkBoxArr);
			})
			
			  $.ajax({
			      type : "POST",
			      url : "/blind.ajax",
			      data: {
			      checkBoxArr:checkBoxArr   
			      },
			      success: function(result){
			      	console.log(result);
			      },
			      error: function(xhr, status, error) {
			      	alert(error);
			      }  
			   });
			}			
				 
				 
	   function truncateString(str, maxLength) {
		    if (str.length > maxLength) {
		        return str.substring(0, maxLength) + "...";
		    }
		    return str;
		}
			 
				 
				 
				 
				 
		 
				 
		
	   
			</script>
</html>