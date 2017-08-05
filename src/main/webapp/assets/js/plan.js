window.onload=function(){
function $(id){return document.getElementById(id)}
var menu=$("topTags").getElementsByTagName("ul")[0];//顶部菜单容器
var tags=menu.getElementsByTagName("li");//顶部菜单
var ck=$("leftMenu").getElementsByTagName("ul")[0].getElementsByTagName("li");//左侧菜单
var j;
//点击左侧菜单增加新标签
for(i=0;i<ck.length;i++){
	ck[i].onclick=function(){
	$("welcome").style.display="none"//欢迎内容隐藏
	
	//循环取得当前索引
	for(j=0;j<ck.length+1;j++){
		if(this==ck[j]){
			if($("p"+j)==null){
			openNew(j,this.innerHTML);//设置标签显示文字
		}
		clearStyle();
		$("p"+j).style.backgroundColor="yellow";
		clearContent();
		$("c"+j).style.display="block";
	 }
 }
return false;
  }
 }
//增加或删除标签
function openNew(id,name){
var tagMenu=document.createElement("li");
tagMenu.id="p"+id;
tagMenu.innerHTML=name+"   "+"<img src='' style='vertical-align:middle'/>";
//标签点击事件
tagMenu.onclick=function(evt){
clearStyle();
tagMenu.style.backgroundColor="yellow";
clearContent();
$("c"+id).style.display="block";
}
//标签内关闭图片点击事件
tagMenu.getElementsByTagName("img")[0].onclick=function(evt){
evt=(evt)?evt:((window.event)?window.event:null);
if(evt.stopPropagation){evt.stopPropagation()} //取消opera和Safari冒泡行为;
this.parentNode.parentNode.removeChild(tagMenu);//删除当前标签
var color=tagMenu.style.backgroundColor;
//设置如果关闭一个标签时，让最后一个标签得到焦点
if(color=="#ffff00"||color=="yellow"){//区别浏览器对颜色解释
if(tags.length-1>=0){
clearStyle();
tags[tags.length-1].style.backgroundColor="yellow";
clearContent();
var cc=tags[tags.length-1].id.split("p");
$("c"+cc[1]).style.display="block";
 }
else{
clearContent();
$("welcome").style.display="block"
   }
  }
}
menu.appendChild(tagMenu);
}
//清除标签样式
function clearStyle(){
for(i=0;i<tags.length;i++){
menu.getElementsByTagName("li")[i].style.backgroundColor="#FFCC00";
  }
}
//清除内容
function clearContent(){
for(i=0;i<=5;i++){
$("c"+i).style.display="none";
 }
}
}

