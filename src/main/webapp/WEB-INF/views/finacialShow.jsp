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
    <link rel="stylesheet" type="text/css" href=".assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nav.css">
    <link href="assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
    <link rel="stylesheet" type="text/css" href="assets/css/finacialShow.css">
 
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
	<div class="row bordered font">

    </div>
   	<div class="row">
   		<div class="col-md-4 bordered">
        <div class="set_container col-md-10 col-md-offset-1 bordered"> 
          <div class="set_9_btn-corner" id="showExpand"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 收入显示 
          </div>
          <div style="clear:both"></div>
           <div class="set_9_btn-corner" id="showIncome"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 支出显示
          </div>
          <div style="clear:both"></div>
          <div class="set_9_btn-corner" id="incomeGroupShow"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 收入组显示
          </div>
          <div style="clear:both"></div>
          <div class="set_9_btn-corner" id="expandGroupShow"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 支出组显示
          </div>
          <div style="clear:both"></div>
        </div>
      </div>

   		<div class="col-md-8 bordered">
          <div class="col-md-12 bordered">
              <table class="table  table-bordered table-hover">
				<thead>
					<tr>
						<th>用户ID</th>
						<th>邮箱</th>
						<th>昵称</th>
						<th>头像</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>			
					<c:if test="${page.list.size() lt 10}">
						<c:forEach items="${page.list}" var="expand">
							<tr>
								<td>${ expand.outMoney}</td>
								<td>${ expand.outTime }</td>
								<td>${ expand.outPlace }</td>
								<td>${ expand.outMessage }</td>
								<td>
									<a href="/account/${param.p }/${a.aid }">编辑</a>
									<a href="finacialShow/removeExpand/${page.current}/${expand.outID}">删除</a>
								</td>
							</tr>
						</c:forEach>
					
						
						<c:forEach  begin="1" end="${10-page.list.size()}">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>   
						</c:forEach>
					</c:if>
						<c:if test="${page.list.size() eq 10}">
						<c:forEach items="${page.list}" var="expand">
							<tr>
								<td>${ expand.outMoney}</td>
								<td>${ expand.outTime }</td>
								<td>${ expand.outPlace }</td>
								<td>${ expand.outMessage }</td>
								<td>
									<a href="/account/${param.p }/${a.aid }">编辑</a>
									<a href="finacialShow/removeExpand/${page.current}/${expand.outID}">删除</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					
				</tbody>
			</table>
			  <div id="page-select" class="row">
	               <ul class="pagination" class="col-md-8" >
	               		<li ><a href="" >首页</a></li>
	               		<li ><a href="">&laquo;</a></li>
						<c:if test="${page.total lt 9}">
							<c:forEach  begin="1" end="${page.total}" var="j">
								<c:if test="${page.current eq j}">
									<li><a href="finacialShow?current=${page.current}" class="now">${j}</a></li>
								</c:if>
								<c:if test="${page.current ne j}">
									<li><a href="finacialShow?current=${j}">${j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(page.total eq 9) && (page.total-page.current gt 4)}">
							<c:forEach  begin="-4" end="4" var="j">
								<c:if test="${page.current eq (page.current+j)}">
									<li><a href="" class="now">${page.current+j}</a></li>
								</c:if>
								<c:if test="${page.current ne (page.current+j)}">
									<li><a href="">${page.current+j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(page.total eq 9) && (page.total-page.current lt 4)}">
							<c:forEach  begin="-8" end="${page.total}" var="j">
								<c:if test="${page.current eq (page.total+j)}">
									<li><a href="" class="now">${page.total+j}</a></li>
								</c:if>
								<c:if test="${page.current ne (page.total+j)}">
									<li><a href="">${page.total+j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<li><a href="">&raquo;</a></li>
						<li id="li"><a href="">尾页</a></li>
	               </ul>
	               <form id="toPage" class="col-md-3">
	               		<div class="input-group">
	               			<span class="input-group-addon">${page.current }/${page.total }</span>
							<input type="text" name="toPage" class="form-control">
							<span class="input-group-btn"><button type="submit" form="toPage" class="btn btn-default">跳转</button></span>
						</div>
	               </form>
               </div>
          </div>
   		</div>
   	</div>
    <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/finacialShow.js"></script>
</body>
</html>