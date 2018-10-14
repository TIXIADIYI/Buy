<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册交易网</title>
<script src="../js/jquery-1.7.2.js"> </script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/zc.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/zccs.css">
<script type="text/javascript" src="<%=basePath%>shop/js/jquery.min.js"></script>
<script src="<%=basePath%>shop/js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="<%=basePath%>shop/js/yanz.js"></script>
<script src="<%=basePath%>shop/js/yanz1.js"></script>
    <script language="JavaScript" src="<%=basePath%>shop/js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#button").click(function() {
                    $.post("<%=basePath%>shop/login/zhuce",
                        $("#loginform").serialize(),
                        function (data) {
                            if(data=="1"){
                                alert("注册成功");
                            }else if(data=="2"){
                                alert("注册失败，未填写完整");
                            }else if(data=="3"){
                                alert("注册失败，该账号已存在");
                            }else if(data=="4"){
                                alert("注册失败，两次密码不一致");
                            }else{
                                alert("注册失败");
                            }
                        });
                }
            )
        });
    </script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/yanzheng.css">

<script type="text/javascript" src="<%=basePath%>shop/js/111.js"></script>

</head>

<body>
  <div id="header">
    <div  class="area">
      <h1 class="log_logo left"><a href="javascript:;"><img src="<%=basePath%>shop/image/logo.png" width="80" height="80" align="middle" ></a></h1>
        
      <span>已经有帐号了？<a href="<%=basePath%>shop/index.jsp">去登录</a></span>
    </div>
  </div>
  

<form id="loginform" method="post" >
<div id="register" class="area clear">
  <div id="email" class="Panel PanelA clear l">
    <div class="reg_box clear">
    	
      <div class="item msg_zt1">
        <label>手机号：</label>
      
        
        <input type="text" class="itext1" placeholder="请输入您的手机号" id="uid" onkeyup="checkPhone()" name="user" /></br><i id="uidt" ></i></p>
        <div class="msg_box row1"><em></em><span class="msg"></span></div>
      </div>
      
      <div class="item msg_zt1">
        <label>密码：</label>
       <input id="pwd" type="password" class="itext1"   name="pass"/></br><i id="pwd_i"></i></p>
      </div>
      
      <div class="item msg_zt1">
        <label>确认密码：</label>
      <input id="repeatpsw" type="password" class="itext1" name="pass2"/></br><i id="repeatpsw_i"></i></p>
        
      </div>
      
       <!-- 拖动滑块-->
       <!--<div id="slider1" class="slider"></div>-->
       
      <!--<div class="item i_code">
        <label>验证码：</label>
        <input type="text" id="validCode" class="itext2" required>
        <span id="vcode_box"></span>
        <a href="javascript:void(0);" id="refresh_vcode"></a> -->
        <p>
          <input checked="checked" id="inputacc" type="checkbox">
          我已阅读并接受<a target="_blank" href="#">《用户服务协议》</a> </p>
      </div>
      <div class="item">
        <input id="button" type="button" value="同意协议并注册" />
      </div>
    </div>
  </div>
  
      </div>

    </div>
  </div>
</div>
</form>
<div id="footer">
  <div class="area">
    <a target="_blank" href="#" rel="nofollow">ICP证00000号</a>&nbsp;京ICP备123456号-5 <a href="#" target="_blank" rel="nofollow"></a> 食品流通许可证123456321 
    Copyright&copy;2011-2018 版权所有.COM <br /><a href="#" target="_blank">
    

  </div>
</div>


<span style="display:none">
</span>

</body>

<script>

</script>
</html>