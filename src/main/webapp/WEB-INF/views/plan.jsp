<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的计划</title>
	<link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">  
    <link rel="stylesheet" type="text/css" href="assets/css/nav.css">
	<link rel="stylesheet" type="text/css" href="assets/css/plan.css"/>
	<link href="assets/img/favicon-20170803111016817.ico" rel="SHORTCUT ICON">
	<script type="text/javascript" src="assets/js/js/laydate.js"></script>
	
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
<h2>我的计划</h2>
<div id="topTags">
<ul style="display:none;">
</ul>
</div>
</div>
<div id="main">

<div id="leftMenu">
<ul>
<li>计划详情</li>
<li>新的计划</li>
<li>计划分配</li>
<li>更新计划</li>
<li>删除计划</li>
</ul>
</div>

<div id="content">
<div id="welcome" class="content" style="display:block;">
  <div align="center">
    <p> </p>
    <p><strong>计划才是评判消费合理的标准！</strong></p>
    <p> </p>
    </div>
</div>
<div id="c0" class="content">
	 <table class="z_i">
        	<tr class="i0">
            	<td >计划名称</td>
                <td >开始时间</td>
                <td >结束时间</td>
                <td >计划总金额（元）</td>
                <td >计划简介</td>
                <td >查看细节</td>
            </tr>
           <c:forEach items="${plans}" var="plan">
           		<tr class="i1">
	                <td title="${plan.planName}" width="16.5%">${plan.planName}</td>
	                <td>${plan.beginTime}</td>
	                <td>${plan.endTime}</td>
	                <td>${plan.planMoney}</td>
	                <td>${plan.planMsg}</td>
	                <td><a href="javascript:void(0);" class="look" onclick="show(${plan.planID})">查看细节</a></td>
           		</tr>
		</c:forEach>
        </table>
</div>

<div id="c1" class="content">
	<div class="menu-x">
        <div class="menu-1">
	        <form action="createPlan" method="post" id="createPlan">
		        <input required='' type='text' name="planName">
		        <label alt='计划名称' placeholder='计划名称' ></label>
	 
		        <input required='' type='text' class="laydate-icon" id="beginDate" name="beginTime">
		        <label alt='计划开始时间' placeholder='计划开始时间'></label>
	        
		        <input required='' type='text' class="laydate-icon" name="endTime" id="endDate">
		        <label alt='计划结束时间' placeholder='计划结束时间'></label>
	        
		        <input required='' type='text' name="planMoney">
		        <label alt='总金额（元）' placeholder='总金额（元）'></label>
	        
		        <input required='' type='text' name="planMsg">
		        <label alt='计划简介' placeholder='计划简介'></label>
	        </form>
	        <button id="submit" type="submit" form="createPlan" class="btn1">创建计划</button>
        </div>
    </div>
</div>

<div id="c2" class="content">
	<div class="menu-x">
	    <div class="money-1">
	    <form>
	    	<span>总金额（元）:<strong id="sumMoney"></strong></span>
	    	</br>
	        <span>选择计划：
	        <select name="planID" id="select-plan" onchange="changePlan(this.value)">
	        <option value="0" selected="selected" style='display: none'></option>
			<c:forEach items="${plans}" var="plan">
				<option value="${plan.planID}">${plan.planName}</option>
			</c:forEach>
			</select>
			</span>
			<span id="pos-1">选择标签：
			<select name="log.logID" id="select-log">
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
			</span>
			<span id="pos-2">分配金额（元）:<input type=" " name="detailMoney" id="detailMoney" class="money"></span>
			<a  class="btn btn-default" onclick="createDetail()" id="add">添加</a>
		</form>
		</div>
		<div>
			<table class="z_i">
        	<thead class="i0">
                <td width="20%">项目</td>
                <td width="20%">分配金额（元）</td>
                <td width="20%">操作</td>
            </thead>
            <tbody id="detailTable">
            <tbody>
        </table>
		</div>
    </div>
</div>

<div id="c3" class="content">
	<div class="menu-x">
        <div class="menu-1">
        	<span id="span1">选择计划：
	        	<select name="planID" id="select-updatePlan" onchange="changeUpdatePlan(this.value)" form="editPlan">
		        <option value="0" selected="selected" style='display: none'></option>
				<c:forEach items="${plans}" var="plan">
					<option value="${plan.planID}">${plan.planName}</option>
				</c:forEach>
				</select>
			</span>
	       <form action="editPlan" method="post" id="editPlan">
		        <input required='' type='text' name="planName" id="editName">
		        <label alt='计划名称' placeholder='计划名称' ></label>
	 
		        <input required='' type='text' class="laydate-icon" id="editBeginDate" name="beginTime">
		        <label alt='计划开始时间' placeholder='计划开始时间'></label>
	        
		        <input required='' type='text' class="laydate-icon" name="endTime" id="editEndDate">
		        <label alt='计划结束时间' placeholder='计划结束时间'></label>
	        
		        <input required='' type='text' name="planMoney" id="editMoney">
		        <label alt='总金额（元）' placeholder='总金额（元）'></label>
	        
		        <input required='' type='text' name="planMsg" id="editMsg">
		        <label alt='计划简介' placeholder='计划简介'></label>
	        </form>
	        <button id="updateBtn" form="editPlan" class="btn1">更新计划</button>
        </div>
    </div>
