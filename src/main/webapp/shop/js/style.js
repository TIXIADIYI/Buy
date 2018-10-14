
//登录操作
function cliLogin() {

	var txtUser = $.trim($("#txtUser").val());
	var txtPwd = $("#Userpwd").val();
	var txtCode = $.trim($('#txtCode').val());
	if ($.trim(txtUser) == "") {
		Tip('请输入账号！');
		$("#txtUser").focus();
		return;
	}
	if ($.trim(txtPwd) == "") {
		Tip('请输入密码！');
		$("#Userpwd").focus();
		return;
	}
	
	return false;
}


function Tip(msg) {
	$(".tishi").show().text(msg);
}
