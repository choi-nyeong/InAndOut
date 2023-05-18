<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="realGnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Free open source Tailwind CSS Store template">
<meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">

<style>
#att_zone{
	width: 580px;
	min-height:150px;
	padding:10px;
	border:1px dotted gray;
}
#att_zone:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
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
}
</style>
</head>
<body>
	<div class="isolate bg-white px-6 py-24 sm:py-32 lg:px-8">
		<div class="absolute inset-x-0 top-[-10rem] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[-20rem]" aria-hidden="true">
			<div class="relative left-1/2 -z-10 aspect-[1155/678] w-[36.125rem] max-w-none -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%-40rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"></div>
	    </div>
	    <div class="mx-auto max-w-2xl text-center">
			<h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">판매글 수정</h2>
			<p class="mt-2 text-lg leading-8 text-gray-600">* 필수 입력 항목</p>
		</div>
	    <form action="salesUpdate.do" method="post" enctype="multipart/form-data" class="mx-auto mt-16 max-w-xl sm:mt-20">
			<div class="grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-2">
				<input type="text" name="sales_no" value="${detailData.sales_no }" readonly="readonly" hidden="true" required/>
				<input type="text" name="user_id" value="${detailData.user_id }" readonly="readonly" hidden="true" required/>
				<input type="text" name="nickname" value="${detailData.nickname }" readonly="readonly" hidden="true" required/>
				<div>
					<label for="biz" class="block text-sm font-semibold leading-6 text-gray-900">*업종별</label>
					<div class="mt-2.5">
						<div id="oldBiz">
						<span class="inline-block w-40 rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 sm:text-sm sm:leading-6">${detailData.biz_name }</span>
							<input type="button" value="변경" onclick="bizChange()" class="inline-block w-20 rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
						</div>
						<div id="newBiz">
						<!-- 새로운 업종별 출력자리 -->
						</div>
					</div>
				</div>
				<div>
					<label for="goods" class="block text-sm font-semibold leading-6 text-gray-900">*물품별</label>
					<div class="mt-2.5">
						<div id="oldGoods">
							<span class="inline-block w-40 rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 sm:text-sm sm:leading-6">${detailData.goods_name }</span>
						</div>
						<div id="newGoods">
						<!-- 새로운 물품별 출력자리 -->
						</div>
					</div>
		        </div>
		        <div class="sm:col-span-2">
					<label for="subject" class="block text-sm font-semibold leading-6 text-gray-900">*제목</label>
					<div class="mt-2.5">
						<input type="text" name="subject" value="${detailData.subject }" maxlength="29" onkeyup="counter(event, '30')" required class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
						<div>
							<span id="reCount">0 / 30</span>
						</div>
					</div>
		        </div>
		        <div class="sm:col-span-2">
					<label for="price" class="block text-sm font-semibold leading-6 text-gray-900">*가격</label>
					<div class="mt-2.5">
						<input type="number" name="price" value="${detailData.price }" required class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
					</div>
		        </div>
		        <div class="sm:col-span-2">
					<label for="price" class="block text-sm font-semibold leading-6 text-gray-900">*주소</label>
					<div class="mt-2.5">
						<div id="oldAddr">
						${detailData.sales_sido } ${detailData.sigungu } ${detailData.left_addr }
							<input type="button" id="change" value="변경" onclick="addrChange()" class="inline-block w-20 rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
						</div>
						<div id="newAddr">
						<!-- 새로운 주소창 -->
						</div>
					</div>
		        </div>
		        <div class="sm:col-span-2">
					<label for="content" class="block text-sm font-semibold leading-6 text-gray-900">*내용</label>
					<div class="mt-2.5">
						<textarea name="content" id="content" maxlength="299" onkeyup="counter(event, '300')" required rows="4" class="resize-none block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">${detailData.content }</textarea>
						<div>
							<span id="reCount">0 / 300</span>
						</div>
					</div>
				</div>
		        <div class="sm:col-span-2">
					<label for="photo" class="block text-sm font-semibold leading-6 text-gray-900">사진</label>
					<div class="mt-2.5">
						<div id='image_preview'>
							<input type="file" id="btnAtt" multiple="multiple" name="photo" accept="image/*"/>
							<div id="att_zone" data-placeholder="파일을 첨부 하려면 파일 선택 버튼을 클릭하세요."></div>
						</div>
					</div>
					<div class="mt-2.5">
						<div hidden="true" id="list">
							<input type="text" name="removeFileName" value="default"/>
						</div>
						<c:if test="${detailPhoto.size() > 0}">
							<c:forEach items="${detailPhoto}" var="i">
								<div style="display:inline-block;position:relative;width:150px;height:120px;margin:5px;border:1px dotted gray;z-index:1">
									<img style="width:100%;height:100%;z-index:none" src="/photo/${i}"/>
									<div hidden="true">${i}</div>
									<input type="button" value="x" style="width:30px;height:30px;position:absolute;font-size:24px;right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00" onclick="remove(event, this)">
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<div class="mt-10">
				<button type="submit" class="block w-full rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-500">등록</button>
				<input type="button" class="mt-4 block w-full rounded-md bg-gray-600 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-gray-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-600" onclick="location.href='./salesList.do'" value="리스트"/>
			</div>
		</form>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
		  imageView = function imageView(att_zone, btn){

		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
		    // 이미지안에 표시되는 체크박스의 속성
		    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
		                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
		  
		    btnAtt.onchange = function(e){
		      var files = e.target.files;
		      var fileArr = Array.prototype.slice.call(files)
		      for(f of fileArr){
		        imageLoader(f);
		      }
		    }  
		    
		  
		    // 탐색기에서 드래그앤 드롭 사용
		    attZone.addEventListener('dragenter', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		    }, false)
		    
		    attZone.addEventListener('dragover', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		      
		    }, false)
		  
		    attZone.addEventListener('drop', function(e){
		      var files = {};
		      e.preventDefault();
		      e.stopPropagation();
		      var dt = e.dataTransfer;
		      files = dt.files;
		      for(f of files){
		        imageLoader(f);
		      }
		      
		    }, false)
		    
		    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
		    imageLoader = function(file){
		      sel_files.push(file);
		      var reader = new FileReader();
		      reader.onload = function(ee){
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		        img.src = ee.target.result;
		        attZone.appendChild(makeDiv(img, file));
		      }
		      
		      reader.readAsDataURL(file);
		    }
		    
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		      var div = document.createElement('div')
		      div.setAttribute('style', div_style)
		      
		      var btn = document.createElement('input')
		      btn.setAttribute('type', 'button')
		      btn.setAttribute('value', 'x')
		      btn.setAttribute('delFile', file.name);
		      btn.setAttribute('style', chk_style);
		      btn.onclick = function(ev){
		        var ele = ev.srcElement;
		        var delFile = ele.getAttribute('delFile');
		        for(var i=0 ;i<sel_files.length; i++){
		          if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);      
		          }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		          var file = sel_files[f];
		          dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		        var p = ele.parentNode;
		        attZone.removeChild(p)
		      }
		      div.appendChild(img)
		      div.appendChild(btn)
		      return div
		    }
		  }
		)('att_zone', 'btnAtt')
		
