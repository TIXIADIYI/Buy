<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

	<script type="text/javascript" src="<%=basePath%>admin/lib/html5.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/lib/respond.min.js"></script>

	<link href="<%=basePath%>admin/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>admin/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>admin/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<title>修改密码</title>
</head>
<body>
<div class="pd-20">
	<form action="/" method="post" class="form form-horizontal"  id="admin_">
		<c:choose>
			<c:when test="${requestScope.add_or_edit==true}">
			</c:when>
			<c:otherwise>
				<div class="row cl">
					<label class="form-label col-4"><span class="c-red">*</span>ID：</label>
					<div class="formControls col-4"> ${requestScope.admin.id} </div>
					<div class="col-4"><input name="id" value="${requestScope.admin.id}" type="hidden"> </div>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="row cl">
			<label class="form-label col-4"><span class="c-red">*</span>账号名：</label>
			<div class="formControls col-4">
				<input name="name" value="${requestScope.admin.name}" type="text" class="input-text" autocomplete="off"    >
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-4"><span class="c-red">*</span>新密码：</label>
			<div class="formControls col-4">
				<input name="pass" type="password" class="input-text" autocomplete="off"  value="${requestScope.admin.pass}"   >
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-4"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-4">
				<input name="pass2" type="password" class="input-text" autocomplete="off"  >
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<div class="col-8 col-offset-4">
				<input class="btn btn-primary radius" type="button" onClick="Button();"  value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/H-ui.admin.js"></script>
<script>
    function  Button(){
        var urls="<%=basePath%>admin/index/pass/post";
        if(${requestScope.add_or_edit==true}){
            urls="<%=basePath%>admin/index/add/post";
		}
        $.post(urls,
                $("#admin_").serialize(),
                function (data) {
                    if (data == "1") {
                        layer.msg('成功!', {icon: 6, time: 1000});
                        setTimeout(function (){
                            window.parent.location.reload();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        },1000);
                    } else if (data == "2") {
                        layer.msg('失败，填写不完整', {icon: 5, time: 1000});
                    } else if (data == "3") {
                        layer.msg('失败，两次密码不一致', {icon: 5, time: 1000});
                    } else {
                        layer.msg('失败', {icon: 5, time: 1000});
                    }
                });
    }


$(function(){
	$("#form-change-password").Validform({
		tiptype:2,
		callback:function(form){
			form[0].submit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	});
});

</script>
</body>
</html>