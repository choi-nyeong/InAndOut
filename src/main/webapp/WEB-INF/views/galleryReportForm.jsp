<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Free open source Tailwind CSS Store template">
<meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">

<style>
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
}
</style>
</head>
<body>
	<div class="isolate bg-white px-6 py-24 sm:py-32 lg:px-8">
		<div class="absolute inset-x-0 top-[-10rem] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[-20rem]" aria-hidden="true">
			<div class="relative left-1/2 -z-10 aspect-[1155/678] w-[36.125rem] max-w-none -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%-40rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"></div>
	    </div>
	    <div class="mx-auto max-w-2xl text-center">
			<h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">갤러리 신고</h2>
			<p class="mt-2 text-lg leading-8 text-gray-600">* 필수 입력 항목</p>
		</div>
		<div class="grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-2">
	        <div class="sm:col-span-2">
				<label for="subject" class="block text-sm font-semibold leading-6 text-gray-900">신고 갤러리 번호</label>
				<div class="mt-2.5">
					<input type="text" name="report_whom" id="report_whom" value="${gallery_no}" required readonly="readonly" class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
				</div>
	        </div>
	        <div class="sm:col-span-2">
				<label for="user_id" class="block text-sm font-semibold leading-6 text-gray-900">신고자</label>
				<div class="mt-2.5">
					<input type="text" name="user_id" id="user_id" value="${loginId}" required readonly="readonly" class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
				</div>
	        </div>
	        <div class="sm:col-span-2">
				<label for="report_reason" class="block text-sm font-semibold leading-6 text-gray-900">*내용</label>
				<div class="mt-2.5">
					<textarea name="report_reason" id="report_reason" maxlength="199" onkeyup="counter(event, '200')" required rows="4" class="resize-none block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
					<div>
						<span id="reCount">0 / 200</span>
					</div>
				</div>
			</div>
			<div class="mt-10">
				<input type="button" id="submit" value="제출" class="block w-full rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-500">
				<input type="button" class="mt-4 block w-full rounded-md bg-gray-600 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-gray-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-600" onclick="window.close()" value="닫기"/>
			</div>
		</div>
	</div>
</body>
<script>
function counter(event, limit){
	var val = event.target.value.length;
	var elem = $(event.target).siblings().find('span');
	console.log(val);
	console.log(limit);
	console.log(elem);
	if(val<=limit){
		elem.html(val + " / " + limit);
	}
}

$('#submit').click(function(){
	
	var report_whom = document.getElementById('report_whom').value;
	var user_id = document.getElementById('user_id').value;
	var report_reason = document.getElementById('report_reason').value;
	
	$.ajax({
		type: 'post',
		url: 'galleryReportWrite.ajax',
		data: {
			'report_whom':report_whom,
			'user_id':user_id,
			'report_reason':report_reason,
		},
		dataType: 'json',
		success: function(data){
			console.log(data.row);
			if(data.row==1){
				alert('신고되었습니다.');
				self.close();
			}
		},
		error: function(e){
			console.log(e);
			alert('실패했습니다. 다시 시도해 주세요.');
			self.close();
		}
	});
	
});

</script>
</html>