function remove(evt, elem){
	
	console.log(elem);
	
	var fileName = $(elem).siblings('div').html();
	console.log(fileName);

	var content = '';
	
	content = '<input type="text" name="removeFileName" value="'+fileName+'"/>';
	
	$('#list').append(content);
	$(elem).closest('div').remove();
}

function addrChange(){

	$('#oldAddr').empty();
	
	var content = '';
	
	content += '<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly" required class="inline-block w-60 rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">';
	content += '<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="inline-block w-40 rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">';
	content += '<input type="button" id="back" value="취소" onclick="addrBack()" class="inline-block w-20 rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">';
	content += '<br>';
	content += '<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly="readonly" required class="mt-4 block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">';
	content += '<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" hidden="true">';
	content += '<input type="text" id="sido" name="sido" placeholder="시도" hidden="true" required>';
	content += '<input type="text" id="sigungu1" name="sigungu" placeholder="시군구" hidden="true" required>';
	content += '<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly="readonly" required class="mt-4 block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">';
	content += '<span id="guide" style="color:#999;display:none"></span>';
	content += '<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" class="mt-4 block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">';

	$('#newAddr').append(content);
}

function addrBack(){
	
	$('#newAddr').empty();
	
	var content = '';
	
	content += '${detailData.sales_sido } ${detailData.sigungu } ${detailData.left_addr }';
	content += '<input type="button" id="change" value="변경" onclick="addrChange()" class="inline-block w-20 rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">';
	
	$('#oldAddr').append(content);
}