</div>
<div id="c4" class="content">
	<div style="width:580px;margin:0 auto;">
		<form id="form1" name="removePlan" method="post" action="removePlan">
			<table width="580" cellpadding="0" cellspacing="0" id="tabProduct">
				<tr>
					<td width="32" align="center" bgcolor="#EFEFEF" Name="Num"></td>
					<td width="120" bgcolor="#EFEFEF" Name="Name" EditType="TextBox">计划名称</td>
					<td width="103" bgcolor="#EFEFEF" Name="Begin" EditType="TextBox">开始时间</td>
					<td width="103" bgcolor="#EFEFEF" Name="End" EditType="TextBox">结束时间</td>
					<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">总金额（元）</td>
					<td width="103" bgcolor="#EFEFEF" Name="Msg" EditType="TextBox">计划简介</td>
				</tr>
				<c:forEach items="${plans}" var="plan">
	           		<tr class="i1">
	           			<td align="center"><input type="checkbox" name="checked" value="${plan.planID}" /></td>
		                <td title="${plan.planName}" width="16.5%">${plan.planName}</td>
		                <td>${plan.beginTime}</td>
		                <td>${plan.endTime}</td>
		                <td>${plan.planMoney}</td>
		                <td>${plan.planMsg}</td>
	           		</tr>
				</c:forEach>
			</table>
			<br />
			<input type="submit" name="Submit2" value="删除" onclick="DeleteRow(document.getElementById('tabProduct'),1)" />
		</form>
	</div>
</div>

<div id="c5" class="content">
	<table width="580" cellpadding="0" cellspacing="0">
				<thead>
					<th width="120" bgcolor="#EFEFEF"  EditType="TextBox" style="text-align:center;">类型</td>
					<th width="103" bgcolor="#EFEFEF"  EditType="TextBox" style="text-align:center;">计划差值</td>
				</thead>
				<tbody id="showTbody">
				</tbody>
	</table>
</div>

</div>
</div>


  <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="assets/js/plan.js"></script>
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
  </script>
  	<script type="text/javascript">
  	!function(){
  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
  		laydate({elem: '#beginDate', min: laydate.now(0)});//绑定元素
  	}();
  	!function(){
  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
  		laydate({elem: '#endDate', min: laydate.now(0)});//绑定元素
  	}();
	!function(){
  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
  		laydate({elem: '#editBeginDate', min: laydate.now(0)});//绑定元素
  	}();
  	!function(){
  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
  		laydate({elem: '#editEndDate', min: laydate.now(0)});//绑定元素
  	}();
	</script>
	<script>
		function changePlan(planID){
			$.get('changePlan',{planID:planID},function(planMsg){
				$('#detailTable').empty();
				if(planMsg.details != null){	
					$('#sumMoney').html(planMsg.sumMoney);
					$.each(planMsg.details, function(i, detail){
						var tr = $('<tr/>');
			            tr.attr("id",detail.detailID);
			            $('<td/>').html( detail.detailMoney ).appendTo( tr );
			            $('<td/>').html( detail.log.logName ).appendTo( tr );
			            $('<td/>').append( $('<a/>').html('删除').attr({onclick:"removeDetail("+detail.detailID+")",href:"javascript:void(0);"})).appendTo( tr );
			            $('#detailTable').append(tr);
					});
				}
			},'json');
		}
		function changeUpdatePlan(planID){
			$.get('changeUpdatePlan',{planID:planID},function(plan){
				if(plan.planID!=null){
					$('#updateBtn').attr("form","editPlan");
					$('#editName').val(plan.planName);	
					$('#editBeginDate').val(plan.beginTime);	
					$('#editEndDate').val(plan.endTime);	
					$('#editMoney').val(plan.planMoney);	
					$('#editMsg').val(plan.planMsg);
				} else{
					$('#updateBtn').attr("form","");
				}
			},'json');
		}
		function removeDetail(detailID){
			$.get('removeDetail',{
				detailID:detailID	
			},function(planMsg){
				 $('#sumMoney').html(planMsg.sumMoney);
				 $('#'+detailID).empty();
			},'json');
			
		}
		function createDetail(){
			$.get('createDetail',{
				detailMoney:$('#detailMoney').val(),
				"plan.planID":$('#select-plan').val(),
				"log.logID":$('#select-log').val()			
			},function(planMsg){
				if(planMsg.details != null){	
					$('#sumMoney').html(planMsg.sumMoney);
					$('#detailTable').empty();
			
					$.each(planMsg.details, function(i, detail){
						var tr = $('<tr/>');
			            tr.attr("id",detail.detailID);
			            $('<td/>').html( detail.detailMoney ).appendTo( tr );
			            $('<td/>').html( detail.log.logName ).appendTo( tr );
			            $('<td/>').append( $('<a/>').html('删除').attr({onclick:"removeDetail("+detail.detailID+")",href:"javascript:void(0);"})).appendTo( tr );
			            $('#detailTable').append(tr);
					});
					
				} else{
					alert("您的余额不足！");
				}
			},'json');
		}
		
		function show(planID)
		{
			$.get('showPlanDetails',{
				"planID":planID	
			},function(PlanDetails){
				$('#showTbody').empty();			
				$.each(PlanDetails.diff, function(key, value){
					var tr = $('<tr/>');
		            $('<td/>').html( key ).appendTo( tr );
		            $('<td/>').html( value ).appendTo( tr );
		            $('#showTbody').append(tr);
				});
				$('#c0').css("display","none");
				$('#c5').css("display","block");
			},'json');
		}
	</script>
</body>
</html>