<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户注册</title>
	<link rel="stylesheet" type="text/css" href="assets/css/register.css"/>

</head>
<body>
<div class="divAll">
    <div id="titles">新用户注册</div>
    <div id="contents">
    <h3 class="xinxi">基本信息</h3>
    <hr width=95% color="#f2f2f2"/>
    <form action="register" onSubmit="return checkForm()" method="post">
    <div id="form-itemGroup">
        <label for="user_ID">用户账号</label>
        <input type="text" id="user_ID" name="userID" class="user_ID" onBlur="checkuser_ID()" oninput="checkuser_ID()">
        <span class="default" id="user_IDErr">请输入至少6位的用户名</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Name">用户姓名</label>
        <input type="text" id="user_Name" name="userName" class="user_ID" onBlur="checkuser_Name()" oninput="checkuser_Name()">
        <span class="default" id="user_NameErr">请输入至少6位的用户姓名</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Password">用户密码</label>
        <input type="password" id="user_Password" name="userPassword" class="user_ID" onBlur="checkuser_Password()" oninput="checkuser_Password()">
        <span class="default" id="user_PasswordErr">请输入至少6位的用户密码</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Password">确认密码</label>
        <input type="password" id="user_ConfirmPassword" class="user_ID" onBlur="ConfirmPassword()" oninput="ConfirmPassword()">
        <span class="default" id="conPasswordErr">请再输一次密码</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Gender">用户性别</label>
        <input type="text" id="user_Gender" name="userGender" class="user_ID" onBlur="checkuser_Gender()" oninput="checkuser_Gender()">
        <span class="default" id="user_GenderErr">性别</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Nickname">用户昵称</label>
        <input type="text" id="user_Nickname" name="userNickname" class="user_ID" onBlur="checkuser_Nickname()" oninput="checkuser_Nickname()">
        <span class="default" id="user_NicknameErr">请输入用户昵称</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Address">用户地址</label>
        <input type="text" id="user_Address" name="userAddress" class="user_ID" onBlur="checkuser_Address()" oninput="checkuser_Address()">
        <span class="default" id="user_AddressErr">请输入用户地址</span>
    </div>
    <div>
    	<button type="submit" class="divBtn">注册</button>
    </div>
    </form>

    </div>
	
</div>
<script type="text/javascript" src="assets/js/register.js"></script>
</body>
</html>