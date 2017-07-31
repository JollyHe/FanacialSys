function checkForm(){
	var IDtip = checkuser_ID();
	var nametip = checkuser_Name();
	var passtip = checkuser_Password();
	return IDtip && nametip && passtip;
}


function checkuser_Password(){
	var user_Password = document.getElementById('user_Password');
	var errPassword = document.getElementById('user_PasswordErr');
	var pattern = /^\w{4,8}$/;
	if(user_Password.value.length == 0){
		errPassword.innerHTML="用户密码不能为空"
		errPassword.className="error"
		return false;
	}
	if(!pattern.test(user_Password.value)){
		errPassword.innerHTML="用户密码不和规范"
		errPassword.className="error"
		return false;
	}
	else{
		errPassword.innerHTML="ok"
		errPassword.className="success";
		return true;
	}
}
function ConfirmPassword(){
	var user_Password = document.getElementById('user_Password');
	var user_ConfirmPassword = document.getElementById('user_ConfirmPassword');
	var errconPassword = document.getElementById('conPasswordErr');
	if((user_Password.value)!=(user_ConfirmPassword.value)||user_ConfirmPassword.value.length == 0){
		errconPassword.innerHTML="上下密码不一致"
		errconPassword.className="error"
		return false;
	}
	else{
		errconPassword.innerHTML="ok"
		errconPassword.className="success";
		return true;
	}
}

function checkuser_Nickname(){
	var user_Nickname = document.getElementById('user_Nickname');
	var errNickname = document.getElementById('user_NicknameErr');
	if(user_Nickname.value.length == 0){
		errNickname.innerHTML="用户昵称不能为空"
		errNickname.className="error"
		return false;
	}
	else{
		errNickname.innerHTML="ok"
		errNickname.className="success";
		return true;
	}
}