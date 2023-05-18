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
<jsp:include page="adModal.jsp"/>
<jsp:include page="adminbox.jsp"/>
	
<article>

	<h2 style="color: #708090;">판매글 목록</h2>
	<hr style="border-top-width:2px; border-color:#b0cbd6;">
    <!-- 카테고리 선택 -->
    <form>
      <label for="search-word">카테고리 </label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="all">전체</option>
        <option value="nickname">닉네임</option>
      </select>
       <select name="search-type">
        <option value="id">전체</option>
        <option value="nickname">닉네임</option>
      </select>  
      &nbsp&nbsp&nbsp
      <label for="search-word"> 판매지역 </label>
      &nbsp&nbsp&nbsp
      <select name="search-type">
        <option value="id">전체</option>
        <option value="nickname">닉네임</option>
      </select>
       <select name="search-type">
        <option value="id">전체</option>
        <option value="nickname">닉네임</option>
      </select>       
    </form>
    
   <input type="text" id="searchInput" placeholder="제목 또는 작성자를 입력">
   <button id="searchButton">검색</button>
     <br/>
	   <button id="blindBtn" onclick="deleteValue()">블라인드</button>
    <button onclick="vdeleteValue()">블라인드 해제</button>
    
		<table class = "mokrok">
		<thead>
			<tr>
				<th><input type="checkbox" name="allCheck"/></th>
				<th>번호</th>
				<th>제목</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>판매상태</th>
				<th>블라인드 여부</th>
				<th>등록일자</th>
				<th>히스토리</th>
			</tr>			
		</thead>
			<tbody>
			
				<tbody id="list">
		
		
		  	</tbody>
		
         <tr>
           <th colspan="9 id="paging">  
             <div class="container">                  
               <nav aria-label="Page navigation">
                 <ul class="pagination justify-content-center" id="pagination"></ul>
               </nav>
             </div>
           </th>
         </tr>				


<%-- 			<div id="myModal" class="modal">
		  <div class="modal-content">
			  	
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>처리자 ${loginId}</h2> <!-- 세션체크해서 로그인 한 놈 출력 -->
			      <input type = "text" name="report_id" value="${loginId}" hidden/>
			    </div>
			    <div class="modal-body">		    
				   		<input type = "text" name="sales_no" value="${user.sales_no}" hidden/>
		
			    	<p>처리사유</p>
			      <p><textarea name="report_content">${user.report_content}</textarea></p>
			
			    </div>
			    <div class="modal-footer">
					 <button onclick="deleteValue()" id="updateBtn" type="submit" class="btn btn-success">완료</button>
			    </div>
			  </div>
	
			</div> --%>		
  		</tbody> 			 	 		
			</table>

			
	
	</article>
</body>
<script>

var searchText = 'default';
var showPage = 1;
listCall(showPage);

//검색어에 따른 출력 
$('#searchButton').click(function(){
   //검색어 확인 
   searchText = $('#searchInput').val();
   listCall(showPage);
   searchText = 'default';
   $('#pagination').twbsPagination('destroy');
});

