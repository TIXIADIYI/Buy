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
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="<%=basePath%>admin/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>admin/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<title>商品分类列表</title>
</head>
<body class="pos-r">
<div >
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品分类管理 <span class="c-gray en">&gt;</span> 分类列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="pd-10">
		<div class="cl pd-5 bg-1 bk-gray "> <span class="l">
			<a href="#" id="datadel" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a class="btn btn-primary radius" onclick="product_add('添加产品分类','<%=basePath%>admin/index/product/add')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加分类</a>
		</span>
			<span class="r">共有数据：<strong>${fn:length(requestScope.product_type)}</strong> 条</span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40"><input name="" type="checkbox" value=""></th>
						<th width="40">ID</th>
						<th width="60">名称</th>
					</tr>
				</thead>
				<tbody>
                <c:forEach items="${requestScope.product_type}" var="list">
					<tr class="text-c va-m">
						<td><input name="checkbox" type="checkbox" value="${list.id}" ></td>
						<td >${list.id}</td>
						<td>${list.name}</td>
						<td class="td-manage">
							<a style="text-decoration:none" class="ml-5" onClick="product_edit('分类编辑','<%=basePath%>admin/index/product/edit?id=${list.id}','')" href="javascript:;" title="编辑">
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
	  {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
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
/*图片-审核*/
function product_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
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
/*图片-申请上线*/
function product_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
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
           layer.msg('已删除!', {icon: 6, time: 1000});
           setTimeout(" location.reload()",1000)
       }
    });
}

);

</script>
</body>
</html>