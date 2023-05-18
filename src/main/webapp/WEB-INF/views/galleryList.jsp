<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <jsp:include page="realGnb.jsp"/> --%>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.min.js" type="text/javascript"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Free open source Tailwind CSS Store template">
<meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">

<style>
table, th, td{
	border: 1px black solid;
	border-collapse: collapse;
	padding: 5px 10px;	
}
b{
	color:red;
}
#paging{
	text-align: center;
}
/* 템플릿 */
.work-sans {
    font-family: 'Work Sans', sans-serif;
}
        
#menu-toggle:checked + #menu {
    display: block;
}

.hover\:grow {
    transition: all 0.3s;
    transform: scale(1);
}

.hover\:grow:hover {
    transform: scale(1.02);
}

.carousel-open:checked + .carousel-item {
    position: static;
    opacity: 100;
}

.carousel-item {
    -webkit-transition: opacity 0.6s ease-out;
    transition: opacity 0.6s ease-out;
}

#carousel-1:checked ~ .control-1,
#carousel-2:checked ~ .control-2,
#carousel-3:checked ~ .control-3 {
    display: block;
}

.carousel-indicators {
    list-style: none;
    margin: 0;
    padding: 0;
    position: absolute;
    bottom: 2%;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 10;
}

#carousel-1:checked ~ .control-1 ~ .carousel-indicators li:nth-child(1) .carousel-bullet,
#carousel-2:checked ~ .control-2 ~ .carousel-indicators li:nth-child(2) .carousel-bullet,
#carousel-3:checked ~ .control-3 ~ .carousel-indicators li:nth-child(3) .carousel-bullet {
    color: #000;
    /*Set to match the Tailwind colour you want the active one to be */
</style>
</head>
<body>
	<div class="container mx-auto flex justify-end p-8">
		<div class="ml-60 text-2xl">
			<select class="focus:outline-none focus:ring-2 focus:ring-sky-600 w-45 text-gray-600 py-2 px-3 border border-gray-300 bg-white rounded-md" name="filter" id="filter">
				<option value="gallery_no">최신 순</option>
				<option value="gallery_hit">조회수 순</option>
			</select>
		</div>
	</div>	
    <section class="bg-white py-8">
		<div id="add_item" class="container mx-auto flex items-center flex-wrap pt-4 pb-12">
			<!-- 상품 들어가는 자리 -->
		</div>
	</section>	
	<!-- 	플러그인 사용	(twbsPagination)	-->
	<div class="container">									
		<nav aria-label="Page navigation" style="text-align:center">
			<ul class="pagination" id="pagination"></ul>
		</nav>					
	</div>
</body>
<script>
//기본값으로 1번 페이지를 설정한다.
var showPage = 1;

listCall(showPage);

// 게시물 갯수를 5 - 10 - 15 - ... 변경될 때마다 listCall을 해줘야 함. (15개로 고정되어 있음.)
$('#filter').change(function(){
	listCall(showPage);	
	// 페이지 총 갯수가 이미 만들어져 있어서 pagePerNum이 변경되면 수정이 안되는 문제가 있다.
	// 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
	// 밑에 만들어진 paging plugin을 부수기
	$('#pagination').twbsPagination('destroy');
});

function listCall(page){
	var filterName = document.getElementById('filter').value;
	
	$.ajax({
		
		type: 'post',
		url: 'galleryList.ajax',
		data: {
			'page':page,
			'cnt':6,
			'filterName':filterName
		},
		dataType: 'json',
		success:function(data){
			console.log(data);
			listPrint(data.filteredList);
			
			// 페이징을 구현하기 위해 알아야 되는 것(단순 플러그인만 쓰면 페이징 제대로 안됨)
			// 총 페이지 수, 현재 페이지
			
			//paging plugin
			$('#pagination').twbsPagination({
				startPage:data.currPage,		//시작페이지
				totalPages:data.pages,	//총 페이지 수
				visiblePages:5,		//보여줄 페이지 [1][2][3][4][5]
				onPageClick:function(event,page){//페이지 클릭 시 동작되는 콜백함수
					console.log(event,showPage);
					//중간정도 페이지에서 게시물 갯수를 변경하면 1페이지로 초기화되는 문제가 있다.
					//listCall 시에 초기값 1로 설정해 둔 showPage를 현재 페이지로 변경한다.
					
					if(page != showPage){
						showPage = page;
						listCall(page);
					}
					
				}
			});
			
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
}

function listPrint(list){
	// 제이쿼리 셀렉터는 each를 쓰고, JS는 forEach 씀
	// JS는 인덱스 생략이 가능하기 때문에 item, idx 중에 안받을 수도 있는데
	// each는 다 받아야 됨.
	var content = '';
	
	//java.sql.Date는 js에서 읽지 못해 밀리세컨드로 반환한다.
	//해결방법 1. DTO에서 Date를 toString으로 변환하는 방법(JAVA)
	//해결방법 2. JS에서 변환하는 방법
	list.forEach(function(item, idx){
		
		content += '<div class="w-full md:w-1/2 xl:w-1/3 p-6 flex flex-col">';
		content += '<div class="pt-3 flex items-center justify-between">';

		content += '<p class="">'+item.store_name+'</p>';
		content += '</div>';
		content += '<a href="galleryDetail.do?gallery_no='+item.gallery_no+'">';
		if(item.new_photo_name == null){
			content += '<img class="hover:grow hover:shadow-lg rounded-lg" src="resources/img/defaultIMG.png">';
		}else{
			content += '<img class="hover:grow hover:shadow-lg rounded-lg" src="/photo/'+item.new_photo_name+'">';
		}
		content += '</a>';
		
		content += '<a href="galleryDetail.do?gallery_no='+item.gallery_no+'">'+item.gallery_subject+'</a>';
		content += '<div class="pt-3 flex items-center justify-between">';
		content += '<p class="">'+item.nickname+'</p>';
		
		let milliseconds = item.gallery_date;
		let date = getFormatDate(new Date(milliseconds));
		
		content += '<p class="">'+date+'</p>';
		content += '</div>';
		content += '</a>';
		content += '</div>';
	});
	
	$('#add_item').empty();
	$('#add_item').append(content);
	
}

function getFormatDate(date){
	
	var year = date.getFullYear();
	var month = (1 + date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0' + day;
	
	return year + '-' + month + '-' +day;
}
</script>
</html>