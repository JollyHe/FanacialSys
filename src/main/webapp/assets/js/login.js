$("input[type='text']").blur(function(){
	if($(this).val()=='')
	{
		$("#pop1 strong").html("用户名不能为空");
		$("#pop1").removeClass("hidden");
	}else{
		$("#pop1").addClass("hidden");
	}
});

$("input[type='password']").blur(function(){
	if($(this).val()=='')
	{
		$("#pop2 strong").html("密码不能为空");
		$("#pop2").removeClass("hidden");
	}else{
		$("#pop2").addClass("hidden");
	}
});