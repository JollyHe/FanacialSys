<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <title>创建支出</title>
  	<link rel="stylesheet" type="text/css" href="assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="assets/css/createExpand.css">
     <link href="assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
</head>
<body>
  <nav id="menu" class="navbar" style="height:78px">
        <ul id="nav-list">
          <li class="li-1"><a href="home" style="font-size: 14px">主页</a></li>
          <li class="li-2"><a href="finacialCreate" style="font-size: 14px">收支创建</a></li>
          <li class="li-3"><a href="expandShow" style="font-size: 14px">我的收支</a></li>
          <li class="li-4"><a href="data" style="font-size: 14px">数据分析</a></li>
          <li class="li-5"><a href="plan" style="font-size: 14px">我的计划</a></li>
          <li class="li-6"><a href="userGroup" style="font-size: 14px">我的家庭组</a></li>
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
    
               
  <div class="cont_centrar">
    <div class="cont_login">
      <div class="cont_info_log_sign_up">
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>附加信息</h2>
            <p>请您认真填写关于支出的附加信息</p>
            <button class="btn_login" onClick="cambiar_login()">填写附加信息</button>
          </div>
        </div>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>基本信息</h2>
            <p>请您认真填写关于支出的基本信息</p>
            <button class="btn_sign_up" onClick="cambiar_sign_up()">填写基本信息</button>
          </div>
        </div>
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="assets/img/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="assets/img/po.jpg" alt="" /> </div>
        <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="fa fa-arrow-right"></i></a>
          <h2>附加信息</h2>
          		<div class="selectGroup">
		          	<span>类型</span>
		          	<select name="log.logID" form="expand" placeholder="便签" size="1"> 
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
          		<div class="selectGroup">
          			<span>支出组</span>
		         	 <select name="expandgroup.outgroupID" form="expand" placeholder="便签" size="1">      
							  <c:forEach items="${groups}" var="group" varStatus="status">
							  <c:choose >
								  <c:when test="${group.outgroupBrief.equals('其他') }">
									<option value="${group.outgroupID}" selected="selected">${group.outgroupBrief}</option>
								  </c:when>
								  <c:otherwise>
								 	 <option value="${group.outgroupID}">${group.outgroupBrief}</option>
								  </c:otherwise>
							   </c:choose>
							  </c:forEach>  
		                </select> 
                </div>
                <div class="selectGroup">
          			<span>计划</span>
		         	 <select name="plan.planID" form="expand" placeholder="便签" size="1"> 
		         			 <option value="0" selected="selected" style='display: none'></option>     
							  <c:forEach items="${plans}" var="plan" varStatus="status">						  
								 	 <option value="${plan.planID}">${plan.planName}</option>
							  </c:forEach>  
		                </select> 
                </div>
        </div>
         <form id="expand" action="createExpand" method="post">
	        <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="fa fa-arrow-left"></i></a>
	          <h2>基本信息</h2> 
		          <input type="text" placeholder="支出金额" name="outMoney"/>
		          <input type="text" placeholder="支出地点" name="outPlace"/>
		          <input type="text" placeholder="支出详细信息" name="outMessage"/>
		          <input type="text" placeholder="支出日期" name="outTime" class="laydate-icon" id="expandDate"/>
		          <button class="btn_sign_up" form="expand">提交</button>      
	        </div>
         <form>
      </div>
    </div>
  </div>
	 <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/createExpand.js"></script>
	<script type="text/javascript" src="assets/js/js/laydate.js"></script>
	<script type="text/javascript">
		!function(){
	  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	  		laydate({elem: '#expandDate', max: laydate.now(0)});//绑定元素
	  	}();
	</script>
 
</body>
</html>