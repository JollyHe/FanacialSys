<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>login</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="assets/css/login.css">
	<link href="assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
</head>
<body >
    <div id="Layer1">  
    </div>  
    
    <div class="login  text-center">
        <div id="div1">
            <img src="assets/img/logo-1.png" width="50%" height="50%">
            <form action="login" method="post" id="login-form"> 
                <div class="login-ic login-ic-1">
                    <i></i>
                    <input name="username" type="text"  placeholder="请输入账号"  />
                   	<c:if test="${msg.equals('用户名不存在')}">
                    	<div class="test_triangle_border" id="pop1">
	                        <div class="popup">
	                            <span><em></em></span><strong>${msg}</strong>
	                        </div>
                    	</div>
					</c:if>
					<c:if test="${msg == null}">
                    	<div class="test_triangle_border hidden" id="pop1">
	                        <div class="popup">
	                            <span><em></em></span><strong></strong>
	                        </div>
                    	</div>
					</c:if>
                </div>
                <div class="login-ic">
                    <i class="icon"></i>
                    <input name="password" type="password" placeholder="请输入密码"/> 
                  	<c:if test="${msg.equals('密码错误')}">
                    	<div class="test_triangle_border" id="pop2">
	                        <div class="popup">
	                            <span><em></em></span><strong>${msg}</strong>
	                        </div>
                    	</div>
					</c:if>
					<c:if test="${msg == null}">
                    	<div class="test_triangle_border hidden" id="pop2">
	                        <div class="popup">
	                            <span><em></em></span><strong></strong>
	                        </div>
                    	</div>
					</c:if>
                </div>
                <div class="login-btn">
                    <input type="submit"  value="登录" >
                </div>
            </form>
            <div id="other-login">
                <span></span>
                <span style="color: white">其他登录方式</span>
                <span></span>
            </div>
            <div id="other">
                <a href="">
                    <img src="assets/img/qq.png" alt="qq"   width="100%" />
                </a>
                <a href="">
                    <img src="assets/img/wx.png" alt="wx"  width="100%" />
                </a>
                <a href="">
                    <img src="assets/img/wb.png" alt="wb"  width="100%" />
                </a>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/login.js"></script>
</html>