function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'adsales.ajax',
	      data:{
	         'page':page,
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
	
//list 받아와서 보여줌
function listPrint(list){
	   var content ='';
	   
	   list.forEach(function(item,index){
	      
	      // 배열 요소들 반복문 실행 -> 행 구성 + 데이터 추가 
	      content +='<tr>';
	      content += '<td class="checkbox"><input type="checkbox" name="Rowcheck" value="' + item.sales_no + '"></td>';

	      content +='<td>'+item.sales_no+'</td>';
	      content +='<td id="userdiv"><a href="salesDetail.do?sales_no='+ item.sales_no +'">' + truncateString(item.subject, 16) + '</a></td>';
	      content +='<td>'+item.user_id+'</td>';
	      content +='<td>'+item.nickname+'</td>';
	      if (item.sales_state === "판매중") {
	    	    content += '<td>판매중</td>';
	    	} else if (item.sales_state === "판매완료") {
	    	    content += '<td>판매완료</td>';
	    	} else if (item.sales_state === "삭제됨") {
	    	    content += '<td>삭제됨</td>';
	    	}
	        if (item.blind == 1) {
	            content += '<td>블라인드</td>';
	        } else {
	            content += '<td>정상</td>';
	        }

	      var date = new Date(item.date);
          content += '<td>' + date.toLocaleDateString('ko-KR')+'</td>';
	      content +='<td id="subject"><a href="shistory.go?sales_no='+ item.sales_no +'">' + "상세보기" + '</a></td>';

	      content +='</tr>';
	      
	   });
	   
	   // list 요소의 내용 지우고 추가 - 페이징 처리 
	   $('#list').empty();
	   $('#list').append(content);
	}

$(function(){
	var chkObj = $("input[name='Rowcheck']");
	var rowCnt = chkObj.length;

	  
	  $("input[name='allCheck']").click(function(){
	    var chk_listArr = $("input[name='Rowcheck']"); // 체크박스의 name 속성을 "Rowcheck"로 수정
	    for (var i=0; i<chk_listArr.length; i++){
	      chk_listArr[i].checked = this.checked;
	    }
	  });
	  $("input[name='Rowcheck']").click(function(){
	    if($("input[name='Rowcheck']:checked").length == rowCnt){ // 체크박스의 name 속성을 "Rowcheck"로 수정
	      $("input[name='allCheck']")[0].checked = true;
	    }
	    else{
	      $("input[name='allCheck']")[0].checked = false;
	    }
	  });
	});





function deleteValue(){
   // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	  var valueArr = []; // 빈 배열로 초기화

	  var slist = $("input[name='Rowcheck']:checked"); // 선택된 체크박스 요소들을 가져옴

	  if (slist.length === 0) {
	    alert("선택된 글이 없습니다.");
	    return; // 함수 종료
	  }
    else{
		var chk = confirm("블라인드 처리하시겠습니까?");	
		
	    // 선택된 체크박스의 값을 valueArr 배열에 추가
	    slist.each(function () {
	      valueArr.push($(this).val());
	    });
		
		$.ajax({
		    url :'ad.sblind',                    // 전송 URL
		    type : 'POST',                // GET or POST 방식
		    traditional : true,
		    data : {
		    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                    alert("블라인드 처리 완료");
                    location.replace("adsaleslist.do")
                }
                else{
                    alert("블라인드 처리 실패");
                }
            }
		});
		

		
	}
}
	
	// 체크 블라인드 해제 클릭 시 
function vdeleteValue(){
	   // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
		  var valueArr = []; // 빈 배열로 초기화

		  var slist = $("input[name='Rowcheck']:checked"); // 선택된 체크박스 요소들을 가져옴

		  if (slist.length === 0) {
		    alert("선택된 글이 없습니다.");
		    return; // 함수 종료
		  }
	    else{
			var chk = confirm("블라인드 해제 처리하시겠습니까?");	
			
		    // 선택된 체크박스의 값을 valueArr 배열에 추가
		    slist.each(function () {
		      valueArr.push($(this).val());
		    });
			
			$.ajax({
			    url :'ad.sNoblind',                    // 전송 URL
			    type : 'POST',                // GET or POST 방식
			    traditional : true,
			    data : {
			    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
			    },
	            success: function(jdata){
	                if(jdata = 1) {
	                    alert("블라인드 해제 완료");
	                    location.replace("adsaleslist.do")
	                }
	                else{
	                    alert("블라인드 해제 실패");
	                }
	            }
			});
			

			
		}
	}	


function truncateString(str, maxLength) {
	    if (str.length > maxLength) {
	        return str.substring(0, maxLength) + "...";
	    }
	    return str;
	}
   
	    
			</script>
</html>