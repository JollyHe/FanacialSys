<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <title>编辑支出</title>
  	<link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="/FinacialSys/assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/createExpand.css">
    <link href="/FinacialSys/assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
    <link rel="stylesheet" type="text/css" href="/FinacialSys/assets/css/editEAI.css">
</head>
<body>
  <nav id="menu" class="navbar" style="height:78px">
        <ul id="nav-list">
          <li class="li-1"><a href="/FinacialSys/home" style="font-size: 14px">主页</a></li>
          <li class="li-2"><a href="/FinacialSys/finacialCreate" style="font-size: 14px">收支创建</a></li>
          <li class="li-3"><a href="/FinacialSys/expandShow" style="font-size: 14px">我的收支</a></li>
          <li class="li-4"><a href="/FinacialSys/data" style="font-size: 14px">数据分析</a></li>
          <li class="li-5"><a href="/FinacialSys/plan" style="font-size: 14px">我的计划</a></li>
          <li class="li-6"><a href="/FinacialSys/userGroup" style="font-size: 14px">我的家庭组</a></li>
          <div class="current">
              <div class="top-arrow"></div>   
              <div class="current-back"></div>
              <div class="bottom-arrow"></div>
          </div>
        </ul>
        <div id="nav-right" style="padding-top:1px;">
		   <a href="/FinacialSys/userSetting" id="user">
		   		<span id="pic" style="background-image: url(/FinacialSys/assets/img/${user.userPic})"></span>
		   		<span id="name" style="font-size: 14px;padding-top: 5px;">
		   			${user.userNickname.length() > 4 ? user.userNickname.substring(0,4).concat("..."): user.userNickname} 
		   		</span>
		   	</a>	
  	       <a class="fa fa-sign-out" id="log-out" aria-hidden="true" href="/FinacialSys/logout"></a>
        </div>
    </nav>
    
  <c:forEach items="${page.list}" var="expand">
		<c:if test="${expand.outID eq id }">             
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
            <button class="btn_sign_up" onClick="cambiar_sign_up()">填写支出信息</button>
          </div>
        </div>
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="/FinacialSys/assets/img/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="/FinacialSys/assets/img/po.jpg" alt="" /> </div>
        <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="fa fa-arrow-right"></i></a>
          <h2>附加信息</h2>
          		<div class="selectGroup">
		          	<span>类型</span>
		          	<select name="log.logID" form="expand" placeholder="便签" size="1"> 
						 <c:forEach items="${logs}" var="log" varStatus="status">
							<c:choose >
								<c:when test="${log.logID eq expand.log.logID}">
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
								  <c:when test="${group.outgroupID eq expand.expandgroup.outgroupID }">
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
         <form id="expand" action="/FinacialSys/editExpand/${current}/${id}" method="post">
	        <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="fa fa-arrow-left"></i></a>
	          <h2>基本信息</h2> 
	          	
	          				  <input type="text" value="${ expand.outMoney}" name="outMoney"/>
					          <input type="text" value="${ expand.outPlace }" name="outPlace"/>
					          <input type="text" value="${ expand.outMessage }" name="outMessage"/>
					          <input type="text" value="${ expand.outTime }" name="outTime" id="expandDate"/>
	          		
		         
		          <button class="btn_sign_up" type="submit" form="expand">提交</button>      
	        </div>
         <form>
      </div>
    </div>
  </div>
  	</c:if>
   </c:forEach>
	 <script type="text/javascript" src="/FinacialSys/assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/FinacialSys/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/FinacialSys/assets/js/createExpand.js"></script>
	<script type="text/javascript" src="/FinacialSys/assets/js/js/laydate.js"></script>
	<script type="text/javascript">
		!function(){
	  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	  		laydate({elem: '#expandDate', max: laydate.now(0)});//绑定元素
	  	}();
	</script>
 
</body>
</html>