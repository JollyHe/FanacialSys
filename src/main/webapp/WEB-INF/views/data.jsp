<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据分析</title>
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nav.css">
	<link rel="stylesheet" type="text/css" href="assets/css/userGroup.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/data.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/js/laydate.js"></script>
	<script type="text/javascript" src="assets/js/echarts.min.js"></script>
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

<div>
	<form action="" id="Date" method="get" style="margin-top: 40px;">
			<table width="800" border="0" cellspacing="0" cellpadding="0" class="register-table">
			  <tr>
			    <td height="40" align="right" style="color:#fff">开始时间：</td>
			    <td height="40" align="left" id = "in-1" ><input type="text" name="te" id="from" class="test-style width150" /></td>
			  </tr>
			  <tr>
			    <td height="40" align="right" style="color:#fff">截止时间：</td>
			    <td height="40" align="left" id = "in-2"><input type="text" name="tex" id="to" class="test-style width150" /></td>
			    <td><button  class="btn btn-default" type="button" form = "Date" onclick="data_bt()" style="margin-left: 60px">查询</button></td>
			  </tr>
			</table>
		
	</form>
</div>  
    <div id="main" style="width: 600px;height:400px; margin: 20px 0 0 400px;border:1px solid #8e8e8e "></div>

	<script type="text/javascript">
	  !function(){
	  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	  		laydate({elem: '#from', max: laydate.now(0)});//绑定元素
	  	}();
	  	!function(){
	  		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	  		laydate({elem: '#to', max: laydate.now(0)});//绑定元素
	  	}();
 
	  function data_bt(){
		    // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('main'));  
		    
	        var option = {
			    title : {
			        text: '月消费情况',
			        subtext: '数据分析',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left'
			    },
			    series : [
			        {
			            name: '支出细节',
			            type: 'pie',
			            radius : '40%',
			            center: ['50%', '50%'],
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
	        
	        $.get('SelectMoney',{HeadTime:$('#in-1 > input').val(),TailTime:$('#in-2 > input').val()},function(data){
	        	if(data.logName != null){
	        		option.legend.data = data.logName;
	        		option.series[0].data = 
					        			 function(){
							            	var res = [];
							            	var len = data.logName.length;
							            	 while (len--) { 
							            		 if(data.money[len] == 0) continue;
						            			 res.push({  
					                                 value: data.money[len],
					                                 name: data.logName[len],
					                             });
					                        };
					                        return res;
							            }();
	        		myChart.setOption(option);
	        	}
	        	else if(data.logName == null){
	        		alert('这段时间无任何消费！');
	        	}
	        },'json');
	    } 
	</script>

</body>
</html>