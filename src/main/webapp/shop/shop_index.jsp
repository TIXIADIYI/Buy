<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>主页</title>
</head>
<body>
<a href="<%=basePath%>shop/login">点击进入登录</a>
</body>
</html>
