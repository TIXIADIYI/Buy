<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>二手市场登录</title>
<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>

<link type="text/css" href="css/base.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

</head>

<body style="background: #f6f6f6">

<div class="wrapper" id="login_head" style="display:">
	<div class="log_head">
		<h1 class="log_logo left"><a href="javascript:;"><img src="image/logo.png" width="80" height="80" align="middle" >
        <span>欢迎登录！！</span></a></h1>
	</div>
</div>
<div class="login_wrap" style="width:; background:#fff url(image/20161209115754_5628.jpg) no-repeat center top; padding:40px 0;">
	<div class="wrapper" id="login_body" style="width:;">
		<div class="log_ad" style="display:"><a href="javascript:;"></a></div>
		<div class="login_border" style="padding:8px;">
			<div class="login" style="display: block;">
				<div style="position:absolute; right:30px; top:14px;">
					<a href="zhuce.html" target="_blank">账号注册
					<em style="width:16px; height:16px; background:#999; float:right; color:#fff; border-radius:100%; text-align:center; line-height:16px; margin:1px 0 0 5px; font-family:'宋体'; font-weight:bold;">&gt;</em>
					</a>
				</div>
				<ul class="login-tab">
					<li class="login-on">普通登录</li>
					
				</ul>
				<div class="login-body">
					<div class="login-style" style="display: block;">
						<dl><dd><img src="image/iconfont-yonghu.png"><input name="txtUser" type="text" id="txtUser" placeholder="手机号" /></dd></dl>
				<dl><img src="image/iconfont-psw.png">
     <dd><input type="password" id="Userpwd" onKeyDown="enterHandler(event)" placeholder="请输入您的密码" /></dd>
						</dl>
						<!-- <dl id="logincode" style="display: none;">
						<dd><input type="text" id="txtCode" name="txtCode" style="width: 133px; margin-right: 10px;" placeholder="验证码" /><img id="vCodeImg" src="" width="90" height="34" title="点击换一个" style="vertical-align: middle; margin-top: -4px;" onclick="this.src='/ImgCode.aspx?t='+Math.random()*100" /></dd>
						</dl> -->
						<div class="psword" style="margin-top:15px;"><a href="javascript:void(0);" onClick="zhaohui(this)" tabindex="-1" class="right" target="_blank">忘记密码?</a></div>
						<div class="remember">
							<input type="checkbox" id="issave" checked /><label for="issave">下次自动登录</label>
						</div>
						<div class="tishi"></div>
						<button onClick="cliLogin()" id="logbtn" style="outline:none">登 录</button>
					</div>
			</div>
			
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>

<div class="bottom">
	<div class="wrapper">
		<div class="foot_nav">
			<a href="#" rel="nofollow">二手平台</a><i>|</i>
            <a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i><a href="#" rel="nofollow">二手平台</a><i>|</i>
		
		</div>
		<div class="copy">
			<p>各门店营业时间：周一至周日 09:00-21:30 &nbsp;&nbsp;&nbsp;&nbsp; 全国服务热线：000-000-00000 &nbsp;&nbsp;0000-00000000 &nbsp;&nbsp;&nbsp;&nbsp; 工作时间：周一至周日 09:00-21:30</p>
			<p>网站ICP备案号：<a rel="nofollow" href="javascript:;" target="_blank">滇ICP备xxxxx号</a> &nbsp;&nbsp;&nbsp;&nbsp; 电信业务经营许可证：滇B2-xxxx号 &nbsp;&nbsp;&nbsp;&nbsp; </p>
			<p>Copyright © 2006 - 2017  All Rights Reserved</p>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/style.js"></script>

</body>

</html>
