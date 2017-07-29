function checkForm(){
	var passtip = checkuser_Password();
	var gendertip = checkuser_Gender();
	var nicknametip = checkuser_Nickname();
	var addresstip = checkuser_Address();
	return passtip && gendertip && nicknametip && addresstip;
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
function checkuser_Gender(){
	var user_Gender = document.getElementById('user_Gender');
	var errGender = document.getElementById('user_GenderErr');
	var pattern = /^+$/;//验证是否为中文
	if(user_Gender.value.length == 0){
		errGender.innerHTML="用户密码不能为空"
		errGender.className="error"
		return false;
	}
	if(!pattern.test(user_Gender.value)){
		errGender.innerHTML="用户密码不和规范"
		errGender.className="error"
		return false;
	}
	else{
		errGender.innerHTML="ok"
		errGender.className="success";
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
