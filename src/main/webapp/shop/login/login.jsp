<%--
  Created by IntelliJ IDEA.
  User: 楠
  Date: 2018/9/24
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>前台登录页面</title>
    <script language="JavaScript" src="<%=basePath%>shop/js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
             $("#button").click(function() {
                 $.post("<%=basePath%>shop/login/post",
                     $("#loginform").serialize(),
                     function (data) {
                         if(data=="1"){
                             alert("登录成功");
                         }else{
                             alert("登录失败，账号或密码错误");
                         }
                     });
             }
        )
        });
    </script>
</head>
<body>
前台登录页面
<form id="loginform">
账号:<input type="text" name="user">
密码:<input type="password"  name="pass">
    <input type="button" id="button" value="登录">
</form>
</body>
</html>
