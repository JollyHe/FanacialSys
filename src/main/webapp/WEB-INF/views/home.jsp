<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
  	<link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="assets/css/home.css">
    <link rel="stylesheet" type="text/css" href="assets/css/homeBg.css">
</head>
<body>
       <nav id="menu" class="navbar" style="height:78px">
        <ul id="nav-list">
          <li class="li-1"><a href="home" style="font-size: 14px">主页</a></li>
          <li class="li-2"><a href="finacialCreate" style="font-size: 14px">收支创建</a></li>
          <li class="li-3"><a href="expandShow" style="font-size: 14px">我的收支</a></li>
          <li class="li-4"><a href="#" style="font-size: 14px">数据分析</a></li>
          <li class="li-5"><a href="#" style="font-size: 14px">我的计划</a></li>
          <li class="li-6"><a href="#" style="font-size: 14px">我的家庭组</a></li>
          <div class="current">
              <div class="top-arrow"></div>   
              <div class="current-back"></div>
              <div class="bottom-arrow"></div>
          </div>
        </ul>
        <div id="nav-right" style="padding-top:1px;">
		   <a href="userSetting" id="user">
		   		<span id="pic" style="background-image: url(assets/img/${user.userPic})"></span>
		   		<span id="name" style="font-size: 14px;padding-top: 5px;">
		   			${user.userNickname.length() > 4 ? user.userNickname.substring(0,4).concat("..."): user.userNickname} 
		   		</span>
		   	</a>	
  	       <a class="fa fa-sign-out" id="log-out" aria-hidden="true" href="logout"></a>
        </div>
    </nav>
 <div class="bg bg-box-1"></div>
	<div class="bg bg-box-2"></div>
	<div class="bg bg-box-3"></div>
	<div class="bg bg-box-4"></div>
	<div id="wrap">
		<ul>
			<li>
				<div class="text home3 hide">
					<p>更多精彩</p>
					<ul class="Team">
						<li style="padding-left: 80px;padding-top:160px">敬请期待！</li>
						<li style="padding-left: 80px">我们期待你的加入！！！φ(≧ω≦*)♪</li>
					</ul>
				</div>
			</li>
			<li>
				<div class="text home2 hide">
					<p>关于用户</p>
					<ul class="Team">
						<li style="padding-left: 20px;padding-top:80px" class="th1">适合于所有希望对自己财物有一个统一的、形象的计划的人群</li>
						<li style="padding-left: 20px" class="th1">┗|｀O′|┛ 嗷~~</li>
					</ul>
				</div>
			</li>
			<li>
				<div class="text home1 hide">
					<p>关于产品</p>
					<ul class="Team">
						<li style="padding-left: 80px;padding-top:70px" class="th">这是一款基于web家庭财务管理系统</li>
						<li style="padding-left: 20px;padding-top:32px" class="th">  家庭是一个小小的管理单元，财务的收入与支出是一个零碎而又与切身利益相关的问题</li>
						<li style="padding-left: 20px" class="th">  用户可以随时记录自己的收入、支出等信息，另外为了保护自己的隐私，还可以设置密码。</li>
						<li style="padding-left: 20px" class="th">  我们产品可以有效地帮助合理规划和支配资金，可以通过分析来获得家庭成员在一段时期内的消费和收入信息，是家庭理财的好帮手</li>
					</ul>
				</div>
			</li>
			<li class="curr">
				<div class="text home">
					<p>关于团队</p>
					<!-- <p>团队组成:</p><br/> -->
					<ul class="Team">
						<li style="padding-left: 40px;padding-top:80px">成员：彭璨麒  电子科技大学信软学院</li>
						<li style="padding-left: 130px">唐浩 电子科技大学信软学院</li>
						<li style="padding-left: 130px">江洋 电子科技大学信软学院</li>
						<li style="padding-left: 130px">陈振宁 电子科技大学信软学院</li>
						<li style="padding-left: 130px">何佳霓 电子科技大学信软学院</li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
	
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	(function(){
		$('#wrap > ul > li').mouseover(function(){
			if(!$(this).hasClass('curr')){
				$('#wrap > ul > li').removeClass('curr');
				$(this).addClass('curr');

				// 切换背景
				$('#wrap > ul > li').each(function(index){
					if($(this).hasClass('curr')){
						$('.bg').fadeOut(300);
						$('.bg:eq(' + index + ')').fadeIn(500);
					}
				});

				$('.curr').stop().animate({
					width: 700
				}, 500, 'linear');
				$('#wrap > ul > li').not('.curr').stop().animate({
					width: 100
				}, 500, 'linear');
			}
		$('#wrap > ul > li > div.home1').mouseover(function() {
			if($(this).hasClass('hide')){
				$('#wrap > ul > li > div.home1').removeClass('hide');
				$('#wrap > ul > li > div.home2').addClass('hide');
				$('#wrap > ul > li > div.home3').addClass('hide');
			}
		});
		$('#wrap > ul > li > div.home2').mouseover(function() {
			if($(this).hasClass('hide')){
				$('#wrap > ul > li > div.home1').addClass('hide');
				$('#wrap > ul > li > div.home2').removeClass('hide');
				$('#wrap > ul > li > div.home3').addClass('hide');
			}
		});
		$('#wrap > ul > li > div.home3').mouseover(function() {
			if($(this).hasClass('hide')){
				$('#wrap > ul > li > div.home1').addClass('hide');
				$('#wrap > ul > li > div.home2').addClass('hide');
				$('#wrap > ul > li > div.home3').removeClass('hide');
			}
		});
		$('#wrap > ul > li > div.home').mouseover(function() {
				$('#wrap > ul > li > div.home1').addClass('hide');
				$('#wrap > ul > li > div.home2').addClass('hide');
				$('#wrap > ul > li > div.home3').addClass('hide');
		});
		});
	})()
	</script>
	
</body>
</html>