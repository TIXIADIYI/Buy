<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en" >

<head>
<meta charset="UTF-8">
<title>colorchange SVG animation</title>



<link rel="stylesheet" href="<%=basePath%>shop/css/style2.css">


</head>

<body>

<svg viewBox="0 0 100 100">
    <g class="group">
        <circle class="big" cx="50" cy="50" r="70.4" />
        <path class="p1" d="M 50.1,55 A 5 5 0 1 0 50,55 " />
        <path class="p2" d="M 65,50.1 A 15 15 0 1 1 65,50 " />
        <path class="p3" d="M 50,25 A 25 25 0 1 0 50,75 " />
        <path class="p4" d="M 50,25 A 25 25 0 0 1 50,75 " />
        <path class="p5" d="M 15,50 A 35 35 0 1 1 15,50.1 " />
        <path class="p6" d="M 50,5 A 45 45 0 1 0 50.1,5 " />
        <path class="p7" d="M 50,-5 A 55 55 0 1 0 50.1,-5 " />
        <path class="p8" d="M 50,-15 A 65 65 0 1 0 50.1,-15 " />
    </g>
</svg>

<div class="logo">
<img src="<%=basePath%>shop/images/arrow.png" width="100%" id="arrow" >
<img src="<%=basePath%>shop/images/icon.png" width="100%" id="icon">
<img src="<%=basePath%>shop/images/letter.png" width="100%" id="letter" >
</div>
<script>
    setTimeout( function(){
        var arrow = document.getElementById("arrow");
        arrow.style.display="block";
    }, 2 * 500 );
    setTimeout( function(){
        var icon = document.getElementById("icon");
        icon.style.display="block";
    }, 2000 );
    setTimeout( function(){
        var letter = document.getElementById("letter");
        letter.style.display="block";
    }, 2500 );
setTimeout("location.href = '<%=basePath%>shop/index'",2800)
</script>
</body>

</html>
