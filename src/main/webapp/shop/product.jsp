<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>头尾</title>
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
						<li><a href="#"><i class="fa fa-map-marker"></i> 官塘大道</a></li>
					</ul>
					<ul class="header-links pull-right">
						<li><a href="#"><i class="fa fa-dollar"></i> 登录</a></li>
						<li><a href="#"><i class="fa fa-dollar"></i> 注册</a></li>
						<li><a href="<%=basePath%>shop/grzx.jsp"><i class="fa fa-user-o"></i> 个人中心</a></li>
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
									<img src="./img/logo.png" alt="">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- 搜索框 -->
						<div class="col-md-6">
							<div class="header-search">
								<form>
									<select class="input-select">
										<option value="0">所有类别</option>
										<option value="1">类别 01</option>
										<option value="1">类别 02</option>
									</select>
									<input class="input" placeholder="Search here">
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
									<a href="#" class="publish-btn"></i>发布二货</a>
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


		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="<%=basePath%>shop/index.jsp">首页</a></li>
						<li><a href="#">热卖</a></li>
						<li><a href="store.jsp">分类</a></li>
						<li><a href="#">笔记本电脑</a></li>
						<li><a href="#">智能手机</a></li>
						<li><a href="#">相机</a></li>
						<li><a href="#">饰品</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							
							<li><a href="#">所有商品名</a></li>
							<li><a href="#">饰品</a></li>
							<li><a href="#">头戴耳机</a></li>
							<li class="active">产品名称就在这里</li>
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
					<!-- Product main img -->
					<div class="col-md-5 col-md-push-2">
						<div id="product-main-img">
							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product01.png" alt="">
							</div>

							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product03.png" alt="">
							</div>

							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product06.png" alt="">
							</div>

							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product08.png" alt="">
							</div>
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product thumb imgs -->
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product01.png" alt="">
							</div>

							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product03.png" alt="">
							</div>

							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product06.png" alt="">
							</div>

							<div class="product-preview">
								<img src="<%=basePath%>shop/img/product08.png" alt="">
							</div>
						</div>
					</div>
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					<div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name">酷奇</h2>
							<div>
								<h3 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h3>
								<span class="product-available">有现货</span>
							</div>

							<ul class="product-links" >
                            <img src="img/类别 (1).png"/>
								<li>商品名:</li>
								<li><a href="#">头戴耳机</a></li>
								<li><a href="#">饰品</a></li>
							</ul>

							<ul class="product-links">
                            <img src="img/手机 (4).png"/>
								<li>联系电话:</li>
                                <li><a href="#">15472583652</a></li>
							</ul>
                            
                            <ul class="product-links">
                            <img src="img/地址.png"/>
								<li>地址:</li>
                                <li><a href="#">柳州城市职业学院</a></li>
							</ul>
                            
                            <ul class="product-links">
                          
								<li>描述:</li>
                                <p>酷奇（COOSKIN）于2003年成立于上海，是国内笔记本电脑周边产品的领军者。</p>
							</ul>
                            
                           
                            <div class="add-to-cart">
								 <button class="primary-btn">联系卖家</button>
								<button class="primary-btn">收藏</button>
							</div>

						</div>
					</div>
					<!-- /Product details -->
					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								
								<li><a data-toggle="tab" href="#tab3">评论(3)</a></li>
							</ul>
							<!-- /product tab nav -->

							<!-- product tab content -->
							<div class="tab-content">
								
								

								

										<!-- Reviews -->
										<div class="col-md-6">
											<div id="reviews">
												<ul class="reviews">
													<li>
														<div class="review-heading">
															<h5 class="name">李海健</h5>
															<p class="date">2018年12月27日,下午8:0</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好。</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">李海健</h5>
															<p class="date">2018年12月27日,下午8:0</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好。</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">李海健</h5>
															<p class="date">2018年12月27日, 下午8:0</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好，非常好。</p>
														</div>
													</li>
												</ul>
												<ul class="reviews-pagination">
													<li class="active">1</li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
												</ul>
											</div>
										</div>
										<!-- /Reviews -->

										<!-- Review Form -->
										<div class="col-md-3">
											<div id="review-form">
												<form class="review-form">
													
													<textarea class="input" placeholder="Your Review"></textarea>
													<div class="input-rating">
												<i style="color: #8D99AE">对本商品进行评价:</i>
														<div class="stars">
															<input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
															<input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
															<input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
															<input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
															<input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
														</div>
										                     </br>
										                       <i style="color: #D10024" class="fa fa-star"></i><a style="color: #8D99AE">&nbsp;非常差</a></br>
										                       
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i><a style="color: #8D99AE">&nbsp;差</a></br>
										                       
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i><a style="color: #8D99AE">&nbsp;一般</a></br>
										                       
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i><a style="color: #8D99AE">&nbsp;好</a></br>
										                       
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i> 
										                       <i style="color: #D10024" class="fa fa-star"></i><a style="color: #8D99AE">&nbsp;非常好</a>
										                       
													</div>
													
													<button class="primary-btn">提交</button>
												</form>
											</div>
										</div>
										<!-- /Review Form -->
									</div>
								</div>
								<!-- /tab3  -->
							</div>
							<!-- /product tab content  -->
						</div>
					</div>
					<!-- /product tab -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- Section -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 class="title">相关产品</h3>
						</div>
					</div>

					<!-- product -->
					<div class="col-md-3 col-xs-6">
						<div class="product">
							<div class="product-img">
								<img src="<%=basePath%>shop/img/product01.png" alt="">
								<div class="product-label">
									<span class="sale">-30%</span>
								</div>
							</div>
							<div class="product-body">
								<p class="product-category">商品名</p>
								<h3 class="product-name"><a href="#">这里是描述</a></h3>
								<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								<div class="product-rating">
								</div>
								<div class="product-btns">
									<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">收藏</span></button>
									
								</div>
							</div>
							<div class="add-to-cart">
								<a href="<%=basePath%>shop/product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>查看详情</button></a>
							</div>
						</div>
					</div>
					<!-- /product -->

					<!-- product -->
					<div class="col-md-3 col-xs-6">
						<div class="product">
							<div class="product-img">
								<img src="<%=basePath%>shop/img/product02.png" alt="">
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
									<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">收藏</span></button>
									
								</div>
							</div>
							<div class="add-to-cart">
								<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>查看详情</button></a>
							</div>
						</div>
					</div>
					<!-- /product -->

					<div class="clearfix visible-sm visible-xs"></div>

					<!-- product -->
					<div class="col-md-3 col-xs-6">
						<div class="product">
							<div class="product-img">
								<img src="<%=basePath%>shop/img/product03.png" alt="">
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
									<i class="fa fa-star-o"></i>
								</div>
								<div class="product-btns">
									<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">收藏</span></button>
									
								</div>
							</div>
							<div class="add-to-cart">
								<a href="product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>查看详情</button></a>
							</div>
						</div>
					</div>
					<!-- /product --> 

					<!-- product -->
					<div class="col-md-3 col-xs-6">
						<div class="product">
							<div class="product-img">
								<img src="./img/product04.png" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">商品名</p>
								<h3 class="product-name"><a href="#">这里是描述</a></h3>
								<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								<div class="product-rating">
								</div>
								<div class="product-btns">
									<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">收藏</span></button>
									
								</div>
							</div>
							<div class="add-to-cart">
								<a href="<%=basePath%>shop/product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>查看详情</button></a>
							</div>
						</div>
					</div>
					<!-- /product -->

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /Section -->

		
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
