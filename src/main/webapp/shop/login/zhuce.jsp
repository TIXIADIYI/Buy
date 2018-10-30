<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>注册交易网</title>
    <script src="../js/jquery-1.7.2.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/zccs.css">
    <script type="text/javascript" src="<%=basePath%>shop/js/jquery.min.js"></script>
    <script src="<%=basePath%>shop/js/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="<%=basePath%>shop/js/yanz.js"></script>
    <script src="<%=basePath%>shop/js/yanz1.js"></script>
    <script language="JavaScript" src="<%=basePath%>shop/js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#button").click(function () {
                    $.post("<%=basePath%>shop/login/zhuce",
                        $("#loginform").serialize(),
                        function (data) {
                            if (data == "1") {
                                alert("注册成功");
                            } else if (data == "2") {
                                alert("注册失败，未填写完整");
                            } else if (data == "3") {
                                alert("注册失败，该账号已存在");
                            } else if (data == "4") {
                                alert("注册失败，两次密码不一致");
                            } else {
                                alert("注册失败");
                            }
                        });
                }
            )
        });
    </script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/yanzheng.css">
    <link href="<%=basePath%>shop/css/style.css" rel="stylesheet"/>
    <link type="text/css" href="<%=basePath%>shop/css/base.css" rel="stylesheet"/>
    <link href="<%=basePath%>shop/css/style.css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=basePath%>shop/js/111.js"></script>

</head>

<body style="background: #f6f6f6">

<div class="wrapper" id="login_head" style="display:">
    <div class="log_head">
        <h1 class="log_logo left"><a href="javascript:;" style="width: 700px; ">
            <img src="<%=basePath%>shop/image/logo.png" width="80" height="80" align="middle">
            <span style="font-family: '隶书'; font-size: 30px;">欢迎您登录柳橙汁二手交易平台！</span></a></h1>
    </div>
</div>
<form id="loginform" method="post">
    <div class="login_wrap"
         style="width:; background:#fff url(<%=basePath%>shop/image/20161209115754_5628.jpg) no-repeat center top; padding:40px 0;">
        <div class="wrapper" id="login_body" style="width:;">
            <div class="log_ad" style="display:"><a href="javascript:;"></a></div>
            <div class="login_border" style="padding:8px;">
                <div class="login" style="display: block;">
                    <div style="position:absolute; right:30px; top:14px;">
                        <a href="<%=basePath%>shop/login/zhuce.jsp" target="_parent" class="login-on" style="font-size: 13px;">账号注册
                            <!--<em style="width:16px; height:16px; background:#999; float:right; color:#fff; border-radius:100%; text-align:center; line-height:16px; margin:1px 0 0 5px; font-family:'宋体'; font-weight:bold;">&gt;</em>-->
                        </a>
                    </div>
                    <ul class="login-tab">
                        <li ><a href="login.jsp" style="font-size: 14px;">普通登录</li> </a> 

                    </ul>
                    <div class="login-body">
                        <div class="login-style" style="display: block;">
                            <dl>
                                <dd>
                                	<img src="<%=basePath%>shop/image/iconfont-yonghu.png" style="position: absolute;">
                                <input name="user" type="text" id="txtUser" placeholder="请填写您的手机号"/></dd>
                            </dl>

                            <dl>
                            	<dd>
                            	<img src="<%=basePath%>shop/image/iconfont-psw.png" style="position: absolute;">
                                <input type="password" id="Userpwd" onKeyDown="enterHandler(event)"
                                           placeholder="请输入您的密码" name="pass"/></dd>
                            </dl>

                            <dl>
                            	<dd>
                            	<img src="<%=basePath%>shop/image/iconfont-psw.png" style="position: absolute;">
                                <input type="password" id="Userpwd" onKeyDown="enterHandler(event)"
                                           placeholder="再次确认您的密码" name="pass2"/></dd>
                            </dl>
                            <p>
                                <input checked="checked" id="inputacc" type="checkbox">
                                我已阅读并接受<a target="_blank" href="#">《用户服务协议》</a></p>
                            <div class="tishi"></div>
                            
                            <input id="button" type="button" value="同意协议并注册"/>
                        </div>
                    </div>

                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</form>
<div class="bottom">
    <div class="wrapper">
        <div class="copy">
            <p>各门店营业时间：周一至周日 09:00-21:30 &nbsp;&nbsp;&nbsp;&nbsp; 全国服务热线：000-000-00000 &nbsp;&nbsp;0000-00000000 &nbsp;&nbsp;&nbsp;&nbsp;
                工作时间：周一至周日 09:00-21:30</p>
            <p>网站ICP备案号：<a rel="nofollow" href="javascript:;" target="_blank">滇ICP备xxxxx号</a> &nbsp;&nbsp;&nbsp;&nbsp;
                电信业务经营许可证：滇B2-xxxx号 &nbsp;&nbsp;&nbsp;&nbsp; </p>
            <p>Copyright © 2006 - 2017 All Rights Reserved</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>shop/js/style.js"></script>

</body>

</html>