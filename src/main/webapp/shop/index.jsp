<%--
  Created by IntelliJ IDEA.
  User: 楠
  Date: 2018/9/23
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>前台主页</title>
</head>
<body>
这是前台主页
<a href="<%=basePath%>shop/login">点击进入前台登录</a>
</body>
</html>
