<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>注册交易网</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/bootstrap.min.css"/>
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/style.css"/>
    <script src="../js/jquery-1.7.2.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/zccs.css">
    <script type="text/javascript" src="<%=basePath%>shop/js/jquery.min.js"></script>
    <script src="<%=basePath%>shop/js/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="<%=basePath%>shop/js/yanz.js"></script>
    <script language="JavaScript" src="<%=basePath%>shop/js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#button").click(function () {
                    $.post("<%=basePath%>shop/login/zhuce",
                        $("#loginform").serialize(),
                        function (data) {
                            if (data == "1") {
                                alert("注册成功!!!");
                            } else if (data == "2") {
                                alert("注册失败，未填写完整!");
                            } else if (data == "3") {
                                alert("注册失败，该账号已存在!");

                            } else {
                                alert("注册失败!");
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
         style="width:; background:#fff url(<%=basePath%>shop/img/ZCLOGO.jpg) no-repeat center top; padding:40px 0;">
        <div class="wrapper" id="login_body" style="width:;">

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
                                    <input name="user" type="text" id="txtUser" placeholder="请填写您的手机号" onChange="upperCase()"/></dd>
                            </dl>

                            <dl>
                                <dd>
                                    <img src="<%=basePath%>shop/image/iconfont-psw.png" style="position: absolute;">
                                    <input type="password" id="Userpwd" onKeyDown="enterHandler(event)"
                                           placeholder="请输入您的密码" name="pass" onblur="checkpas1();"/></dd>
                                <span class="tip" style="color: red;">密码长度必须大于6位！！</span>
                            </dl>

                            <dl>
                                <dd>
                                    <img src="<%=basePath%>shop/image/iconfont-psw.png" style="position: absolute;">
                                    <input type="password" id="Userpwd1" onKeyDown="enterHandler(event)"
                                           placeholder="再次确认您的密码" name="pass2" onChange="checkpas();"/></dd>
                                <span class="tip" style="color: red;">两次输入的密码不一致</span>
                            </dl>
                            <p>
                                <input checked="checked" id="inputacc" type="checkbox">
                                我已阅读并接受<a target="_blank" href="#">《用户服务协议》</a></p>
                            <div class="tishi"></div>

                            <input id="button" type="button" value="同意协议并注册" onclick="checkpas2();"/>
                        </div>
                    </div>

                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</form>
<script language="javascript">
    function upperCase() {
        var txtUser = document.getElementById('txtUser').value;
        if (!(/^1[34578]\d{9}$/.test(txtUser))) {
            alert("手机号码格式错误，请核对后重试");

            return false; //return false用来阻止表单提交
        }
    }
</script>
<div class="bottom">
    <div class="wrapper">
        <div class="copy">
            <p>全国服务热线：000-000-00000 &nbsp;&nbsp;0000-00000000 &nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p>网站ICP备案号：xxxxx号</a> &nbsp;&nbsp;&nbsp;&nbsp;
                电信业务经营许可证：xxxx号 &nbsp;&nbsp;&nbsp;&nbsp; </p>
            <p>Copyright © 2017 - 2018 All Rights Reserved</p>
        </div>
    </div>
</div>

</body>
<script src="<%=basePath%>shop/js/jquery-1.12.4.js"></script>
<script>
    $(".tip").hide();
    function checkpas1(){//当第一个密码框失去焦点时，触发checkpas1事件
        var pas1=document.getElementById("Userpwd").value;
        var pas2=document.getElementById("Userpwd1").value;//获取两个密码框的值
        if(pas1!=pas2&&pas2!="")//此事件当两个密码不相等且第二个密码是空的时候会显示错误信息
            $(".tip").show();
        else
            $(".tip").hide();//若两次输入的密码相等且都不为空时，不显示错误信息。
    }

    function checkpas(){//当第一个密码框失去焦点时，触发checkpas2件
        var pas1=document.getElementById("Userpwd").value;
        var pas2=document.getElementById("Userpwd1").value;//获取两个密码框的值
        if(pas1!=pas2){
            $(".tip").show();//当两个密码不相等时则显示错误信息
        }else{
            $(".tip").hide();
        }
    }
    function checkpas2(){//点击提交按钮时，触发checkpas2事件，会进行弹框提醒以防无视错误信息提交
        var pas3=document.getElementById("Userpwd").value;
        var pas4=document.getElementById("Userpwd1").value;
        if(pas3!=pas4){
            alert("两次输入的密码不一致！");
            return false;
        }
    }
</script>
</html>