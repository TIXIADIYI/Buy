<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品详情</title>
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
						<c:forEach items="${requestScope.product_type_top}" var="list" begin="3">
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

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							<li>首页</li>
                            <li>${requestScope.product.name}</li>
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
								<c:choose>
									<c:when test="${requestScope.product.image==null||requestScope.product.image==''}">
										<img src="<%=basePath%>shop/image/timg.gif" alt="" width="350" height="300">
									</c:when>
									<c:otherwise>
										<img src="${requestScope.product.image}" alt="" width="350" height="300">
									</c:otherwise>
								</c:choose>
							</div>

							<%--<div class="product-preview">--%>
								<%--<img src="<%=basePath%>shop/img/product03.png" alt="">--%>
							<%--</div>--%>
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product thumb imgs -->
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
							<%--<div class="product-preview">--%>
								<%--<img src="<%=basePath%>shop/img/product01.png" alt="">--%>
							<%--</div>--%>

							<%--<div class="product-preview">--%>
								<%--<img src="<%=basePath%>shop/img/product03.png" alt="">--%>
							<%--</div>--%>


						</div>
					</div>
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					<div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name">${requestScope.product.name}</h2>
							<div>
								<h3 class="product-price">￥${requestScope.product.price}<del class="product-old-price">￥${requestScope.product.prices}</del></h3>
							</div>
							<ul class="product-links" >
                            <img src="<%=basePath%>shop/img/类别 (1).png"/>
								<li>分类:</li>
								<li>${requestScope.product.product_type_id.name}</li>
							</ul>

							<ul class="product-links">
                            <img src="<%=basePath%>shop/img/手机 (4).png"/>
								<li>联系电话:</li>
                                <li>${requestScope.product.phone}</li>
								<li>qq</li>
								<li>${requestScope.product.qq}</li>
								<li>微信</li>
								<li>${requestScope.product.weixin}</li>
							</ul>
                            
                            <ul class="product-links">
                            <img src="<%=basePath%>shop/img/地址.png"/>
								<li>地址:</li>
                                <li>${requestScope.user_id.address}</li>
							</ul>

							<ul class="product-links">
								<li>发布时间</li>
								<li><fmt:formatDate type="date" value="${requestScope.product.time}" dateStyle="default"/></li>
							</ul>
                            
                            <ul class="product-links">
                          
								<li>描述:</li>
                                <p>${requestScope.product.remake}</p>
							</ul>
                            
                           
                            <div class="add-to-cart">
								<button class="primary-btn" OnClick="Collection_button(${requestScope.product.id});">收藏</button>
							</div>

						</div>
					</div>
					<!-- /Product details -->
					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								
								<li><a data-toggle="tab" href="#tab3">评论(${fn:length(requestScope.product_comment)})</a></li>
							</ul>
							<!-- /product tab nav -->

							<!-- product tab content -->
							<div class="tab-content">


										<!-- Reviews -->
										<div class="col-md-6">
											<div id="reviews">
												<ul class="reviews">
                                                  <c:forEach items="${requestScope.product_comment}" var="list">
													<li>
														<div class="review-heading">
															<h5 class="name">${list.user_id.name} </h5>
															<c:choose>
																<c:when test="${list.praise==true}">
																	<i style="color: green;">好评</i>

																</c:when>
																<c:otherwise>
																	<i style="color: red;">差评</i>
																</c:otherwise>
															</c:choose>

															<p class="date">
																<fmt:formatDate type="date" value="${list.time}" dateStyle="default"/></p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>${list.comment}</p>
														</div>
													</li>
												  </c:forEach>
												</ul>
												<ul class="reviews-pagination">
													<c:forEach var="index" end="${requestScope.comment_pagemax}" begin="0" varStatus="s">
														<li
																<c:choose>
																	<c:when test="${s.index==comment_page}">
																		class="active"
																	</c:when>
																</c:choose>
														>
															<a href="<%=basePath%>shop/product/edit?
															id=${requestScope.id}&
															comment_page=${s.index}">
																	${s.index+1}</a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<!-- /Reviews -->

										<!-- Review Form -->
										<div class="col-md-3">
											<div id="review-form">
												<form class="review-form" method="post" id="myform">
													<input  type="hidden" value="${requestScope.id}" name="product_id.id"/>
													<textarea class="input" placeholder="填写评论内容" style="height: 200px;" name="comment" id="comment"></textarea>
													<div class="input-rating">
												<i style="color: #8D99AE">对本商品进行评价:</i>
														<div class="stars">
															<select name="praise">
																<option value="true">好评</option>
																<option value="false">差评</option>
															</select>
														</div>
													</div>
													<input class="primary-btn" type="button" id="comment_button" value="评论"/>
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
                   <c:forEach items="${requestScope.product_all}" var="list">
					   <c:choose>
						   <c:when test="${list.id!=requestScope.product.id}">
							   <!-- product -->
							   <div class="col-md-3 col-xs-6">
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
										   <h4 class="product-price">$${list.price}<del class="product-old-price">$${list.prices}</del></h4>
										   <div class="product-rating">
											   <i class="fa fa-star"></i>
											   <i class="fa fa-star"></i>
											   <i class="fa fa-star"></i>
											   <i class="fa fa-star"></i>
											   <i class="fa fa-star"></i>
										   </div>
										   <div class="product-btns">
											   <button class="add-to-wishlist" OnClick="Collection_button(${list.id});"><i class="fa fa-heart-o"></i><span class="tooltipp">加入收藏</span></button>
										   </div>
									   </div>
									   <div class="add-to-cart">
										   <a href="<%=basePath%>shop/product/edit?id=${list.id}"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> 查看详情</button></a>
									   </div>
								   </div>
							   </div>
							   <!-- /product -->
						   </c:when>
					   </c:choose>
					</c:forEach>




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

            $("#comment_button").click(function() {
                if($("#comment").val()==null||$("#comment").val()==""){
                    alert("请填写！");
				}else {
                    $.post("<%=basePath%>shop/login/index/product_comment/post",
                        $("#myform").serialize(),
                        function (data) {
                            if (data == "1") {
                                alert("评论成功");
                                location.reload();
                            } else {
                                alert("评论失败，可能原因未登录");
                            }
                        });
                }
                } );

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
