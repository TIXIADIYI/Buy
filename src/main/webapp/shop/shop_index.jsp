<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<a href="<%=basePath%>shop/login">点击进入登录</a>

<h1>商品列表</h1>
<table border="1">
    <tr>
        <th>图片</th>
        <th>名称</th>
        <th>价格</th>
        <th>介绍</th>
        <th>库存</th>
        <th>上架时间</th>
        <th>点击数</th>
        <th>分类</th>
    </tr>
<c:forEach items="${requestScope.product}" var="product" >
    <tr>
        <td>${product.image}</td>
        <td>${product.name}</td>
        <td>${product.price}</td>
        <td>${product.remake}</td>
        <td>${product.sum}</td>
        <td>${product.time}</td>
        <td>${product.click}</td>
        <td>${product.product_type_id.name}</td>
    </tr>
</c:forEach>
</table>
</body>
</html>
