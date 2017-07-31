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
    <link rel="stylesheet" href="assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="assets/css/finacialShow.css">
 
</head>
<body>
	 <nav id="menu" class="navbar">
        <ul id="nav-list">
          <li class="li-1"><a href="home">主页</a></li>
          <li class="li-2"><a href="finacialCreate">收支创建</a></li>
          <li class="li-3"><a href="expandShow">我的收支</a></li>
          <li class="li-4"><a href="#">数据分析</a></li>
          <li class="li-5"><a href="#">我的计划</a></li>
          <li class="li-6"><a href="#">我的家庭组</a></li>
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
	<div class="row bordered font">

    </div>
   	<div class="row">
   		<div class="col-md-4 bordered">
        <div class="set_container col-md-10 col-md-offset-1 bordered"> 
          <div class="set_9_btn-corner" id="expandShow"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 支出显示 
          </div>
          <div style="clear:both"></div>
           <div class="set_9_btn-corner" id="incomeShow"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 收入显示
          </div>
          <div style="clear:both"></div>
          <div class="set_9_btn-corner"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 支出组显示
          </div>
          <div style="clear:both"></div>
          <div class="set_9_btn-corner"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 收入组显示
          </div>
          <div style="clear:both"></div>
        </div>
      </div>

   		<div class="col-md-8 bordered">
          <div class="col-md-12 bordered">
              <table class="table  table-bordered table-hover">
				<thead>
					<tr>
						<th>收入金额</th>
						<th>收入时间</th>
						<th>收入地点</th>
						<th>收入类型</th>
						<th>所属组</th>
						<th>收入描述</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>			
					<c:if test="${page.list.size() lt 10}">
						<c:forEach items="${page.list}" var="income">
							<tr>
								<td title="${ income.inMoney}">${ income.inMoney}</td>
								<td title="${ income.inTime }">${ income.inTime }</td>
								<td title="${ income.inPlace }" class="address"><p class="address">${ income.inPlace }</p></td>
								<td title="${ income.log.logName }">${ income.log.logName }</td>
								<td title="${ income.incomegroup.incomegroupBrief}" class="group">
									<p class="group">${ income.incomegroup.incomegroupBrief}</p>
								</td>
								<td title="${ income.inMessage }" class="message"><p class="message">${income.inMessage}</p></td>
								<td>
									<a href="/account/${param.p }/${a.aid }">编辑</a>
									<a href="incomeShow/removeIncome/${page.current}/${income.inID}">删除</a>
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
								<td></td>
								<td></td>
							</tr>   
						</c:forEach>
					</c:if>
						<c:if test="${page.list.size() eq 10}">
						<c:forEach items="${page.list}" var="income">
							<tr>
								<td title="${ income.inMoney}">${ income.inMoney}</td>
								<td title="${ income.inTime }">${ income.inTime }</td>
								<td title="${ income.inPlace }" class="address"><p class="address">${ income.inPlace }</p></td>
								<td title="${ income.log.logName }">${ income.log.logName }</td>
								<td title="${ income.incomegroup.incomegroupBrief}" class="group">
									<p class="group">${ income.incomegroup.incomegroupBrief}</p>
								</td>
								<td title="${ income.inMessage }" class="message"><p class="message">${income.inMessage}</p></td>
								<td>
									<a href="/account/${param.p }/${a.aid }">编辑</a>
									<a href="incomeShow/removeIncome/${page.current}/${income.inID}">删除</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					
				</tbody>
			</table>
			  <div id="page-select" class="row">
	               <ul class="pagination" class="col-md-8" >
	               		<li ><a href="incomeShow?current=1" >首页</a></li>
	               		<li ><a href="incomeShow?current=${page.current-1 > 0 ?page.current-1:1}">&laquo;</a></li>
						<c:if test="${page.total lt 9}">
							<c:forEach  begin="1" end="${page.total}" var="j">
								<c:if test="${page.current eq j}">
									<li><a href="incomeShow?current=${page.current}" class="now">${j}</a></li>
								</c:if>
								<c:if test="${page.current ne j}">
									<li><a href="incomeShow?current=${j}">${j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(page.total eq 9) && (page.total-page.current gt 4)}">
							<c:forEach  begin="-4" end="4" var="j">
								<c:if test="${page.current eq (page.current+j)}">
									<li><a href="incomeShow?current=${page.current+j}" class="now">${page.current+j}</a></li>
								</c:if>
								<c:if test="${page.current ne (page.current+j)}">
									<li><a href="incomeShow?current=${page.current+j}">${page.current+j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(page.total eq 9) && (page.total-page.current lt 4)}">
							<c:forEach  begin="-8" end="${page.total}" var="j">
								<c:if test="${page.current eq (page.total+j)}">
									<li><a href="incomeShow?current=${page.total+j}" class="now">${page.total+j}</a></li>
								</c:if>
								<c:if test="${page.current ne (page.total+j)}">
									<li><a href="incomeShow?current=${page.total+j}">${page.total+j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<li><a href="incomeShow?current=${page.current+1>page.total?page.total:page.current+1}">&raquo;</a></li>
						<li id="li"><a href="incomeShow?current=${page.total}">尾页</a></li>
	               </ul>
	               <form class="col-md-3">
	               		<div class="input-group">
	               			<span class="input-group-addon">${page.current }/${page.total }</span>
							<input type="text" id="toPageIpt" class="form-control">
							<span class="input-group-btn"><button id="toPage"  class="btn btn-default">跳转</button></span>
						</div>
	               </form>
               </div>
          </div>
   		</div>
   	</div>
    <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/finacialShow.js"></script>
	<script type="text/javascript">
		$("#toPage").click(function(){
			var page = $("#toPageIpt").val();
			alert(page);
			if(page >=1 || page <= '${page.total}'){
				location.href = "incomeShow?current="+page;
			}
		});
	</script>
</body>
</html>