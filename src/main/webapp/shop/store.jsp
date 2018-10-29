<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>二手物品列表-xxx网</title>
 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

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

    </head>
	<body>
	<!-- 顶部开始 -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li style="color: #000000;">位置</li>
					<li><a href="#"> <img src="<%=basePath%>shop/img/wz.png" />官塘大道</a></li>
				</ul>
				<ul class="header-links pull-right">
					<li><a href="<%=basePath%>shop/login"><i class="fa fa-dollar"></i> 登录</a></li>
					<li><a href="<%=basePath%>shop/login/zhuce.jsp"><i class="fa fa-dollar"></i> 注册</a></li>
					<li><a href="grzx.jsp"><img src="<%=basePath%>shop/img/grzx.png" />&nbsp;个人中心</a></li>
					<li><a href="<%=basePath%>admin/login">&nbsp;后台管理</a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo">
								<img src="<%=basePath%>shop/img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->
					<!-- 搜索框 -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="all">所有类别</option>
									<c:forEach items="${requestScope.product_type}" var="list" >
										<option value="${list.id}">${list.name}</option>
									</c:forEach>
								</select>
								<input class="input" placeholder="${requestScope.recommend.commend}">
								<button class="search-btn">搜索</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<!--<div class="col-md-3 clearfix">
                        <div class="header-ctn">-->
					<!-- Wishlist -->
					<div>
						<a href="<%=basePath%>shop/fabu.jsp" class="publish-btn"></i>发布二货</a>
					</div>
					<!-- /Wishlist -->

					<!-- Cart -->
					<!--<div class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <i class="fa fa-shopping-cart"></i>
                            <span>购物车</span>
                            <div class="qty">3</div>
                        </a>
                    </div>-->
					<!-- /Cart -->
				</div>
			</div>
			<!-- /ACCOUNT -->
		</div>
		<!-- row -->
		</div>
		<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /顶部结束 -->

		<!-- 横向菜单 -->
	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="main-nav nav navbar-nav">
					<li class="active"><a href="<%=basePath%>shop/index">首页</a></li>
					<li><a href="#">热卖</a></li>
					<li><a href="<%=basePath%>shop/store.jsp">分类</a></li>
					<c:forEach items="${requestScope.product_type_top}" var="list" begin="3">
						<li><a href="#">${list.name}</a></li>
					</c:forEach>

				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->
		<!-- /横向菜单结束 -->

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							<li><a href="shop_indexs.jsp">首页</a></li>
							<li><a href="#">所有类别</a></li>
							
							<li class="active">电脑 (490 结果)</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- ASIDE -->
					<div id="aside" class="col-md-3">
						
						<!-- 价钱 -->
						<div class="aside">
							<h3 class="aside-title">价钱</h3>
							<div class="price-filter">
								<div id="price-slider"></div>
								<div class="input-number price-min">
									<input id="price-min" type="number">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
								<span>-</span>
								<div class="input-number price-max">
									<input id="price-max" type="number">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->

						<!-- 热门交易 -->
						<div class="aside">
							<h3 class="aside-title">热门交易</h3>
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product01.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">电脑</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>

							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product02.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">耳机</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>

							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product03.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">手机</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->
					</div>
					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- 排序 -->
						<div class="store-filter clearfix">
							<div class="store-sort">
								<label>
									排序:
									<select class="input-select">
										<option value="0">最新二货</option>
										<option value="1">最热二货</option>
									</select>
								</label>

								<label>
									显示:
									<select class="input-select">
										<option value="0">20</option>
										<option value="1">50</option>
									</select>
								</label>
							</div>
							<ul class="store-grid">
								<li class="active"><i class="fa fa-th"></i></li>
								<li><a href="#"><i class="fa fa-th-list"></i></a></li>
							</ul>
						</div>
						<!-- /store top filter -->

						<!-- 产品列表 -->
						<div class="row">
							<!-- 产品 -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product01.png" alt="">
										<div class="product-label">
											
											<span class="new">新</span>
										</div>
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product02.png" alt="">
										<div class="product-label">
											<span class="new">新</span>
										</div>
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<div class="clearfix visible-sm visible-xs"></div>

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product03.png" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<div class="clearfix visible-lg visible-md"></div>

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product04.png" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="<%=basePath%>shop/product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<div class="clearfix visible-sm visible-xs"></div>

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product05.png" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product06.png" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product07.png" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="./img/product08.png" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
										</div>
									<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->

							<div class="clearfix visible-sm visible-xs"></div>

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="<%=basePath%>shop/img/product09.png" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">商品名</p>
										<h3 class="product-name"><a href="#">这里是描述</a></h3>
										<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
										<div class="product-rating">
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<a href="<%=basePath%>shop/product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									</div>
								</div>
							</div>
							<!-- /product -->
						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<span class="store-qty">显示 20-100 产品</span>
							<ul class="store-pagination">
								<li class="active">1</li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->


		<!-- 底部 -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">关于我们</h3>
								
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>官塘大道</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+123-45-67-89</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">分类</h3>
								<ul class="footer-links">
									<li><a href="#">热卖</a></li>
									<li><a href="#">电脑</a></li>
									<li><a href="#">手机</a></li>
									<li><a href="#">电子配件</a></li>
									<li><a href="#">书籍</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">信息</h3>
								<ul class="footer-links">
									<li><a href="#">关于我们</a></li>
									<li><a href="#">联系我们</a></li>
									<li><a href="#">隐私政策</a></li>
									<li><a href="#">订单和退货</a></li>
									<li><a href="#">条款和条件</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">服务</h3>
								<ul class="footer-links">
									<li><a href="#">我的账户</a></li>
									<li><a href="#">查看购物车</a></li>
									<li><a href="#">收藏</a></li>
									<li><a href="#">我的订单</a></li>
									<li><a href="#">帮助</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				
				<!-- /container -->
			</div>
			<!-- /top footer -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<script src="<%=basePath%>shop/js/jquery.min.js"></script>
		<script src="<%=basePath%>shop/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>shop/js/slick.min.js"></script>
		<script src="<%=basePath%>shop/js/nouislider.min.js"></script>
		<script src="<%=basePath%>shop/js/jquery.zoom.min.js"></script>
		<script src="<%=basePath%>shop/js/main.js"></script>

	</body>
</html>
