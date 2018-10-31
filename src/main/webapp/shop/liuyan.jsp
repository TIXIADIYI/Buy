<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li style="color: #000000;">位置</li>
					<li><a href="#"> <img src="<%=basePath%>shop/img/wz.png" />官塘大道</a></li>
				</ul>
				<ul class="header-links pull-right">
					<c:choose>
						<c:when test="${sessionScope.user==null}">
							<li><a href="<%=basePath%>shop/login"><i class="fa fa-dollar"></i> 登录</a></li>
							<li><a href="<%=basePath%>shop/login/zhuce.jsp"><i class="fa fa-dollar"></i> 注册</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<%=basePath%>shop/login/index/my/fabu"><img src="<%=basePath%>shop/img/grzx.png" />&nbsp;${sessionScope.user.name}</a></li>
							<li><a href="<%=basePath%>shop/login/exit"><i class="fa fa-dollar"></i> 注销</a></li>
						</c:otherwise>
					</c:choose>


					<li><a href="<%=basePath%>admin/login">&nbsp;后台管理</a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->
  <!--
  	个人中心顶部结束
  -->

	<div id="main" class="clearfix">
		<div class="user-sider fl">
			<div class="user-info">
				<c:choose>
					<c:when test="${sessionScope.user.image==null}">
						<img src="<%=basePath%>shop/img/logo.jpg" class="user-header">
					</c:when>
					<c:otherwise>
						<img src="${sessionScope.user.image}" class="user-header">
					</c:otherwise>
				</c:choose>
				<li  class="username">账号：${sessionScope.user.user}</li>
				<li  class="username">昵称：${sessionScope.user.name}</li>
			</div>
			<div class="sider-nav">
				<ul>
					<li><a href="<%=basePath%>shop/login/index/my/fabu" ><i class="icon" ></i><img src="<%=basePath%>shop/img/fabu.png" />&nbsp;我发布的</a></li>
					<li><a href="<%=basePath%>shop/login/index/my/collection" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/xin.png" />&nbsp;我想要的</a></li>
					<li><a href="<%=basePath%>shop/login/index/my/comment" class="active"><i class="icon"></i><img src="<%=basePath%>shop/img/ly.png" />&nbsp;我的评论</a></li>
					<li><a href="<%=basePath%>shop/login/index/my/edit" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/xx.png" />&nbsp;个人信息</a></li>
				</ul>
			</div>
		</div>
<!--右边-->
		<div class="user-main fr">
			<ul>
				<c:forEach items="${requestScope.product_comment}" var="list">
					<li>
						<div class="list-header">
						<span>评论时间：<fmt:formatDate type="date" value="${list.time}" dateStyle="default"/></span>
							<c:choose>
								<c:when test="${list.praise==true}">
									<span style="color: green;">好评</span>
								</c:when>
								<c:otherwise>
									<span style="color: red;">差评</span>
								</c:otherwise>
							</c:choose>
					    </div>
						<div class="list-main clearfix">
							<a href="#" class="goods-images fl" target="_blank">
								<c:choose>
								<c:when test="${list.product_id.image==null}">
								<img src="<%=basePath%>shop/image/timg.gif"  width="150" height="120"/>
								</c:when>
								<c:otherwise>
								<img src="${list.product_id.image}"  width="150" height="100"/>
								</c:otherwise>
								</c:choose>
								<div class="good-info fl">
									<a href="#" class="goods-title" target="_blank">${list.product_id.name}</a>
									<p class="goods-price">评论：${list.comment}</p>
								</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			<div id="page"></div>
		</div>
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