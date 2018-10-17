<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/la.js"></script>
    <link rel="stylesheet" href="css/layui.css"></script>

<link rel="stylesheet" href="<%=basePath%>shop/css/public.css">
<script src="<%=basePath%>shop/js/common.js"></script>
	<link rel="stylesheet" href="<%=basePath%>shop/css/user.css">
	<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/bootstrap.min.css"/>

 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/slick-theme.css"/>

 		<!-- nouislider -->
 		<link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/nouislider.min.css"/>

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="<%=basePath%>shop/css/font-awesome.min.css">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/style.css"/>
 		
 		
	<script type="text/javascript">
 
</script>
</head>
<body>
	<div id="header">
	
	<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">					
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<li><a href="<%=basePath%>shop/index.jsp"></i> 首页</a></li>
					</ul>
					<ul class="header-links pull-right">
						
						
						<li><a href="#"><i class="fa fa-user-o"></i> 用户名</a></li>
						<li><a href="#"><i class="fa fa-dollar"></i> 退出</a></li>
						<!--<a href="#" class="log-btn"><img src="img/logo.jpg" class="user-header-image">用户名</a>
					<a href="3" class="log-btn">退出</a>-->
					</ul>
				</div>
			</div>
  <!--
  	个人中心顶部结束
  -->

	<div id="main" class="clearfix">
		<div class="user-sider fl">
	<div class="user-info">
		<img src="img/logo.jpg" class="user-header">
		<a href="#" class="username">用户名</a>
		<!--<div class="auth">
			<a class="realname-auth" href="#"><i class="icon" title=未实名认证 >&#xe605;</i></a>
			<a class="phone-auth" href="#"><i class="icon" style=color:#f40; title=已绑定手机>&#xe624;</i></a>
			<a class="email-auth" href="#"><i class="icon" title=未绑定邮箱>&#xe623;</i></a>
		</div>-->
	</div>
	<div class="sider-nav">
		<ul>
			<li><a href="<%=basePath%>shop/grzx.jsp" class=""><i class="icon" ></i><img src="<%=basePath%>shop/img/fabu.png" />&nbsp;我发布的</a></li>
			<li><a href="<%=basePath%>shop/xiangyao.jsp" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/xin.png" />&nbsp;我想要的</a></li>
			<li><a href="<%=basePath%>shop/liuyan.jsp" class="active"><i class="icon"></i><img src="<%=basePath%>shop/img/ly.png" />&nbsp;我的留言</a></li>
			<li><a href="<%=basePath%>shop/xinxi.jsp" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/xx.png" />&nbsp;个人信息</a></li>
			
			<li><a href="<%=basePath%>shop/fankiu.jsp" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/yj.png" />&nbsp;意见反馈</a></li>
		</ul>
	</div>
</div>
<!--右边-->
		<div class="user-main message-main fr">
			<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				<ul class="layui-tab-title">
					<li class="layui-this">收到的留言</li>
					<li>发布的留言</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<ul class="comment-list"></ul>
						<div id="page1"></div>
					</div>
					<div class="layui-tab-item">
						<ul class="published-comment-list"></ul>
						<div id="page2"></div>
					</div>
				</div>
			</div> 
		</div>
	</div>
	<div id="footer">
		<!--右边结束-->
		
		
	</div>
	<div id="footer">
	
	<div class="go-to-top">
		<a href="#" title="回顶部" class="icon">&#xe61c;</a>
	</div>
	<div class="footer-bottom-wrap">
		<div class="footer-bottom">
			
			<p class="column">
				<a href="#">关于我们</a>
				<a href="#">常见问题</a>
				<a href="#">意见反馈</a>
				<a href="#">服务协议</a>
				<a href="#">联系我们</a>
				<script src="#" language="JavaScript"></script>
				<script>
					var _hmt = _hmt || [];
					(function() {
					var hm = document.createElement("script");
					hm.src = "https://hm.baidu.com/hm.js?b43531d7c229bad3bcbfbc7991208c60";
					var s = document.getElementsByTagName("script")[0]; 
					s.parentNode.insertBefore(hm, s);
					})();
				</script>
			</p>
			<p class="tips">本站所有信息均为用户自由发布，本站不对信息的真实性负任何责任，交易时请注意识别信息的真假如有网站内容侵害了您的权益请联系我们删除</p>
			
			
		</div>
	</div>
</div>
<!--<script src="/js/lib/sitemap.js"></script>
	<script> var count = 0</script>-->
	<script src="<%=basePath%>shop/js/message.js"></script>
	
</body>
</html>