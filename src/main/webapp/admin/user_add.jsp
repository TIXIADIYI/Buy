<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=basePath%>admin/lib/html5.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/respond.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="<%=basePath%>admin/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="<%=basePath%>admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增商品</title>
</head>
<body>
<div class="pd-20">
	<form action="" method="post" class="form form-horizontal" id="admin_product" >
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-10">

				<c:choose>
					<c:when test="${requestScope.add_or_edit==false}">
						<input type="hidden" class="input-text" value="${requestScope.user.id}" placeholder=""  name="id">
						<input type="text" class="input-text" disabled value="${requestScope.user.user}" placeholder=""  name="user" >
					</c:when>
					<c:otherwise>
						<input type="text" class="input-text" value="${requestScope.user.user}" placeholder=""  name="user" >
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>昵称</label>
			<div class="formControls col-4">	<input type="text" class="input-text" value="${requestScope.user.name}" placeholder=""  name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>密码</label>
			<div class="formControls col-4"><input type="password" class="input-text" value="${requestScope.user.pass}" placeholder=""  name="pass">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>个性签名</label>
			<div class="formControls col-4">	<input type="text" class="input-text" value="${requestScope.user.remake}" placeholder=""  name="remake">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>性别</label>
				<div class="formControls col-4"> <span class="select-box">
				<select name="sex" class="select">

					<option value="1">男</option>
					<option value="0"
							<c:choose>
								<c:when test="${requestScope.user.sex==false}">
									selected
								</c:when>
							</c:choose>
					>女</option>
				</select>
				</span> </div>



		</div>

		<div class="row cl">
			<label class="form-label col-2">生日</label>
			<div class="formControls col-4">
				<input type="date"  name="time" id="time" class="input-text Wdate" style="width:90%;"
					   value="<fmt:formatDate value='${requestScope.user.time}' pattern='yyyy-MM-dd' />">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>地址</label>
			<div class="formControls col-4">	<input type="text" class="input-text" value="${requestScope.user.address}" placeholder=""  name="address">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-2">头像上传</label>
			<div class="formControls col-10">
				<input type="text" name="header" id="url1"  placeholder="" value="${requestScope.product.header}" class="input-text" style="width:50%">
				<input type="button" id="image1"  class="btn btn-primary radius" style="width:120px;" value="点我选择图片" />
				<a href="#" id="clearImagePath1">清除选择图片路径</a>
			</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onClick="Button();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>
</div>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
function  Button(){
    if(${requestScope.add_or_edit==true}) {
        $.post("<%=basePath%>admin/index/user/add/post",
            $("#admin_product").serialize(),
            function (data) {
                if (data == "1") {
                    layer.msg('添加成功!', {icon: 6, time: 1000});
                    setTimeout(function (){
                        window.parent.location.reload();
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
					},1000);
                } else if (data == "0") {
                    layer.msg('添加失败', {icon: 5, time: 1000});
                }
            });
    }else{
        $.post("<%=basePath%>admin/index/user/edit/post",
            $("#admin_product").serialize(),
            function (data) {
                if (data == "1") {
                    layer.msg('编辑成功!', {icon: 6, time: 1000});
                    setTimeout(function (){
                        window.parent.location.reload();
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
					},1000);
                } else if (data == "0") {
                    layer.msg('编辑失败', {icon: 5, time: 1000});
                }
            });
	}
}
</script>

<!-- 导入kindEditor所需插件 -->
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
</body>
</html>