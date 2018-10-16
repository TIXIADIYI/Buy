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
    <title>测试主页</title>
</head>
<body>
总主页、分支主页（用于进入前、后台）
<br>
<a href="<%=basePath%>shop">点击进入前台主页</a>
<br>
<a href="<%=basePath%>admin/login">点击进入后台登录</a>
</body>
</html>
