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
			<label class="form-label col-2"><span class="c-red">*</span>产品标题：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="${requestScope.product.name}" placeholder=""  name="name">
				<c:choose>
					<c:when test="${requestScope.add_or_edit==false}">
						<input type="hidden" class="input-text" value="${requestScope.product.id}" placeholder=""  name="id">
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>商品分类</label>
			<div class="formControls col-4"> <span class="select-box">
				<select name="product_type_id.id" class="select">
					<c:forEach items="${requestScope.product_type}" var="list">
						<c:choose>
							<c:when test="${list.id==requestScope.product.product_type_id.id}">
								<option value="${list.id}" selected>${list.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${list.id}">${list.name}</option>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</select>
				</span> </div>
			<label class="form-label col-2">上传的用户</label>
			<div class="formControls col-4"> <span class="select-box">
				<select name="user_id.id" class="select">
					<option value="null">无</option>
						<c:forEach items="${requestScope.user}" var="list">
							<c:choose>
							<c:when test="${list.id==requestScope.product.user_id.id}">
								<option value="${list.id}" selected>${list.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${list.id}">${list.name}</option>
							</c:otherwise>
							</c:choose>
						</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>打折后价格：</label>
			<div class="formControls col-4">
				<input type="text" name="price" id="" placeholder="" value="${requestScope.product.price}" class="input-text" style="width:90%">
				元</div>
			<label class="form-label col-2">打折前价格：</label>
			<div class="formControls col-4">
				<input type="text" name="prices" id=""  placeholder="若无打折可不填" value="${requestScope.product.prices}" class="input-text" style="width:90%">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">库存</label>
			<div class="formControls col-4">
				<input type="text" name="sum" id="" placeholder="" value="${requestScope.product.sum}" class="input-text" style="width:90%">
				</div>
			<label class="form-label col-2">点击数</label>
			<div class="formControls col-4">
				<input type="text" name="click" id=""  placeholder="" value="${requestScope.product.click}" class="input-text" style="width:90%">
				</div>
		</div>
		<div class="row cl">
		<label class="form-label col-2">qq</label>
		<div class="formControls col-4">
			<input type="text" name="qq" id="" placeholder="" value="${requestScope.product.qq}" class="input-text" style="width:90%">
		</div>
		<label class="form-label col-2">微信</label>
		<div class="formControls col-4">
			<input type="text" name="weixin" id=""  placeholder="" value="${requestScope.product.weixin}" class="input-text" style="width:90%">
		</div>
	</div>
		<div class="row cl">
			<label class="form-label col-2">手机</label>
			<div class="formControls col-4">
				<input type="text" name="phone" id=""  placeholder="" value="${requestScope.product.phone}" class="input-text" style="width:90%">
			</div>
			<label class="form-label col-2"><span class="c-red">*</span>是否上架</label>
			<div class="formControls col-4"> <span class="select-box">
				<select name="display" class="select">
					<option value="true">是</option>
					<option value="false">否</option>
				</select>
				</span> </div>
		</div>

		<div class="row cl">
			<label class="form-label col-2">上架时间：</label>
			<div class="formControls col-4">
				<input type="date"  name="time" id="time" class="input-text Wdate" style="width:90%;"
					   value="<fmt:formatDate value='${requestScope.product.time}' pattern='yyyy-MM-dd' />">
			</div>
	</div>

		<div class="row cl">
			<label class="form-label col-2">图片上传：</label>
			<div class="formControls col-10">
				<input type="text" name="image" id="url1"  placeholder="" value="${requestScope.product.image}" class="input-text" style="width:50%">
				<input type="button" id="image1"  class="btn btn-primary radius" style="width:120px;" value="点我选择图片" />
				<a href="#" id="clearImagePath1">清除选择图片路径</a>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">详细内容：</label>
			<div class="formControls col-10">
				<input type="text" name="remake" id="" placeholder="填写商品介绍" value="${requestScope.product.remake}" class="input-text" style="width:90%;height: 200px">
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
        $.post("<%=basePath%>admin/index/product/add/post",
            $("#admin_product").serialize(),
            function (data) {
                if (data == "1") {
                    layer.msg('添加成功!', {icon: 6, time: 1000});
                } else if (data == "0") {
                    layer.msg('添加失败', {icon: 5, time: 1000});
                }
            });
    }else{
        $.post("<%=basePath%>admin/index/product/edit/post",
            $("#admin_product").serialize(),
            function (data) {
                if (data == "1") {
                    layer.msg('编辑成功!', {icon: 6, time: 1000});
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