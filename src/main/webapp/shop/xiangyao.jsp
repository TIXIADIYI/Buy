<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
	<script type="text/javascript" src="<%=basePath%>shop/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>shop/js/la.js"></script>
<link rel="stylesheet" href="<%=basePath%>shop/css/layui.css"></script>

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
		<img src="<%=basePath%>shop/img/logo.jpg" class="user-header">
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
			<li><a href="<%=basePath%>shop/xiangyao.jsp" class="active"><i class="icon"></i><img src="<%=basePath%>shop/img/xin.png" />&nbsp;我想要的</a></li>
			<li><a href="<%=basePath%>shop/liuyan.jsp" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/ly.png" />&nbsp;我的留言</a></li>
			<li><a href="<%=basePath%>shop/xinxi.jsp" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/xx.png" />&nbsp;个人信息</a></li>
			
			<li><a href="<%=basePath%>shop/fankiu.jsp" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/yj.png" />&nbsp;意见反馈</a></li>
		</ul>
	</div>
</div>
<!--右边-->
		<div class="user-main fr">
			<ul>
				<!-- <li>
					<div class="list-header">
						<span>时间：2016-12-12</span>
					</div>
					<div class="list-main clearfix">
						<a href="" class="goods-images fl"><img src="/images/web/user/default.png" ></a>
						<div class="good-info fl">
							<a href="" class="goods-title">我的商品的标题我的商品的标题</a>
							<p class="goods-price">￥<span>3.00</span></p>
						</div>
						<div class="operation fr">
							<a href="" class="">查看详情</a>
							<a href="" class="">移除想要</a>
						</div>
					</div>
				</li> -->
				
				<li>
					<div class="list-header">
						<span>时间：2018-10-15 09:40:17</span>
					</div>
					<div class="list-main clearfix">
						<a href="#" class="goods-images fl" target="_blank"><img src="<%=basePath%>shop/img/iPhone.jpg" ></a>
						<div class="good-info fl">
							<a href="#" class="goods-title" target="_blank">苹果X 64G</a>
							<p class="goods-price">￥<span>6800</span></p>
						</div>
						<div class="operation fr">
							<a href="#" class="" target="_blank">查看详情</a>
							<a href="javascript:;" class="delete-want" data-gid="1393">移除想要</a>
						</div>
					</div>
				</li>
				
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
<script src="/js/lib/sitemap.js"></script>
	<!--<script> var count = 0</script>
	<script src="/js/web/user_index.js"></script>-->
	<script>
		$(function(){
		    layui.use(['layer', 'laypage'], function(){
		        var layer = layui.layer

		        layui.laypage({
		            cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
		            pages: 0, //通过后台拿到的总页数
		            curr: Common.getQuery('page') || 1, //当前页
		            jump: function(obj, first){ //触发分页后的回调
		                if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
		                    window.location.href = '/user/want?page=' + obj.curr
		                }
		            }
		        })

		        $('.delete-want').click(function(){
		        	var url = '/user/collect_delete'
					var Data = { gid: $(this).attr('data-gid')}
					Common.ajax(url, Data, function (data) {
						layer.msg(data.msg)
					    if(data.success){
					        setTimeout(function(){ location.reload() }, 2000)
					    }
					}, function (err) {
					    console.log(err)
					}, function () {}, true, 'POST')
		        })
		    })
		})
	</script>
</body>
</html>