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
<title>添加推荐语</title>
</head>
<body>
<div class="pd-20">
	<form action="/" method="post" class="form form-horizontal"  id="admin_">
		<c:choose>
			<c:when test="${requestScope.add_or_edit==false}">
				<input name="id" value="${requestScope.recommend.id}" type="hidden" class="input-text" autocomplete="off"    >
			</c:when>
		</c:choose>
		<div class="row cl">
			<label class="form-label col-4"><span class="c-red">*</span>推荐语</label>
			<div class="formControls col-4">
				<input name="commend" value="${requestScope.recommend.commend}" type="text" class="input-text" autocomplete="off"    >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-4"><span class="c-red">*</span>实际搜索内容</label>
			<div class="formControls col-4">
				<input name="value" type="text" class="input-text" autocomplete="off"  value="${requestScope.recommend.value}"   >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-4"><span class="c-red">*</span>发布的管理员</label>
			<div class="formControls col-4">
                <select class="select" name="admin_id.id">
					<c:forEach items="${requestScope.admin}" var="list">
						<c:choose>
							<c:when test="${list.id==requestScope.recommend.admin_id.id}">
								<option value="${list.id}" selected>${list.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${list.id}">${list.name}</option>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</select>
			</div>
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
        var urls="<%=basePath%>admin/index/recommend/edit/post";
        if(${requestScope.add_or_edit==true}){
            urls="<%=basePath%>admin/index/recommend/add/post";
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