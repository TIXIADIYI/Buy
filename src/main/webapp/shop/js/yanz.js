//表单验证
       function checkPhone(){
   var phone = document.getElementById('uid').value;
   if(!(/^1[34578]\d{9}$/.test(phone))){
     return document.getElementById('uidt').innerHTML = "<font color='red'>请输入正确的手机号!</font>"
     return false;
   }    else{return document.getElementById('uidt').innerHTML = "<font color='green'>手机号格式正确!</font>";}
 }

       	
		  function checkpwd (pwd){
    var infpwd=$("pwd_i"),
        val = pwd.value;
 
    if(!val){
        infpwd.innerHTML="<font color='red'>请输入密码!</font>"
        return false;
    }
 
    if(val.length<6){
        infpwd.innerHTML="<font color='red'>请输入不少于6位的密码!</font>"
        return false;
    }
 
    infpwd.innerHTML="<font color='green'>密码格式正确!</font>"
       return true;
}
 
function checkrpwd(pwd,rpwd){
    var infrepwd=$("repeatpsw_i"),
        pwd = $('pwd'),
        rpwd = $('repeatpsw'),
        val = rpwd.value;
 
    if(!val){
        infrepwd.innerHTML="<font color='red'>请输入确认密码!</font>"
        return false;
    }
 
    if(pwd.value !== val){
        infrepwd.innerHTML="<font color='red'>两次密码不相同!</font>"
        return false;
    }
 
    infrepwd.innerHTML="<font color='green'>请牢记你输入的密码!</font>";
    return true;
}
 
function $(id){
    return document.getElementById(id);
}
			

		
		

	
	
	
           