
function checkForm(){
	var IDtip = checkuser_ID();
	var nametip = checkuser_Name();
	var passtip = checkuser_Password();
	return IDtip && nametip && passtip;
}
//验证用户ID
function checkuser_ID(){
	var user_ID = document.getElementById('user_ID');
	var errID = document.getElementById('user_IDErr');
	var pattern = /^\w{3,}$/;
	if(user_ID.value.length == 0){
		errID.innerHTML="用户账号不能为空"
		errID.className="error"
		return false;
	}
	if(!pattern.test(user_ID.value)){
		errID.innerHTML="用户账号不和规范"
		errID.className="error"
		return false;
	}
	else{
		errID.innerHTML="ok"
		errID.className="success";
		return true;
	}
}
function checkuser_Name(){
	var user_Name = document.getElementById('user_Name');
	var errName = document.getElementById('user_NameErr');
	var pattern = /^\w{3,}$/;
	if(user_Name.value.length == 0){
		errName.innerHTML="用户姓名不能为空"
		errName.className="error"
		return false;
	}
	if(!pattern.test(user_Name.value)){
		errName.innerHTML="用户姓名不和规范"
		errName.className="error"
		return false;
	}
	else{
		errName.innerHTML="ok"
		errName.className="success";
		return true;
	}
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
	if(user_Gender.value.length == 0){
		errGender.innerHTML="用户性别不能为空"
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