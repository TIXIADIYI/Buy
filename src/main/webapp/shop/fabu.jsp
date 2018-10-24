<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>校园二手发布</title>
		<!-- Google font -->

        <link type="text/css" rel="stylesheet" href="<%=basePath%>shop/css/sale.css"/>
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
						<li><a href="#"><i class="fa fa-dollar"></i> 登录</a></li>
						<li><a href="#"><i class="fa fa-dollar"></i> 注册</a></li>
						<li><a href="grzx.jsp"><img src="<%=basePath%>shop/img/grzx.png" />&nbsp;个人中心</a></li>
					</ul>
				</div>
			</div>

		</header>
		<!-- /顶部结束 -->
		<!-- 发布中间的 -->   
		                    <div style="margin-left:500px; class="section-title">
								<h3 style="margin-top: 30px;">发布二货</h3>
							</div>
		<div class="ibox-content">
                <form action="/Home/Release/dosale" class="form-horizontal m-t" id="saleForm" method="post">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">标题：</label>
                        <div class="col-sm-8">
                            <input id="title" name="title" class="required form-control" type="text" placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">详情：</label>
                        <div class="col-sm-8">
                            <textarea id="detail" name="detail" placeholder="请输入详情" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">封面：<!-- <span class="badge badge-warning " id="tip1">？</span> --></label>
                        <div class="col-sm-8">
                            <div data-toggle="modal" id="modal1" data-target="#myModal1"  class="modal-btn btn btn-default btn-block" style="width:60%;">点击上传</div>
                        </div>
                    </div>
                    <div class="form-group">

                        <label class="col-sm-3 control-label">相册：<!-- <span class="badge badge-warning " id="tip2">？</span> --></label>
                        <div class="col-sm-8">
                            <div data-toggle="modal" id="modal2" data-target="#myModal2"  class="modal-btn btn btn-default btn-block" style="width:60%;">点击上传</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">交易地点：</label>
                        <div class="col-sm-8">
                            <input id="address" name="address" class="form-control" placeholder="宿舍、教学楼、食堂等" type="text" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">价格：</label>
                        <div class="col-sm-8" >
                            <input id="price" name="price"  class="form-control" placeholder="请输入商品价格" type="text" style="width:60%;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">学校：</label>
                        <div class="col-sm-8">
                            <select id="school" name="school" data-placeholder="选择学校..." class="chosen-select" style=" width: 60%;" tabindex="2">
                                <option checked value="1" hassubinfo="true">学校</option><option  value="2" hassubinfo="true">柳州城市学院</option><option  value="3" hassubinfo="true">柳铁</option><option  value="4" hassubinfo="true">柳职</option> </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">分类：</label>
                        <div class="col-sm-8">
                            <select id="type" name="type" data-placeholder="选择分类..." class="chosen-select"  style=" width: 60%;" tabindex="2">
                                <option value="1">选择分类</option>
                                <option value="2">手机</option>
                                <option value="3">电脑</option>
                                <option value="4">数码</option>
                                <option value="5">电器</option>    
                                <option value="6">书籍教材</option>
                                <option value="11">其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机：</label>
                        <div class="col-sm-8">
                            <input id="username" name="tel" class="form-control" placeholder="手机号" type="text" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">QQ：</label>
                        <div class="col-sm-8">
                            <input id="username" name="qq" class="form-control" placeholder="QQ号" type="text" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">微信：</label>
                        <div class="col-sm-8">
                            <input id="username" name="weixin" class="form-control" placeholder="微信号" type="text" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-3">
                            <button type="submit" class="btn btn-primary btn-block" style="width:30%;">发布</button>
                        </div>
                    </div>
                     
                     
                </form>
            </div>
        </div>
		<!-- /发布中间的结束 -->
		
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
		<!-- /底部结束 -->
	</body>
	
</html>
