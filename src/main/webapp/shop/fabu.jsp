<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">

						<li><a href="<%=basePath%>shop/index">首页</a></li>
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

		</header>
		<!-- /顶部结束 -->
		<!-- 发布中间的 -->   
		                    <div style="margin-left:500px;" class="section-title">
								<h3 style="margin-top: 30px;">发布二货</h3>
							</div>
		<div class="ibox-content">
                <form action="/Home/Release/dosale" class="form-horizontal m-t" id="myform" method="post">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">标题：</label>
                        <div class="col-sm-8">
                            <input id="title" name="name" class="required form-control" type="text" placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">详情：</label>
                        <div class="col-sm-8">
                            <textarea id="detail" name="remake" placeholder="请输入详情" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">图片：<!-- <span class="badge badge-warning " id="tip1">？</span> --></label>
                        <div class="col-sm-8">
							<input type="text" name="image" id="url1"  placeholder="" value="${requestScope.product.image}" class="form-control" style="width:50%">
							<input type="button" id="image1"  class="btn btn-primary radius" style="width:120px;" value="点我选择图片" />
							<a href="#" id="clearImagePath1">清除选择图片路径</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">价格：</label>
                        <div class="col-sm-8" >
                            <input id="price" name="price"  class="form-control" placeholder="请输入商品价格" type="text" style="width:60%;">
                        </div>
                    </div>
					<div class="form-group">
						<label class="col-sm-3 control-label">原价格：</label>
						<div class="col-sm-8" >
							<input id="prices" name="prices"  class="form-control" placeholder="请输入商品价格" type="text" style="width:60%;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">库存</label>
						<div class="col-sm-8" >
							<input id="sum" name="price"  class="form-control" placeholder="请输入商品价格" type="text" style="width:60%;">
						</div>
					</div>
                    <div class="form-group">
					<label class="col-sm-3 control-label">分类：</label>
					<div class="col-sm-8">
						<select id="type" name="product_type_id.id" data-placeholder="选择分类..." class="chosen-select"  style=" width: 60%;" tabindex="2">
							<c:forEach items="${requestScope.product_type}" var="list">
								<option value="${list.id}">${list.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">是否上架</label>
						<div class="col-sm-8">
							<select  name="display" data-placeholder="选择分类..." class="chosen-select"  style=" width: 60%;" tabindex="2">
                                <option value="true">是</option>
								<option value="false">否</option>
							</select>
						</div>
					</div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机：</label>
                        <div class="col-sm-8">
                            <input id="phone" name="tel" class="form-control" placeholder="手机号" type="text" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">QQ：</label>
                        <div class="col-sm-8">
                            <input id="qq" name="qq" class="form-control" placeholder="QQ号" type="text" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">微信：</label>
                        <div class="col-sm-8">
                            <input id="weixin" name="weixin" class="form-control" placeholder="微信号" type="text" aria-required="true" aria-invalid="true" class="error">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-3">
                            <button type="button" class="btn btn-primary btn-block" style="width:30%;" id="fabu_button">发布</button>
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
	<!-- 导入kindEditor所需插件 -->
	<script language="JavaScript" src="<%=basePath%>shop/js/jquery.js"></script>
	<link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css" />
	<script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor.js"></script>
	<script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script>
        //当点击“清除图片路径”时，将清除图片路径信息
        $("#clearImagePath1").click(function(){
            $("input[id='url1']").attr('value','');
        });
        //实现kindeditor弹出图片上传窗口
        KindEditor.ready(function(K) {
            var editor = K.editor({//图片上传
                //指定上传文件的服务器端程序。
                uploadJson:  '<%=basePath%>plugins/kindeditor-4.1.10/jsp/upload_json.jsp',
                //指定浏览远程图片的服务器端程序
                fileManagerJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp',
                //是否允许进行文件管理
                allowFileManager : true
            });
            K('#image1').click(function() {
                editor.loadPlugin('image', function() {//动态加载插件，image为插件名
                    editor.plugin.imageDialog({
                        showLocal : true,//是否显示本地图片上传窗口
                        showRemote : true,//是否显示网络图片窗口
                        fillDescAfterUploadImage:false,//个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框。
                        imageUrl : K('#url1').val(),
                        clickFn : function(url, title, width, height, border, align) {
                            K('#url1').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
	</script>
<script>
$("#fabu_button").click(function () {
    $.post("<%=basePath%>shop/login/index/product/add/post",
        $("#myform").serialize(),
        function (data) {
            if (data == "1") {
                alert("发布成功");
                window.location.href="<%=basePath%>shop/store/all";
            } else {
                alert("发布失败");
            }
        });
})
</script>

        </html>
