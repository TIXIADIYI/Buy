<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">
	<head>
		<title>二手物品列表</title>
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
								<img src="<%=basePath%>shop/img/logo.png" alt="">
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

		<!-- 横向菜单 -->
	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="main-nav nav navbar-nav">
					<li><a href="<%=basePath%>shop/index">首页</a></li>
					<li ><a href="<%=basePath%>shop/store/all?product_sort=1">热卖</a></li>
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
		<!-- /横向菜单结束 -->

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							<li>首页</li>
							<li>${requestScope.product_type_name}</li>
							<c:choose>
								<c:when test="${requestScope.Key!=null}">
									<li>搜索"${requestScope.Key}"</li>
								</c:when>
							</c:choose>
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
							<c:forEach items="${requestScope.product_hot}" var="list" end="2">
							<a href="<%=basePath%>shop/product/edit?id=${list.id}">
							<div class="product-widget">
								<div class="product-img">
									<img src="${list.image}" alt="">
								</div>
								<div class="product-body">
									<h3 class="product-name">${list.name}</h3>
									<h4 class="product-price">￥${list.price} <del class="product-old-price">￥${list.prices}</del></h4>
								</div>
							</div>
							</a>
							</c:forEach>
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
									<ul class="main-nav nav navbar-nav">
										<li <c:choose>
											<c:when test="${requestScope.product_sort==0||requestScope.product_sort==null}">
												class="active"
											</c:when>
										</c:choose> ><a href="<%=basePath%>shop/store/all?product_sort=0&product_type_id=${requestScope.product_type_id}">默认</a></li>
										<li <c:choose>
											<c:when test="${requestScope.product_sort==1}">
												class="active"
											</c:when>
										</c:choose>><a href="<%=basePath%>shop/store/all?product_sort=1&product_type_id=${requestScope.product_type_id}">热门</a></li>
										<li <c:choose>
											<c:when test="${requestScope.product_sort==2}">
												class="active"
											</c:when>
										</c:choose>><a href="<%=basePath%>shop/store/all?product_sort=2&product_type_id=${requestScope.product_type_id}">最新</a></li>
										<li
												<c:choose>
											<c:when test="${requestScope.product_sort==3}">
												class="active">
											</c:when>
                                            <c:otherwise>
                                                >
                                            </c:otherwise>
										</c:choose>
                                           <c:choose>
												<c:when test="${requestScope.product_sort_3==true}">
													<a href="<%=basePath%>shop/store/all?product_sort=3&product_sort_3=false&product_type_id=${requestScope.product_type_id}">价格↓</a>
												</c:when>
												<c:otherwise>
													<a href="<%=basePath%>shop/store/all?product_sort=3&product_sort_3=true&product_type_id=${requestScope.product_type_id}">价格↑</a>
												</c:otherwise>
										   </c:choose>
										</li>
									</ul>
								</label>


							</div>
							<ul class="store-grid">

							</ul>
						</div>
						<!-- /store top filter -->

						<!-- 产品列表 -->
						<div class="row">
							<c:forEach items="${requestScope.product}" var="list" varStatus="sss">
							<!-- 产品 -->
							<div class="col-md-4 col-xs-6">
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
										<h3 class="product-name">${list.remake}</h3>
										<h4 class="product-price">￥${list.price}<del class="product-old-price">￥${list.prices}</del></h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist" OnClick="Collection_button(${list.id});">
												<i class="fa fa-heart-">
													<c:choose>
														<c:when test="${requestScope.product_collection[sss.index]==true}">
															<img src="<%=basePath%>shop/img/ax2.png" width="20" height="20"/>
														</c:when>
														<c:otherwise>
															<img src="<%=basePath%>shop/img/ax.png" />
														</c:otherwise>
													</c:choose>
											</i><span class="tooltipp">加入收藏</span></button>


										</div>
									</div>
									<div class="add-to-cart">
										<a href="<%=basePath%>shop/product/edit?id=${list.id}"><button class="add-to-cart-btn">查看详情</button></a>
									</div>
								</div>
							</div>
								<div class="clearfix visible-sm visible-xs"></div>
							</c:forEach>
							<!-- /product -->

						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<ul class="store-pagination">
								<c:forEach var="index" end="${requestScope.pagemax}" begin="0" varStatus="s">
									<li
											<c:choose>
											 <c:when test="${s.index==page}">
												 class="active"
											 </c:when>
											</c:choose>
									>
										<a href="<%=basePath%>shop/store/all?product_sort=${requestScope.product_sort}&
										product_sort_3=${requestScope.product_sort_3}&
										product_type_id=${requestScope.product_type_id}&
										page=${s.index}">
										${s.index+1}</a></li>
								</c:forEach>

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
        }
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
	</body>
</html>
