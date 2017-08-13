<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的家庭组</title>
	<link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nav.css">
	<link rel="stylesheet" type="text/css" href="assets/css/userGroup.css"/>
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

<div id="top">
	<h2>家庭组</h2>
	<div id="topTags">
		<ul style="display:none;">
		</ul>
	</div>
</div>

<div id="main">

	<div id="leftMenu">
		<ul>
			<li>我的家庭组</li>
			<li>创建家庭组</li>
			<li>更新家庭组</li>
			<c:if test="${user.level.levelID eq 2 }">
				<li>删除家庭组</li>
			</c:if>
			<c:if test="${user.level.levelID eq 3 }">
				<li>退出家庭组</li>
			</c:if>
		</ul>
	</div>

<div id="content">
<div id="welcome" class="content" style="display:block;">
  <div align="center">
    <p> </p>
    <p><strong>欢迎使用用户家庭管理系统！</strong></p>
    <p> </p>
    </div>
</div>
<div id="c0" class="content">
<c:if test="${not empty user.userGroup and user.level.levelID eq 2}">
    <div class="menu-x">
        <div class="menu-5">
	         <form action="" id="addMember" method="get">
		        <input required='' type='text' name="userID">
		        <label alt='输入成员ID并邀请' placeholder='输入成员ID并邀请'></label>
	        </form>
	        <button type="button" id="" form="addMember" class="btn1" onclick="ajax_test()">邀请</button>
        </div>
    </div>
	<table class="z_i">
        	<tr >
            	<td width="20%">成员账号</td>
                <td width="20%">成员姓名</td>
                <td width="20%">成员昵称</td>
                <td width="20%">操作</td>
                <td width="20%">查看</td>
            </tr>
            <c:forEach items="${user.userGroup.users}" var="item">
            	<c:if test="${user.userID ne item.userID}">
	            	<tr id="${item.userID}">
		            	<td width="20%">${item.userID}</td>
		                <td width="20%">${item.userName}</td>
		                <td width="20%">${item.userNickname}</td>
		                <td width="20%"><a  onclick="ajax_test2(${item.userID})" href="javascript:void(0);">删除</a></td>
		                <td width="20%"><a href="showMemberExpand?current=1&memberID=${item.userID}" >查看</a></td>
	            	</tr>
            	</c:if>
            </c:forEach>
            
        </table>
 </c:if>
 <c:if test="${not empty user.userGroup and user.level.levelID eq 3}">
	<table class="z_i">
        	<tr >
            	<td width="20%">成员账号</td>
                <td width="20%">成员姓名</td>
                <td width="20%">成员昵称</td>
            </tr>
            <c:forEach items="${user.userGroup.users}" var="item">
            	<c:if test="${user.userID ne item.userID}">
	            	<tr >
		            	<td width="20%">${item.userID}</td>
		                <td width="20%">${item.userName}</td>
		                <td width="20%">${item.userNickname}</td>
	            	</tr>
            	</c:if>
            </c:forEach>
        </table>
 </c:if>
 <c:if test="${empty user.userGroup}">
 	您还没有创建家庭组
 </c:if>
</div>

<div id="c1" class="content">
 <c:if test="${empty user.userGroup}">
	<div class="menu-x">
        <div class="menu-1">
	       <form action="createUserGroup" method="post" id="createUserGroup">
		        <input required='' type='text' name="groupName">
		        <label alt='家庭组名称' placeholder='家庭组名称'></label>
		        <input required='' type='text' name="groupMsg">
		        <label alt='家庭组信息' placeholder='家庭组信息'></label>
	        </form>
	        <button id="submit" type="submit" form="createUserGroup" class="btn1">创建</button>
        </div>
    </div>
 </c:if>
 <c:if test="${not empty user.userGroup}">
 	您已经有了一个家庭组
 </c:if>
</div>
<div id="c2" class="content">
	 <c:if test="${not empty user.userGroup}">
	 	<c:if test="${user.level.levelID eq 2 }">
		 	<div class="menu-x">
		        <div class="menu-1">
			        <form action="editUserGroup" method="post" id="editUserGroup">
				        <input required='' type='text' name="groupName" value=${user.userGroup.groupName}>
				        <label alt='家庭组名称' placeholder='家庭组名称'></label>
				        <input required='' type='text' name="groupMsg" value=${user.userGroup.groupMsg}>
				        <label alt='家庭组信息' placeholder='家庭组信息'></label>
			        </form>
			        <button id="submit" type="submit" form="editUserGroup" class="btn1">更 新</button>
		        </div>
		    </div>
	    </c:if>
	    <c:if test="${user.level.levelID eq 3}">
	    	你没有管理员权限，无法进行更新操作！
	    </c:if>
	 </c:if>
	  <c:if test="${empty user.userGroup}">
	 	您还没有创建家庭组
	 </c:if>
	
