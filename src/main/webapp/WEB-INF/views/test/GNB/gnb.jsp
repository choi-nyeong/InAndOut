<!DOCTYPE html>
<html>
<head>
    <title>gnbNa.js Example Page</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script type="text/javascript" src="../gnb.js"></script>
    <script type="text/javascript">
        (function ($) {
            $(document).ready(function () {
                var oUl$ = $('ul#gnb');

                oUl$.gnb({
                    wrapper: '#WrapDiv',
                    duration:700,
                    activeclass: 'on'
                });
            });
        })(jQuery);
    </script>
    <style type="text/css">
        ul#gnb { float: left; position: fixed; left: 200px; top: 10px; }
        ul#gnb > li { float: left; margin-right: 20px; }
        ul#gnb > li.on { background-color: #5795e8;}

        div#WrapDiv > div { border: 1px solid #000; height: 800px; }
        div#menu1 { clear: left; }
    </style>
</head>
<body>


<h1>gnbNav.js Example</h1>
<ul id="gnb">
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
    <li><a href="#menu4">Menu 4</a></li>
</ul>
<div id="WrapDiv">
    <div id="menu1"><h2>Menu 1</h2></div>
    <div id="menu2"><h2>Menu 2</h2></div>
    <div id="menu3"><h2>Menu 3</h2></div>
    <div id="menu4"><h2>Menu 4</h2></div>
</div>
</body>
</html>