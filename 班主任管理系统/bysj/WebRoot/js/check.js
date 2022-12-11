	<SCRIPT language="javascript">
	function check(form){
	if(form.username.value==""){
        alert("请输入您的用户名");
        form.username.focus();
        return false;
    	}
	if(form.username.value.length<5 || form.username.value.length>20){
		alert("用户名不能小于5位或大于20位");
		 form.username.focus();
		return false;
	}
	if(form.username.value.search(/^[a-z0-9][\w]{2,19}$/i) == -1){
		alert("用户名格式不正确，不能使用中文或非法字符");
 		form.username.focus();
		return false;
	}
	if(form.password.value=="")
	{
	alert("请输入您的密码");
	form.password.focus();
	return false;
	}
	if(form.password.value.length<6 || form.password.value.length>20){
		alert("密码不能小于6位或大于20位");
		 form.password.focus();
		return false;
	}
	return true;
	}

</SCRIPT>