<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>首页</title>
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
									<img src="<%=basePath%>shop/img/logo.png" alt="" >
								</a>
							</div>
						</div>
						<!-- /LOGO -->
						<!-- 搜索框 -->
						<div class="col-md-6">
							<div class="header-search">
								<form>
									<select class="input-select" id="product_type" >
										<option value="-1">所有类别</option>
										<c:forEach items="${requestScope.product_type}" var="list" >
											<option value="${list.id}">${list.name}</option>
										</c:forEach>
									</select>
									<input class="input" placeholder="${requestScope.recommend.commend}" id="select">
									<button class="search-btn" OnClick="Select();" type="button">搜索</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<!--<div class="col-md-3 clearfix">
							<div class="header-ctn">-->
								<!-- Wishlist -->
								<div>
									<a href="<%=basePath%>shop/login/index/product/add" class="publish-btn"></i>发布二货</a>
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
						<li><a href="<%=basePath%>shop/index">首页</a></li>
						<li><a href="<%=basePath%>shop/store/all?product_sort=1">热卖</a></li>
						<li><a href="<%=basePath%>shop/store/all?product_sort=2">新品</a></li>
						<c:forEach items="${requestScope.product_type_top}" var="list" end="3">
							<li><a href="<%=basePath%>shop/store/all?product_type_id=${list.id}">${list.name}</a></li>
						</c:forEach>

					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<c:forEach items="${requestScope.product_type_top}" var="list" end="2" varStatus="sss">
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<c:choose>
									<c:when  test="${requestScope.product_image[sss.index].image==null||requestScope.product_image[sss.index].image==''}">
										<img src="<%=basePath%>shop/image/timg.gif" alt="" height="250" width="350">
								    </c:when>
									<c:otherwise>
										<img src="${requestScope.product_image[sss.index].image}" alt="" height="250" width="350">
									</c:otherwise>
								</c:choose>

							</div>
							<div class="shop-body">
								<h3>${list.name}<br></h3>
								<a href="<%=basePath%>shop/store/all?product_type_id=${list.id}" class="cta-btn">进去淘一淘</a>
							</div>
						</div>
					</div>
					<!-- /shop -->
					</c:forEach>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
        
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">新品</h3>
							<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
								</ul>
							</div>
						</div>
					</div>
					<!-- /section title -->
					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
										<!-- product -->
										<%--<div class="product">--%>
											<%--<div class="product-img">--%>
												<%--<img src="<%=basePath%>shop/img/product01.png" alt="">--%>
												<%--<div class="product-label">--%>
													<%--<span class="sale">-30%</span>--%>
													<%--<span class="new">新</span>--%>
												<%--</div>--%>
											<%--</div>--%>
											<%--<div class="product-body">--%>
												<%--<p class="product-category">商品名</p>--%>
												<%--<h3 class="product-name"><a href="#">这里是描述</a></h3>--%>
												<%--<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>--%>
												<%--<div class="product-rating">--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
												<%--</div>--%>
												<%--<div class="product-btns">--%>
													<%--<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">收藏</span></button>--%>
													<%----%>
												<%--</div>--%>
											<%--</div>--%>
											<%--<div class="add-to-cart">--%>
											<%--<a href="<%=basePath%>shop/product.jsp">	<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详</button></a>--%>
											<%--</div>--%>
										<%--</div>--%>
										<!-- /product -->
                                    <c:forEach items="${requestScope.product_new}" var="list" end="4">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<c:choose>
													<c:when  test="${list.image==null||list.image==''}">
														<img src="<%=basePath%>shop/image/timg.gif" alt="" height="200" width="400">
													</c:when>
													<c:otherwise>
														<img src="${list.image}" alt="" height="200" width="400">
													</c:otherwise>
												</c:choose>
												<div class="product-label">
                                                    <c:choose>
                                                        <c:when  test="${(1-list.price/list.prices)*100==0||list.prices==null||list.prices==0}">

                                                        </c:when>
                                                        <c:otherwise>
                                                    <span class="sale">-<fmt:formatNumber type="number" value="${(1-list.price/list.prices)*100}" pattern="#.##"/>%</span>
                                                        </c:otherwise>
                                                    </c:choose>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${list.name}</p>
												<h3 class="product-name"><a href="#">${list.remake}</a></h3>
												<h4 class="product-price">￥${list.price} <del class="product-old-price">￥${list.prices}</del></h4>
												<div class="product-rating">
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist" OnClick="Collection_button(${list.id});"  >
														<i class="fa fa-heart-">
														<img src="<%=basePath%>shop/img/ax.png" /></i>

														<span class="tooltipp">收藏</span></button>

												</div>
											</div>
											<div class="add-to-cart">
												<a href="<%=basePath%>shop/product/edit?id=${list.id}"><button class="add-to-cart-btn">查看详情</button></a>
											</div>
										</div>
										<!-- /product -->
									</c:forEach>

									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- HOT DEAL SECTION -->
		
		<!-- /HOT DEAL SECTION -->
		
		

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">畅销</h3>
							<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<%--<li class="active"><a data-toggle="tab" href="#tab2">笔记本电脑</a></li>--%>
								</ul>
							</div>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<%--<!-- product -->--%>
										<%--<div class="product">--%>
											<%--<div class="product-img">--%>
												<%--<img src="<%=basePath%>shop/img/product06.png" alt="">--%>
												<%--<div class="product-label">--%>
													<%--<span class="sale">-30%</span>--%>
													<%--<span class="new">新</span>--%>
												<%--</div>--%>
											<%--</div>--%>
											<%--<div class="product-body">--%>
												<%--<p class="product-category">商品名</p>--%>
												<%--<h3 class="product-name"><a href="#">这里是描述</a></h3>--%>
												<%--<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>--%>
												<%--<div class="product-rating">--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
													<%--<i class="fa fa-star"></i>--%>
												<%--</div>--%>
												<%--<div class="product-btns">--%>
													<%--<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">收藏</span></button>--%>
													<%----%>
												<%--</div>--%>
											<%--</div>--%>
											<%--<div class="add-to-cart">--%>
												<%--<a href="<%=basePath%>shop/product.jsp"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>查看详情</button></a>--%>
											<%--</div>--%>
										<%--</div>--%>
										<%--<!-- /product -->--%>
                            <c:forEach items="${requestScope.product_hot}" var="list" end="4">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<c:choose>
													<c:when  test="${list.image==null||list.image==''}">
														<img src="<%=basePath%>shop/image/timg.gif" alt="" height="200" width="400">
													</c:when>
													<c:otherwise>
														<img src="${list.image}" alt="" height="200" width="400">
													</c:otherwise>
												</c:choose>
												<div class="product-label">
                                                    <c:choose>
                                                        <c:when  test="${(1-list.price/list.prices)*100==0||list.prices==null||list.prices==0}">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="sale">-<fmt:formatNumber type="number" value="${(1-list.price/list.prices)*100}" pattern="#.##"/>%</span>
                                                        </c:otherwise>
                                                    </c:choose>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${list.name}</p>
												<h3 class="product-name"><a href="#">${list.remake}</a></h3>
												<h4 class="product-price">￥${list.price}<del class="product-old-price">￥${list.prices}</del></h4>
												<div class="product-rating">
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
													<i class="fa fa-sta"><img src="<%=basePath%>shop/img/xing.png" /></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist" OnClick="Collection_button(${list.id});"><i class="fa fa-heart-"><img src="<%=basePath%>shop/img/ax.png" /></i><span class="tooltipp">收藏</span></button>
													
												</div>
											</div>
											<div class="add-to-cart">
												<a href="<%=basePath%>shop/product/edit?id=${list.id}"><button class="add-to-cart-btn">查看详情</button></a>
											</div>
										</div>

							</c:forEach>
											<!-- /product -->
									</div>

									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- /Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">${requestScope.product_type_top[0].name}</h4>
							<div class="section-nav">
								<div id="slick-nav-3" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-3">
							<div>
						<%--<!-- product widget -->--%>
								<%--<div class="product-widget">--%>
									<%--<div class="product-img">--%>
										<%--<img src="<%=basePath%>shop/img/product07.png" alt="">--%>
									<%--</div>--%>
									<%--<div class="product-body">--%>
										<%--<p class="product-category">商品名</p>--%>
										<%--<h3 class="product-name"><a href="#">这里是描述</a></h3>--%>
										<%--<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>--%>
									<%--</div>--%>
								<%--</div>--%>
								<!-- /product widget -->
                             <c:forEach items="${requestScope.product_top_hot[0]}" var="list" end="5" >
								<!-- product widget -->
								<div class="product-widget">
									<div class="product-img">
										<c:choose>
											<c:when test="${list.image==null||list.image==''}">
												<img src="<%=basePath%>shop/image/timg.gif" alt="" width="100" height="50">
											</c:when>
											<c:otherwise>
												<img src="${list.image}" alt="" width="100" height="50">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="product-body">
										<p class="product-category">${list.name}</p>
										<h3 class="product-name"><a href="<%=basePath%>shop/product/edit?id=${list.id}">${list.remake}</a></h3>
										<h4 class="product-price">￥${list.price} <del class="product-old-price">￥${list.price}</del></h4>
									</div>
								</div>
								<!-- /product widget -->
							 </c:forEach>
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">${requestScope.product_type_top[1].name}</h4>
							<div class="section-nav">
								<div id="slick-nav-4" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-4">
							<div>
								<c:forEach items="${requestScope.product_top_hot[1]}" var="list" end="5" >
									<!-- product widget -->
									<div class="product-widget">
										<div class="product-img">
											<c:choose>
												<c:when test="${list.image==null||list.image==''}">
													<img src="<%=basePath%>shop/image/timg.gif" alt="" width="100" height="50">
												</c:when>
												<c:otherwise>
													<img src="${list.image}" alt="" width="100" height="50">
												</c:otherwise>
											</c:choose>

										</div>
										<div class="product-body">
											<p class="product-category">${list.name}</p>
											<h3 class="product-name"><a href="<%=basePath%>shop/product/edit?id=${list.id}">${list.remake}</a></h3>
											<h4 class="product-price">￥${list.price} <del class="product-old-price">￥${list.price}</del></h4>
										</div>
									</div>
									<!-- /product widget -->
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="clearfix visible-sm visible-xs"></div>
					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">${requestScope.product_type_top[2].name}</h4>
							<div class="section-nav">
								<div id="slick-nav-5" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-5">
							<div>
								<c:forEach items="${requestScope.product_top_hot[2]}" var="list"  end="5">
									<!-- product widget -->
									<div class="product-widget">
										<div class="product-img">
											<c:choose>
												<c:when test="${list.image==null||list.image==''}">
													<img src="<%=basePath%>shop/image/timg.gif" alt="" width="100" height="50">
												</c:when>
												<c:otherwise>
													<img src="${list.image}" alt="" width="100" height="50">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="product-body">
											<p class="product-category">${list.name}</p>
											<h3 class="product-name"><a href="<%=basePath%>shop/product/edit?id=${list.id}">${list.remake}</a></h3>
											<h4 class="product-price">￥${list.price} <del class="product-old-price">￥${list.price}</del></h4>
										</div>
									</div>
									<!-- /product widget -->
								</c:forEach>
							</div>
						</div>
					</div>

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
								<h3 style="color:#8a8a8a" class="footer-title" >信息</h3>
								
								<ul class="footer-links">
									<li><a href="#"><i><img src="<%=basePath%>shop/img/wz.png" /></i>官塘大道</a></li>
									<li><a href="#"><i><img src="<%=basePath%>shop/img/shouji.png" /></i>+123-45-67-89</a></li>
									<li><a href="#"><i><img src="<%=basePath%>shop/img/yx.png" /></i>email@email.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 style="color:#8a8a8a" class="footer-title">分类</h3>
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
								<h3 style="color:#8a8a8a" class="footer-title">关于我们</h3>
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
								<h3 style="color:#8a8a8a" class="footer-title">服务</h3>
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
        <script language="JavaScript" src="<%=basePath%>shop/js/jquery.js"></script>
        <script>
            function Select(){
                var select=$("#select").val()+"";
                var product_type=$("#product_type").val();
                if(product_type==-1){
                if(select==null||select==""){
                    select="${requestScope.recommend.value}";
                }
              }
                window.location.href="<%=basePath%>shop/store/all?Key="+select+"&product_type_id="+product_type+" ";
            };
			function Collection_button(id) {
                $.get("<%=basePath%>shop/login/index/collection/get?id="+id+" ",
                    function (data) {
                        if (data == "1") {
                            alert("收藏成功");
                        } else if(data == "2"){
                            alert("你已经收藏过了！");
                        }else{
                            alert("收藏失败，可能原因未登录");
						}
                    });
            }

        </script>
	<script>

	</script>
	</body>
</html>
