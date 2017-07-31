<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <title>创建收入</title>
  	<link rel="stylesheet" type="text/css" href="assets/css/reset.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
    <link rel="stylesheet" href="assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="assets/css/createExpand.css">
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
  
    <div class="row" >
            <div class="menu-x col-md-8 col-md-offset-2" id="row">
            <div class="col-md-2 col-md-offset-1" id="form-left">
               <select name="log.logID" form="income"  size="1" id="log"> 
				 <c:forEach items="${logs}" var="log" varStatus="status">
					<c:choose >
						<c:when test="${log.logName.equals('其他')}">
							<option value="${log.logID}" selected="selected">${log.logName}</option>
						</c:when>
						 <c:otherwise>
					   		<option value="${log.logID}">${log.logName}</option>
					    </c:otherwise>
					</c:choose> 
				</c:forEach>  
                </select>  
             </div>
            <div class="col-md-6" id="form-center">
          	        <form id="income" action="createIncome" method="post">
          		        <input required='' type='text' name="inMoney">
          		        <label alt='收入金额' placeholder='收入金额'></label>
          		        <input required='' type='text' name="inPlace">
          		        <label alt='收入地点' placeholder='收入地点'></label>          	    
          		        <input required='' type='text' name="inMessage">
          		        <label alt='收入详细信息' placeholder='信息' ></label>         	    
                      <input required='' type='date' name="inTime">
                    </form>
          	        <button id="submit" form="income" class="btn1">创 建</button>
            </div>
              <div id="form-right" class="col-md-2">

               <select name="incomegroup.incomegroupID" form="income"  size="1" id="log">      
					  <c:forEach items="${groups}" var="group" varStatus="status">
					  <c:choose >
						  <c:when test="${group.incomegroupBrief.equals('其他') }">
							<option value="${group.incomegroupID}" selected="selected">${group.incomegroupBrief}</option>
						  </c:when>
						  <c:otherwise>
						 	 <option value="${group.incomegroupID}">${group.incomegroupBrief}</option>
						  </c:otherwise>
					   </c:choose>
					  </c:forEach>  
                </select> 
   
            </div>
        </div>
       
    </div>
	 <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
 
</body>
</html>