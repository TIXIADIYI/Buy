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
	<title>个人中心</title>
	<script type="text/javascript" src="<%=basePath%>shop/js/jquery-2.1.4.min.js"></script>

    <link rel="stylesheet" href="<%=basePath%>shop/css/layui.css"></script>

<link rel="stylesheet" href="<%=basePath%>shop/css/public.css?=0.1">

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
	<!--<div id="header">-->

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
					<li><a href="<%=basePath%>shop/login/index/my/comment" class=""><i class="icon"></i><img src="<%=basePath%>shop/img/ly.png" />&nbsp;我的评论</a></li>
					<li><a href="<%=basePath%>shop/login/index/my/edit" class="active"><i class="icon"></i><img src="<%=basePath%>shop/img/xx.png" />&nbsp;个人信息</a></li>
				</ul>
			</div>
		</div>
<!--右边-->
		<form method="post" id="loginform">
	<div class="user-main userinfo fr" data-uid="6709">
		<input type="hidden" name="id" value="${sessionScope.user.id}">
		<input type="hidden" name="user" value="${sessionScope.user.user}">
		<div class="layui-form">
				<div class="layui-form-item">
					<label class="layui-form-label picture-para">头像</label>
					<div class="layui-input-block">
						<img src="${sessionScope.user.header}" class="user-info-picture">
						<input type="text" name="image" id="url1"  placeholder="" value="${requestScope.product.image}" class="layui-input nick-name" style="width:50%">
						<input type="button" id="image1"  class="btn btn-primary radius" style="width:120px;" value="点我选择图片" />
						<a href="#" id="clearImagePath1">清除选择图片路径</a>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><em>*</em>昵称</label>
					<div class="layui-input-inline">
						<input type="text" name="name" autocomplete="off" class="layui-input nick-name" value="${sessionScope.user.name}">
					</div>
					<div class="layui-form-mid layui-word-aux">3-16位 汉字、数字、字母（大小写）、下划线组成</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">签名</label>
					<div class="layui-input-inline">
						<input type="text" name="remake" autocomplete="off" class="layui-input signature" value="${sessionScope.user.remake}" style="width: 100%;">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label"><em>*</em>　性别</label>
					<div class="layui-input-inline sex-wr">
						<select name="sex">
							<option value="true">男</option>
							<option value="false"
									<c:choose>
										<c:when test="${sessionScope.user.sex==false}">
											selected
										</c:when>
									</c:choose>
							>女</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">生日</label>
					<div class="layui-input-inline">
						<input class="layui-input birthday" type="date"  name="time" value="<fmt:formatDate value='${sessionScope.user.time}' pattern='yyyy-MM-dd' />">
					</div>
					<div class="layui-form-mid layui-word-aux">（该信息其他人不可见）</div>
				</div>
				<div class="layui-form-item area" >
					<label class="layui-form-label">所在地</label>
					<div class="layui-input-inline">
						<input class="layui-input birthday"  name="address" type="text"  value="${sessionScope.user.address}">
					</div>
				</div>
			<div class="layui-form-item area" >
				<label class="layui-form-label"><em>*</em>旧密码</label>
				<div class="layui-input-inline">
					<input class="layui-input birthday"  name="pass_ord" type="password"  value="">
				</div>
			</div>
			<div class="layui-form-item area" >
				<label class="layui-form-label">新密码</label>
				<div class="layui-input-inline">
					<input class="layui-input birthday"  name="pass" type="password"  value="">
				</div>
			</div>
				<div class="layui-form-item">
					<label class="layui-form-label"></label>
					<div class="layui-input-inline">
						<input href="javascript:;" class="userinfo-submit layui-btn" type="button" id="edit_button" value="修改"></input>
					</div>
				</div>
			</div>
		</div>
	</div>
		></form>
	<div id="footer">
		<!--右边结束-->

	
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
				<!--<script>
					var _hmt = _hmt || [];
					(function() {
					var hm = document.createElement("script");
					hm.src = "https://hm.baidu.com/hm.js?b43531d7c229bad3bcbfbc7991208c60";
					var s = document.getElementsByTagName("script")[0]; 
					s.parentNode.insertBefore(hm, s);
					})();
				</script>-->
			</p>
			<p class="tips">本站所有信息均为用户自由发布，本站不对信息的真实性负任何责任，交易时请注意识别信息的真假如有网站内容侵害了您的权益请联系我们删除</p>
			
			
		</div>
	</div>
</div>

</body>
<link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css" />
<script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor.js"></script>
<script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script language="JavaScript" src="<%=basePath%>shop/js/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#edit_button").click(function () {
                $.post("<%=basePath%>shop/login/index/my/edit/post",
                    $("#loginform").serialize(),
                    function (data) {
                        if (data == "1") {
                            alert("编辑成功");
                            location.reload();
                        }else if(data=="2"){
                            alert("原密码错误");
						} else {
                            alert("编辑失败");
                        }
                    });
            }
        )
    });
</script>
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
</html>