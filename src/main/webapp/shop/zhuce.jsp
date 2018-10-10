<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册交易网</title>
<script src="<%=basePath%>shop/js/jquery-1.7.2.js"> </script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/zc.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>shop/css/zccs.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="js/yanz.js"></script>

<link rel="stylesheet" type="text/css" href="css/yanzheng.css">

<script type="text/javascript" src="js/111.js"></script>

<!--<script type='text/javascript' src="js/pp18610_v3.7.min.js"></script>

<script type='text/javascript' src="js/validrule1.1.min.js"></script>

<script type='text/javascript' src="js/pppub.min.js"></script>

<script type='text/javascript' src="js/pprule3.8.min.js"></script>
<script type='text/javascript' src="js/ppreg2.6.min.js"></script>-->

</head>

<body>
  <div id="header">
    <div  class="area">
      <div class="logo"><a href="#"></a></div>
      <span>已经有帐号了？<a href="#">去登录</a></span>
    </div>
  </div>
  

<form action="signin.html"id="customerReset" method="post" class="form">
<div id="register" class="area clear">
  <div id="email" class="Panel PanelA clear l">
    <div class="reg_box clear">
    	
      <div class="item msg_zt1">
        <label>手机号：</label>
       <!-- <input type="text" id="pemail" class="itext1" required  pattern="1\d{10}" placeholder="手机号码">-->
       	<!-- <input type="text" class="itext1" name="p_phone" id="p_phone" required placeholder="手机号码" onkeyup="phone()"/></br><i id="lay_phone"></i></p>-->
        
        <input type="text" class="itext1" placeholder="请输入您的手机号" id="uid" onkeyup="checkPhone()" />
        <span id="uidt" style="margin-left: 50px"></span>
        <div class="msg_box row1"><em></em><span class="msg"></span></div>
      </div>
      
      <div class="item msg_zt1">
        <label>密码：</label>
       
       <input id="pwd" type="password" class="itext1" onkeyup="checkpwd(pwd)" /></br><i id="pwd_i"></i></p>
        <div class="msg_box row1"><em></em><span class="msg"></span></div>
      </div>
      
      <div class="item msg_zt1">
        <label>确认密码：</label>
      
      <input id="repeatpsw" type="password" class="itext1" onkeyup="checkrpwd(pwd,repeatpsw)" /></br><i id="repeatpsw_i"></i></p>
        <div class="msg_box row1"><em></em><span class="msg"></span></div>
      </div>
      
       <!-- 拖动滑块-->
       <div id="slider1" class="slider"></div>
       
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
        <button href="#" class="i_btn" id="reg_submit"><i>同意协议并注册</i></button>
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
    <a target="_blank" href="#" rel="nofollow">京ICP证00000号</a>&nbsp;京ICP备123456号-5 <a href="#" target="_blank" rel="nofollow"></a> 食品流通许可证123456321 
    Copyright&copy;2011-2018 版权所有.COM <br /><a href="#" target="_blank">
    <a id='___szfw_logo___' href='#' target='_blank'><img src='image/cert.png' class="noborder"></a>
    <script type='text/javascript'>(function(){document.getElementById('___szfw_logo___').oncontextmenu = function(){return false;}})();</script>
  </div>
</div>

<script src="js/core_ga.min.js" type="text/javascript"></script>
<span style="display:none">
</span>

</body>

<script>

$("#slider1").slider({

callback: function(result) {

$("#result1").text(result);

}

});

$("#slider2").slider({

width: 340, // width

height: 40, // height

sliderBg: "rgb(134, 134, 131)", // 滑块背景颜色

color: "#fff", // 文字颜色

fontSize: 14, // 文字大小

bgColor: "#33CC00", // 背景颜色

textMsg: "按住滑块，拖拽验证", // 提示文字

successMsg: "验证通过了哦", // 验证成功提示文字

successColor: "red", // 滑块验证成功提示文字颜色

time: 400, // 返回时间

callback: function(result) { // 回调函数，true(成功),false(失败)

$("#result2").text(result);

}

});

$("#reset1").click(function() {

$("#slider1").slider("restore");

});

$("#reset2").click(function() {

$("#slider2").slider("restore");

});

</script>
</html>
