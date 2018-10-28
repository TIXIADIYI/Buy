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
<body >
<div class="pd-20">
	<form action="" method="post" class="form form-horizontal" id="admin_product" >
		<c:choose>
			<c:when test="${requestScope.add_or_edit==false}">
				<input name="id" value="${requestScope.user_collection.id}" type="hidden" class="input-text" autocomplete="off"    >
			</c:when>
		</c:choose>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>用户</label>
			<div class="formControls col-4">
				<select class="select" name="user_id.id">
					<c:forEach items="${requestScope.user}" var="list">
						<c:choose>
							<c:when test="${list.id==requestScope.user_collection.user_id.id}">
								<option value="${list.id}" selected>${list.user}(${list.name})</option>
							</c:when>
							<c:otherwise>
								<option value="${list.id}">${list.user}(${list.name})</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>商品</label>
			<div class="formControls col-4">
				<select class="select" name="product_id.id">
					<c:forEach items="${requestScope.product}" var="list">
						<c:choose>
							<c:when test="${list.id==requestScope.user_collection.product_id.id}">
								<option value="${list.id}" selected>${list.id}(${list.name})</option>
							</c:when>
							<c:otherwise>
								<option value="${list.id}">${list.id}(${list.name})</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
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
        $.post("<%=basePath%>admin/index/user_collection/add/post",
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
        $.post("<%=basePath%>admin/index/user_collection/edit/post",
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
</body>
</html>