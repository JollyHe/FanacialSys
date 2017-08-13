<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>成员支出组显示</title>
  	<link rel="stylesheet" href="assets/css/reset.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="assets/css/finacialShow.css">
    <link rel="stylesheet" type="text/css" href="assets/css/showMember.css">
    <link href="assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
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
	<div class="row bordered font">

    </div>
   	<div class="row">
   		<div class="col-md-4 bordered">
        <div class="set_container col-md-10 col-md-offset-1 bordered"> 
          <a class="set_9_btn-corner" href="showMemberExpand?current=1&memberID=${memberID}"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 支出显示 
          </a>
          <div style="clear:both"></div>
           <a class="set_9_btn-corner" href="showMemberIncome?current=1&memberID=${memberID}"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 收入显示
          </a>
          <div style="clear:both"></div>
          <a class="set_9_btn-corner" href="showMemberExpandGroup?current=1&memberID=${memberID}"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 支出组显示
          </a>
          <div style="clear:both"></div>
          <a class="set_9_btn-corner" href="showMemberIncomeGroup?current=1&memberID=${memberID}"> 
            <span class="line1"></span> <span class="line2"></span> <span class="line3"></span> <span class="line4"></span> 收入组显示
          </a>
          <div style="clear:both"></div>
        </div>
      </div>

   		<div class="col-md-8 bordered">
          <div class="col-md-12 bordered">
              <table class="table  table-bordered table-hover">
				<thead>
					<tr>
						<th>支出组创建时间</th>
						<th>支出组简介</th>
						<th>支出组详细信息</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>			
					<c:if test="${page.list.size() lt 10}">
						<c:forEach items="${page.list}" var="expandGroup">
							<tr>
								<td title="${ expandGroup.outgroupTime}">${ expandGroup.outgroupTime}</td>
								<td title="${ expandGroup.outgroupBrief }">${ expandGroup.outgroupBrief }</td>
								<td title="${ expandGroup.outgroupMsg }" class="message">
									<p class="message">${ expandGroup.outgroupMsg }</p>
								</td>
								<td>
									<a href="showMemberExpandGroupDetails?groupID=${expandGroup.outgroupID}&memberID=${memberID}">查看详情</a>
								</td>
							</tr>
						</c:forEach>
					
						
						<c:forEach  begin="1" end="${10-page.list.size()}">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>   
						</c:forEach>
					</c:if>
						<c:if test="${page.list.size() eq 10}">
						<c:forEach items="${page.list}" var="expandGroup">
							<tr>
								<td title="${ expandGroup.outgroupTime}">${ expandGroup.outgroupTime}</td>
								<td title="${ expandGroup.outgroupBrief }">${ expandGroup.outgroupBrief }</td>
								<td title="${ expandGroup.outgroupMsg }" class="message"><p class="message">${ expandGroup.outgroupMsg }</p></td>
								<td>
									<a href="showMemberExpandGroupDetails?groupID=${expandGroup.outgroupID}&memberID=${memberID}">查看详情</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					
				</tbody>
			</table>
			  <div id="page-select" class="row">
	               <ul class="pagination" class="col-md-8" >
	               		<li ><a href="showMemberExpandGroup?current=1&memberID=${memberID}" >首页</a></li>
	               		<li ><a href="showMemberExpandGroup?current=${page.current-1 > 0 ?page.current-1:1}&memberID=${memberID}">&laquo;</a></li>
						<c:if test="${page.total lt 9}">
							<c:forEach  begin="1" end="${page.total}" var="j">
								<c:if test="${page.current eq j}">
									<li><a href="showMemberExpandGroup?current=${page.current}&memberID=${memberID}" class="now">${j}</a></li>
								</c:if>
								<c:if test="${page.current ne j}">
									<li><a href="showMemberExpandGroup?current=${j}&memberID=${memberID}">${j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(page.total eq 9) && (page.total-page.current gt 4)}">
							<c:forEach  begin="-4" end="4" var="j">
								<c:if test="${page.current eq (page.current+j)}">
									<li><a href="showMemberExpandGroup?current=${page.current+j}&memberID=${memberID}" class="now">${page.current+j}</a></li>
								</c:if>
								<c:if test="${page.current ne (page.current+j)}">
									<li><a href="showMemberExpandGroup?current=${page.current+j}&memberID=${memberID}">${page.current+j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(page.total eq 9) && (page.total-page.current lt 4)}">
							<c:forEach  begin="-8" end="${page.total}" var="j">
								<c:if test="${page.current eq (page.total+j)}">
									<li><a href="showMemberExpandGroup?current=${page.total+j}&memberID=${memberID}" class="now">${page.total+j}</a></li>
								</c:if>
								<c:if test="${page.current ne (page.total+j)}">
									<li><a href="showMemberExpandGroup?current=${page.total+j}&memberID=${memberID}">${page.total+j}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
						<li><a href="showMemberExpandGroup?current=${page.current+1>page.total?page.total:page.current+1}&memberID=${memberID}">&raquo;</a></li>
						<li id="li"><a href="showMemberExpandGroup?current=${page.total}&memberID=${memberID}">尾页</a></li>
	               </ul>
	               <form  class="col-md-3">
	               		<div class="input-group">
	               			<span class="input-group-addon">${page.current }/${page.total }</span>
							<input type="text" id="toPageIpt" class="form-control">
							<span class="input-group-btn"><a id="jump" class="btn btn-default">跳转</a></span>
						</div>
	               </form>
               </div>
          </div>
   		</div>
   	</div>
    <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$("#toPageIpt").change(function(){
		var pageNum = $("#toPageIpt").val();
		pageNum = parseInt(pageNum);
		if(pageNum >=1 && pageNum <=${page.total}){
			$('#jump').attr("href","showMemberExpandGroup?current="+pageNum+"&memberID="+${memberID});
		}
	});
	</script>
</body>
</html>