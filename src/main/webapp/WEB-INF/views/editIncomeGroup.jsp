<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>支出组的创建</title>
    <link rel="stylesheet" href="/FinacialSys/assets/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/createGroup.css">
    <link href="/FinacialSys/assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/editEAI.css">
    
</head>
<body>
 <nav id="menu" class="navbar">
        <ul id="nav-list">
          <li class="li-1"><a href="/FinacialSys/home">主页</a></li>
          <li class="li-2"><a href="/FinacialSys/finacialCreate">收支创建</a></li>
          <li class="li-3"><a href="/FinacialSys/expandShow">我的收支</a></li>
          <li class="li-4"><a href="/FinacialSys/data">数据分析</a></li>
          <li class="li-5"><a href="/FinacialSys/plan">我的计划</a></li>
          <li class="li-6"><a href="/FinacialSys/userGroup">我的家庭组</a></li>
          <div class="current">
              <div class="top-arrow"></div>   
              <div class="current-back"></div>
              <div class="bottom-arrow"></div>
          </div>
        </ul>
        <div id="nav-right">
		   <a href="userSetting" id="user">
		   		<span id="pic" style="background-image: url(/FinacialSys/assets/img/${user.userPic})"></span>
		   		<span id="name">
		   			${user.userNickname.length() > 4 ? user.userNickname.substring(0,4).concat("..."): user.userNickname} 
		   		</span>
		   	</a>	
  	       <a class="fa fa-sign-out" id="log-out" aria-hidden="true" href="logout"></a>
        </div>
    </nav>
    
 <c:forEach items="${page.list}" var="incomeGroup">
 <c:if test="${incomeGroup.incomegroupID eq id }">
    <div class="login-wrap">
    <div class="login-html">
      <input id="tab-1" type="radio" name="tab" class="sign-in" checked /><label for="tab-1" class="tab">支出组的创建</label>
      <div class="login-form">
        <div class="sign-in-htm">
         <form action="/FinacialSys/editIncomeGroup/${current}/${id}" id="createExpandGroup" method="post">
	          <div class="group">
	            <label for="outgroup_Brief" class="label">支出组简介</label>
	            <textarea name="incomegroupBrief"  required="required" form="createExpandGroup" class="input label3" cols=40 rows=4>${incomeGroup.incomegroupBrief}</textarea>
	          </div>
	          <div class="group">
	            <label for="ingroup_Msg" class="label">支出组详细信息</label>
	            <textarea name="incomegroupMsg"form="createExpandGroup" class="input label2" cols=40 rows=4>${ incomeGroup.incomegroupMsg }</textarea>
	          </div>
	          <div class="group">
	            <button type="submit" form="createExpandGroup" class="btn button" >修改</button>
	          </div>
          </form>
          <div class="hr"></div>
          <div class="foot-lnk">
          </div>
        </div>
      </div>
    </div>
  </div>
  </c:if>
 </c:forEach>
</body>
</html>