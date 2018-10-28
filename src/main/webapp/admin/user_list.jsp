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
<title>商品列表</title>
</head>
<body class="pos-r">
<div >
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="pd-10">
		<div class="cl pd-5 bg-1 bk-gray "> <span class="l">
			<a href="#" id="datadel" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a class="btn btn-primary radius" onclick="product_add('添加产品','<%=basePath%>admin/index/user/add')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a>
		</span>
			<span class="r">共有数据：<strong>${fn:length(requestScope.user)}</strong> 条</span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40"><input name="" type="checkbox" value=""></th>
						<th width="40">ID</th>
						<th width="60">头像</th>
						<th >用户名昵称</th>
						<th>个性签名</th>
						<th>性别</th>
						<th>地址</th>
						<th>出生日期</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
                <c:forEach items="${requestScope.user}" var="list">
					<tr class="text-c va-m">
						<td><input name="checkbox" type="checkbox" value="${list.id}" ></td>
						<td >${list.id}</td>
						<td><img width="60" class="product-thumb" src="${list.header}"></td>
						<td > ${list.user}( ${list.name})</td>
						<td>${list.remake}</td>
						<td><span class="label label-success radius">
							<c:choose>
								<c:when test="${list.sex==false}">
									女
								</c:when>
								<c:otherwise>
									男
								</c:otherwise>
							</c:choose>
							</span>
						</td>
						<td>${list.address}</td>
						<td><fmt:formatDate type="date" value="${list.time}" dateStyle="default" /></td>
						<td class="td-manage">
							<a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','<%=basePath%>admin/index/user/edit?id=${list.id}','')" href="javascript:;" title="编辑">
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
	  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
	]
});


/*图片-编辑*/
function product_edit(title,url,id){
    var index = layer.open({
        type: 2,
        title: title,
        content: url
    });
    layer.full(index);
}

/*图片-添加*/
function product_add(title,url){
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
        $.get("<%=basePath%>admin/index/user/del?id="+id+" ",
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
               $.get("<%=basePath%>admin/index/user/del?id="+s[i].value+" ",
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