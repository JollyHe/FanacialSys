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
    <link rel="stylesheet" href="assets/css/nav.css">
</head>
<body>
    <nav id="menu" class="navbar">
        <ul id="nav-list">
          <li class="li-1"><a href="home">主页</a></li>
          <li class="li-2"><a href="finacialCreate">收支创建</a></li>
          <li class="li-3"><a href="#">我的收支</a></li>
          <li class="li-4"><a href="#">数据分析</a></li>
          <li class="li-5"><a href="#">我的计划</a></li>
          <li class="li-6"><a href="#">我的家庭组</a></li>
          <div class="current">
              <div class="top-arrow"></div>   
              <div class="current-back"></div>
              <div class="bottom-arrow"></div>
          </div>
        </ul>
        <form class='navbar-form search-form' action="http://www.17sucai.com/download/25409.html" method="post" id="search">
          <div class='input-group'>
            <input type='search' class='form-control' placeholder='输入你要搜索的收支！'>
            <span class='input-group-btn'>
              <button class='btn btn-default' form="search">go!</button>
            </span>
          </div>
        </form>
        <div id="nav-right">
		   <a href="userSetting" id="user">
		   		<span id="pic" style="background-image: url(assets/img/${user.userPic})"></span>
		   		<span id="name">
		   			${user.userNickname.length() > 4 ? user.userNickname.substring(0,4).concat("..."): user.userNickname} 
		   		</span>
		   	</a>	
  	       <a class="glyphicon glyphicon-log-out" id="log-out" aria-hidden="true" href="logout"></a>
        </div>
    </nav>
 
</body>
</html>