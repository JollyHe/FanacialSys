<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
  	<link rel="stylesheet" href="assets/css/reset.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/nav.css">
    <link href="assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
    <link rel="stylesheet" type="text/css" href="assets/css/finacialCreate.css">
</head>
<body>
        <nav id="menu" class="navbar">
        <ul id="nav-list">
          <li class="li-1"><a href="home">主页</a></li>
          <li class="li-2"><a href="finacialCreate">收支创建</a></li>
          <li class="li-3"><a href="expandShow">我的收支</a></li>
          <li class="li-4"><a href="data">数据分析</a></li>
          <li class="li-5"><a href="plan">我的计划</a></li>
          <li class="li-6"><a href="userGroup">我的家庭组</a></li>
          <div class="current">
              <div class="top-arrow"></div>   
              <div class="current-back"></div>
              <div class="bottom-arrow"></div>
          </div>
        </ul>
        <div id="nav-right">
		   <a href="userSetting" id="user">
		   		<span id="pic" style="background-image: url(assets/img/${user.userPic})"></span>
		   		<span id="name">
		   			${user.userNickname.length() > 4 ? user.userNickname.substring(0,4).concat("..."): user.userNickname} 
		   		</span>
		   	</a>	
  	       <a class="fa fa-sign-out" id="log-out" aria-hidden="true" href="logout"></a>
        </div>
    </nav>
    <div class="row">
		<div class="col-md-6 col-md-offset-3" id="grid"> 
			<div class="row ">
				<div class="cell col-md-4"></div>
				<div class="cell col-md-4" id="top">
					<a href="createIncome">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
						<br>
						<span>创建收入</span>
					</a>
				</div>
				<div class="cell col-md-4"></div>
			</div>
			<div class="row ">
				<div class="cell col-md-4" id="left">
					<a href="createIncomeGroup">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
						<br>
						<span>创建收入组</span>
					</a>
				</div>
				<div class="cell col-md-4" id="center">
					<div id="divImg">
				
					</div>
				</div>
				<div class="cell col-md-4" id="right">
					<a href="createExpandGroup">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
						<br>
						<span>创建支出组</span>
					</a>
				</div>
			</div>
			<div class="row ">
				<div class="cell col-md-4"></div>
				<div class="cell col-md-4" id="bottom">
					<a href="createExpand">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
						<br>
						<span>创建支出</span>
					</a>
				</div>
				<div class="cell col-md-4"></div>
			</div>
		</div>
    </div>
 
</body>
</html>