</div>
<div id="c3" class="content">
	<c:if test="${not empty user.userGroup}">
		<div style="width:580px;margin:0 auto;">
		<c:if test="${user.level.levelID eq 2}">
			<form id="removeUserGroup" name="form1" method="post" action="removeUserGroup">
				
				<table width="580" border="0" cellpadding="0" cellspacing="0" id="tabProduct">
					<tr>
						<td width="32" align="center" bgcolor="#EFEFEF" Name="Num"></td>
						<td width="120" bgcolor="#EFEFEF" Name="Num" EditType="TextBox">家庭组ID</td>
						<td width="103" bgcolor="#EFEFEF" Name="Amount" EditType="TextBox">家庭组名称</td>
						<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">家庭组人数</td>
						<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">家庭组信息</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" name="groupID" value="${user.userGroup.groupID}" hidden="hidden" checked="checked"/></td>
						<td>${user.userGroup.groupID}</td>
						<td class="td"  title="${user.userGroup.groupName}"><p class="td">${user.userGroup.groupName}</p></td>
						<td id="groupSum">${user.userGroup.groupSum}</td>
						<td class="td" title="${user.userGroup.groupMsg}"><p class="td">${user.userGroup.groupMsg}</p></td>
					</tr>
				</table>
				<br />
					<input type="submit" name="Submit2" value="删除"  />
			</form>
		</c:if>
			<c:if test="${user.level.levelID eq 3}">
			<form id="signOutUserGroup" name="form1" method="post" action="signOutUserGroup">
				
				<table width="580" border="0" cellpadding="0" cellspacing="0" id="tabProduct">
					<tr>
						<td width="32" align="center" bgcolor="#EFEFEF" Name="Num"></td>
						<td width="120" bgcolor="#EFEFEF" Name="Num" EditType="TextBox">家庭组ID</td>
						<td width="103" bgcolor="#EFEFEF" Name="Amount" EditType="TextBox">家庭组名称</td>
						<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">家庭组人数</td>
						<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">家庭组信息</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" name="groupID" value="${user.userGroup.groupID}" hidden="hidden" checked="checked"/></td>
						<td>${user.userGroup.groupID}</td>
						<td class="td"  title="${user.userGroup.groupName}"><p class="td">${user.userGroup.groupName}</p></td>
						<td >${user.userGroup.groupSum}</td>
						<td class="td" title="${user.userGroup.groupMsg}"><p class="td">${user.userGroup.groupMsg}</p></td>
					</tr>
				</table>
				<br />
					<input type="submit" name="Submit2" value="退出"  />
			</form>
		</c:if>
		</div>
		</c:if>
		 <c:if test="${empty user.userGroup}">
 			您还没有创建家庭组
 		</c:if>
</div>
</div>
</div>

  <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="assets/js/userGroup.js"></script>
  <script type="text/javascript">
  	//点击变色
	(function (){
	$('#leftMenu > ul > li').click(function() {
	if(!$(this).hasClass('color')){
		$('#leftMenu > ul > li').removeClass('color');
		$(this).addClass('color');
	}
	});
	})()
	//ajax
	
	function ajax_test(){
		$.get('addMember',{userID:$('#addMember > input').val()},function(users){
			if(users.userID != null){
				
	            var tr = $('<tr/>');
	            tr.attr("id",users.userID);
	            $('<td/>').html( users.userID ).appendTo( tr );
	            $('<td/>').html( users.userName ).appendTo( tr );
	            $('<td/>').html( users.userNickname ).appendTo( tr );
	            $('<td/>').append( $('<a/>').html('删除').attr({onclick:"ajax_test2("+users.userID+")",href:"javascript:void(0);"})).appendTo( tr );
	            $('<td/>').append( $('<a/>').html('查看').attr('href','showMemberExpand?current=1&memberID='+users.userID)).appendTo( tr );
	            $('table.z_i').append(tr);
	            $('#groupSum').html(parseInt($('#groupSum').html())+1);
	        
			} else{
				if(users.userPic === "123")
					alert("不存在该用户!");
				else
					alert("该成员已在一个家庭组中！");
			}
		},'json');
	}
  	function ajax_test2(userID){
  		$.get('removeMember/' + userID,function(Msg){
  			if(Msg === 'ok'){
				$('#'+userID).remove();
				$('#groupSum').html(parseInt($('#groupSum').html())-1);
			}
  		},'text')
  	}
  </script>
</body>
</html>