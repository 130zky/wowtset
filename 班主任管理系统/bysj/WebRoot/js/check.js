	<SCRIPT language="javascript">
	function check(form){
	if(form.username.value==""){
        alert("�����������û���");
        form.username.focus();
        return false;
    	}
	if(form.username.value.length<5 || form.username.value.length>20){
		alert("�û�������С��5λ�����20λ");
		 form.username.focus();
		return false;
	}
	if(form.username.value.search(/^[a-z0-9][\w]{2,19}$/i) == -1){
		alert("�û�����ʽ����ȷ������ʹ�����Ļ�Ƿ��ַ�");
 		form.username.focus();
		return false;
	}
	if(form.password.value=="")
	{
	alert("��������������");
	form.password.focus();
	return false;
	}
	if(form.password.value.length<6 || form.password.value.length>20){
		alert("���벻��С��6λ�����20λ");
		 form.password.focus();
		return false;
	}
	return true;
	}

</SCRIPT>