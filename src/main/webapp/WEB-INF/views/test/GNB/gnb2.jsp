<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul id="gnb">
	<li><a href="#main">Main</a></li>
   	<li><a href="#sub">Sub</a></li>
   	<li><a href="#usage">Usage</a></li>
   	<li><a href="#help">Help</a></li>
</ul>


<div id="WrapDiv">
<div id="main">
	<h1> Main </h1>
    <!-- Contents -->
</div>

<div id="Sub">
	<h1> Sub </h1>
    <!-- Contents -->
</div>
</div>
.
.
.

</body>
<script>
(function ($) {
    $(document).ready(function () {
    	//set  gnb UL element
        var oUl$ = $('ul#gnb');

        oUl$.gnb({
            wrapper: '#WrapDiv', //selector name that wrap contents DIVs
            duration:700,           //scroll animate during time , default 1000
            activeclass: 'on'        // class name that active menu item , default 'active'
        });
    });
})(jQuery);

</script>
</html>