  
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

           	
           	
           