function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('roadAddress').value = roadAddr;
            document.getElementById('jibunAddress').value = data.jibunAddress;
            
            //커스텀
            document.getElementById('sido').value = data.sido;
            document.getElementById('sigungu1').value = data.sigungu;            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById('extraAddress').value = extraRoadAddr;
            } else {
                document.getElementById('extraAddress').value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

function bizChange(){
	$('#oldBiz').empty();
	$('#oldGoods').empty();
	
	$.ajax({
		type: 'get',
		url: 'bizCall.ajax',
		data: {},
		dataType: 'json',
		success: function(data){
			console.log(data.bizList);
			if(data!=null){
				bizListDraw(data.bizList);
			}
		},
		error: function(e){
			console.log(e);
		}
	});

}

function bizListDraw(bizList){
	
	var content = '';

	content += '<select name="biz" id="biz" onchange="goodsCall()" class="h-10 w-60 rounded-md border-0 bg-transparent bg-none py-0 pl-4 pr-9 text-gray-400 ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm">';
	content += '<option value="default">--</option>';
	
	bizList.forEach(function(item, index){
		content += '<option value="'+item.biz_id+'">'+item.biz_name+'</option>';
	});
	
	content += '</select>';
	content += '<input type="button" id="back" value="취소" onclick="bizBack()" class="inline-block w-20 rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">';
	
	$('#newBiz').append(content);
}

function goodsCall(){
	console.log('change');
	$('#newGoods').empty();
	
	var elem = document.getElementById('biz');
	console.log(elem);
	var val = elem.value;
	console.log(val);
	
	$.ajax({
		type: 'get',
		url: 'goodsCall.ajax',
		data: {
			biz_id:val
		},
		dataType: 'json',
		success: function(data){
			console.log(data.goodsList);
			if(data!=null){
				goodsListDraw(data.goodsList);
			}
		},
		error: function(e){
			console.log(e);
		}
	});
}

function goodsListDraw(goodsList){
	
	var content = '';
	
	content += '<select name="goods" id="goods" class="h-10 w-60 rounded-md border-0 bg-transparent bg-none py-0 pl-4 pr-9 text-gray-400 ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm">';

	goodsList.forEach(function(item, index){
		content += '<option value="'+item.goods_id+'">'+item.goods_name+'</option>';
	});

	content += '</select>';
	
	$('#newGoods').append(content);
	
}

function bizBack(){
	$('#newBiz').empty();
	$('#newGoods').empty();
	
	var bizContent = '';
	
	bizContent += '<span class="inline-block w-40 rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 sm:text-sm sm:leading-6">${detailData.biz_name }</span>';
	bizContent += '<input type="button" value="변경" onclick="bizChange()" class="inline-block w-20 rounded-md bg-blue-500 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-blue-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">';
	
	var goodsContent = '';

	goodsContent += '<span class="inline-block w-40 rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 sm:text-sm sm:leading-6">${detailData.goods_name }</span>';
	
	$('#oldBiz').append(bizContent);
	$('#oldGoods').append(goodsContent);
}

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
</script>
</html>