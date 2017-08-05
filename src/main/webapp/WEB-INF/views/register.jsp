<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户注册</title>
	<link rel="stylesheet" type="text/css" href="assets/css/register.css"/>
	<link href="assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
	
</head>
<body>
<div class="divAll">
    <div id="titles">新用户注册</div>
    <div id="contents">
    <h3 class="xinxi">基本信息</h3>
    <hr width=95% color="#f2f2f2"/>
    <form action="register" id="register" onSubmit="return checkForm()" method="post">
    <div id="form-itemGroup">
        <label for="user_ID">用户账号</label>
        <input type="text" name="userID" id="user_ID" class="user_ID" onBlur="checkuser_ID()" oninput="checkuser_ID()">
        <span class="default" id="user_IDErr">请输入至少3位的用户名</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Name">用户姓名</label>
        <input type="text" name="userName" id="user_Name" class="user_ID" onBlur="checkuser_Name()" oninput="checkuser_Name()">
        <span class="default" id="user_NameErr">请输入至少2位的用户姓名</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Password">用户密码</label>
        <input type="password" name="userPassword" id="user_Password" class="user_ID" onBlur="checkuser_Password()" oninput="checkuser_Password()">
        <span class="default" id="user_PasswordErr">请输入4到8位的用户密码</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Password">确认密码</label>
        <input type="password" id="user_ConfirmPassword" class="user_ID" onBlur="ConfirmPassword()" oninput="ConfirmPassword()">
        <span class="default" id="conPasswordErr">请再输一次密码</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Nickname">用户昵称</label>
        <input type="text" name="userNickname" id="user_Nickname" class="user_ID" onBlur="checkuser_Nickname()" oninput="checkuser_Nickname()">
        <span class="default" id="user_NicknameErr">请输入用户昵称</span>
    </div>
    <div id="form-itemGroup">
    	<label for="user_Address">用户地址</label>
        <input type="text" name="userAddress" id="user_Address" class="user_ID" onBlur="checkuser_Address()" oninput="checkuser_Address()">
        <span class="default" id="user_AddressErr"></span>
    </div>
    <div id="form-itemGroup">
        <label for="user_Gender">用户性别</label>
        <input type="radio" value="1" name="userGender" checked="checked" />男
        <input type="radio" value="2" name="userGender"/>女
    </div>
    <div>
    	<button id="myb" form="register" type="submit" disabled="disabled" class="divBtn" onmouseover="date()">注册</button>
    </div>
    </form>


    	
    </div>
	
</div>
<script type="text/javascript" src="assets/js/register.js"></script>
</body>
</html>