﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="<%=basePath%>admin/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<title>商品列表</title>
</head>
<body class="pos-r">
<div >
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="pd-10">
		<div class="cl pd-5 bg-1 bk-gray "> <span class="l">
			<a href="#" id="datadel" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a class="btn btn-primary radius" onclick="product_add('添加产品','<%=basePath%>admin/index/product/add')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a>
		</span>
			<span class="r">共有数据：<strong>${fn:length(requestScope.product)}</strong> 条</span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40"><input name="" type="checkbox" value=""></th>
						<th width="40">ID</th>
						<th width="60">缩略图</th>
						<th width="60">产品名称</th>
						<th>描述</th>
						<th width="40">单价</th>
						<th width="40">库存</th>
						<th>点击数</th>
						<th>分类</th>
						<th width="40">上架时间</th>
						<th width="60">上架状态</th>
						<th>上架用户</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
                <c:forEach items="${requestScope.product}" var="list">
					<tr class="text-c va-m">
						<td><input name="checkbox" type="checkbox" value="${list.id}" ></td>
						<td >${list.id}</td>
						<td><img width="60" class="product-thumb" src="${list.image}"></td>
						<td class="text-l"> ${list.name}</td>
						<td class="text-l">${list.remake}</td>
						<td><span class="price">${list.price}(原价:${list.prices})RMB</span> </td>
						<td>${list.sum}</td>
						<td>${list.click}</td>
						<td>${list.product_type_id.name}</td>
						<td><fmt:formatDate
								type="date"
								value="${list.time}"
								dateStyle="default"
						/></td>
						<td class="td-status">
							<c:choose>
								<c:when test="${list.display==false}">
									<span class="label label-defaunt radius">已下架</span>
								</c:when>
								<c:otherwise>
									<span class="label label-success radius">已上架</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
						<c:choose>
							<c:when test="${list.user_id.user==null}">

							</c:when>
							<c:otherwise>
								${list.user_id.user}(${list.user_id.name})
							</c:otherwise>
						</c:choose>
						</td>
						<td class="td-manage">
							<c:choose>
								<c:when test="${list.display==false}">
								<a  id="${list.id}" style="text-decoration:none" onClick="product_start(this,id)" href="javascript:;" title="上架">
								</c:when>
								<c:otherwise>
								<a id="${list.id}" style="text-decoration:none" onClick="product_stop(this,id)" href="javascript:;" title="下架">
								</c:otherwise>
							</c:choose>


								<i class="Hui-iconfont">&#xe6de;</i></a>
							<a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','<%=basePath%>admin/index/product/edit?id=${list.id}','')" href="javascript:;" title="编辑">
							<i class="Hui-iconfont">&#xe6df;</i></a> <a  id="${list.id}" style="text-decoration:none" class="ml-5" onClick="product_del(this,id)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};




$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,10]}// 制定列不参与排序
	]
});
/*图片-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-查看*/
function product_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-下架*/
function product_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
        $.get("<%=basePath%>admin/index/product/display_tf?id="+id+"&&display=false",
            function (data) {
                if(data=="1"){
                    $(obj).parents("tr").find(".td-manage").prepend('<a id='+id+' style="text-decoration:none" onClick="product_start(this,id)" href="javascript:;" title="上架"><i class="Hui-iconfont">&#xe603;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                    layer.msg('已下架!',{icon: 6,time:1000});
                    $(obj).remove();
                }else{
                    layer.msg('下架失败!',{icon: 5,time:1000});
                }
            });
	});
}

/*图片-发布*/
function product_start(obj,id){
	layer.confirm('确认要上架吗？',function(index){
        $.get("<%=basePath%>admin/index/product/display_tf?id="+id+"&&display=true",
            function (data) {
                if(data=="1"){
                    $(obj).parents("tr").find(".td-manage").prepend('<a  id='+id+' style="text-decoration:none" onClick="product_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上架</span>');
                    $(obj).remove();
                    layer.msg('已上架!',{icon: 6,time:1000});
                    $(obj).remove();
                }else{
                    layer.msg('上架失败!',{icon: 5,time:1000});
                }
            });
	});
}

/*图片-编辑*/
function product_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-删除*/
function product_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
        $.get("<%=basePath%>admin/index/product/del?id="+id+" ",
            function (data) {
                if(data=="1"){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:6,time:1000});
                }else{
                    layer.msg('删除失败!',{icon: 5,time:1000});
                }
            });
	});
}

$("#datadel").click(function (){
    layer.confirm('确认要删除吗？',function(index){
        var s = document.getElementsByName("checkbox");
       for(var i=0;i<s.length;i++){
           if(s[i].checked){
               $.get("<%=basePath%>admin/index/product/del?id="+s[i].value+" ",
                   function (data) {
                   });
		   }
	   }
	   if(s.length!=0) {
           layer.msg('已删除所选!', {icon: 6, time: 1000});
           setTimeout(" location.reload()",1000)
       }
    });
}

);

</script>
</body>
</html>