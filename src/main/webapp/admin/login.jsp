<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="<%=basePath%>admin/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<title>柳橙汁二手交易平台管理系统</title>
  <script language="JavaScript" src="<%=basePath%>admin/js/jquery.js"></script>
  <script type="text/javascript">
      $(document).ready(function(){
          $("#button").click(function() {
                  $.post("<%=basePath%>admin/login/post",
                      $("#adminlogin").serialize(),
                      function (data) {
                          if(data=="1"){
                              alert("登录成功");
                              location.href="<%=basePath%>admin/index";
                          }else if(data=="2"){
                              alert("登录失败，填写不完整");
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
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" id="adminlogin" method="post">
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-8">
          <input id="" name="name" type="text" placeholder="管理员账户" class="input-text size-L" value="admin">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-8">
          <input name="pass" type="password" placeholder="管理员密码" class="input-text size-L" value="123456">
        </div>
      </div>

      <div class="row">
        <div class="formControls col-8 col-offset-3">

        </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <input name="" type="button" id="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" style="float: right;" value="&nbsp;返&nbsp;&nbsp;&nbsp;&nbsp;回&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 柳橙汁二手交易平台管理系统</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>
</html>