<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>找路线</title>
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
<link href="css/user/title.css"  type="text/css" rel="stylesheet">
<link href="css/user/way.css"  type="text/css" rel="stylesheet">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IsUMwYn6q9xRk8hIFfRhsh0pW25iMoxo"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- bottom -->
<!--  <link rel="stylesheet icon" type="text/css" href="favicon.ico" /> -->
<!-- 头部和底部 结构基本相同 基本的公共样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" />
<style type="text/css">
.head{
	width:100%;
	height:80px;
	background-color:black;
}
.contain1{
	width:1000px;
	margin:50px auto;
}
#l-map{height:500px;width:550px;}
#rote{
	float:left;
	width:410px;
	height:320px;
	overflow:auto;
}
/* fixediv */
.fixediv{position:fixed;top:300px;z-index:9999;height:216px;width:100px;}
*html .fixediv{position:absolute;top:expression(eval(document.documentElement.scrollTop));margin:140px 0 0 0;}
.fixediv-l{left:0px;}
.fixediv-r{right:0px;}
.fixediv .btn{height:40px;background:#CCCCCC;text-align:right;line-height:25px;overflow:hidden;}
.bottom .service{
 background-color:F5F5F5; 
}
</style>

</head>
<body>
<div style="height:650px;background-color:white;">
	<div class="title">
	<div>
	<c:choose>
		<c:when test="${not empty sessionScope.loginUser }">
			<a href="#">${loginUser.userName }</a>&nbsp;&nbsp;&nbsp;
			<a href="loginOff.do">退出</a>
		</c:when>
		<c:otherwise>
			<a href="showLogin">登录注册</a>
		</c:otherwise>
	</c:choose>	
	</div>
	<nav>
	  <ul>
	    <li ><a href="javascript:void(0);" name="home" class="go">首页</a></li>
	    <li><a href="javascript:void(0);" name="scenic" class="go">逛景点</a></li>
	    <li><a href="javascript:void(0);" name="hotel" class="go">住酒店</a></li>
	    <li class="active"><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    <li ><a href="javascript:void(0);" name="recommend" class="go">我要推荐</a></li>
	  </ul>
	</nav>
</div>
	<div class="head"></div>
	<div class="contain1">
			<div style="float:left;">
				<div id="r-result">起始位置:<input type="text" class="form-control" id="suggestId" size="20" value="起点" style="width:350px;" /></div>
				<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
			    <div style="height:20px;"></div>
				<div id="r-result2">终点位置:<input type="text" class="form-control" id="suggestId2" size="20" value="${addr}" style="width:350px;" /></div>
				<div id="searchResultPanel2" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
				<input type="submit" class="btn btn-default" value="查询" onclick="query()">
			</div>
			<div  style="float:right;">
				<div id="l-map"></div>
			</div>
			<div id="rote"></div>
	</div>
	</div>
	 <div style="height:200px;" class="bottom">
		<jsp:include page="bottom.jsp"></jsp:include>
	</div> 
	<input type="hidden" value="${addr}" id="getAdd" >
	





</body>

<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("l-map");
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);
	var driving = new BMap.DrivingRoute(map, {renderOptions: {map: map, panel: "rote", autoViewport: true}});
	function query(){
		
		var startaddress=$("#suggestId").val();
		var endaddress=$("#suggestId2").val();
		driving.search(startaddress, endaddress);
	}
	
</script>
<script type="text/javascript">
function G(id) {
	return document.getElementById(id);
}
var startaddPonit;
var endaddPonit;
var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
{"input" : "suggestId"
,"location" : map
});

var ac2 = new BMap.Autocomplete(    //建立一个自动完成的对象
{"input" : "suggestId2"
,"location" : map
});


ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
var str = "";
var _value = e.fromitem.value;
var value = "";
if (e.fromitem.index > -1) {
value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
}    
str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
value = "";
if (e.toitem.index > -1) {
_value = e.toitem.value;
value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
}    
str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
G("searchResultPanel").innerHTML = str;

});


ac2.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
var str = "";
var _value = e.fromitem.value;
var value = "";
if (e.fromitem.index > -1) {
value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
}    
str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

value = "";
if (e.toitem.index > -1) {
_value = e.toitem.value;
value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
}    
str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
G("searchResultPanel2").innerHTML = str;
});

var myValue;
ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
var _value = e.item.value;
myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
});

var myValue2;
ac2.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
var _value = e.item.value;
myValue2 = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
G("searchResultPanel2").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue2;

});

</script>
<script>
	$(".go").click(function(){
		var name = $(this).attr("name");
		if(name=="way"){
			window.setTimeout("window.location.href='userPage.do?index=way'", 500);
		}
		else if(name=="hotel"){
			window.setTimeout("window.location.href='userPage.do?index=hotel'", 500);
		}
		else if(name=="scenic"){
			window.setTimeout("window.location.href='userPage.do?index=scenic'", 500);
		}
		else if(name=="recommend"){
			window.setTimeout("window.location.href='userPage.do?index=recommend'", 500);
		}
		else{
			window.setTimeout("window.location.href='userPage.do?index=home'", 500);
		}
	})
</script>

<script>
var nav = $('nav');
var line = $('<div />').addClass('line');

line.appendTo(nav);

var active = nav.find('.active');
var pos = 0;
var wid = 0;

if(active.length) {
  pos = active.position().left;
  wid = active.width();
  line.css({
    left: pos,
    width: wid
  });
}

nav.find('ul li a').click(function(e) {
  if(!$(this).parent().hasClass('active')) {
    e.preventDefault();

    var _this = $(this);

    nav.find('ul li').removeClass('active');

    var position = _this.parent().position();
    var width = _this.parent().width();

    if(position.left >= pos) {
      line.animate({
        width: ((position.left - pos) + width)
      }, 300, function() {
        line.animate({
          width: width,
          left: position.left
        }, 150);
        _this.parent().addClass('active');
      });
    } else {
      line.animate({
        left: position.left,
        width: ((pos - position.left) + wid)
      }, 300, function() {
        line.animate({
          width: width
        }, 150);
        _this.parent().addClass('active');
      });
    }

    pos = position.left;
    wid = width;
  }
});
window.onload=function(){
	$("#suggestId2").val($("#getAdd").val());
}

</script>






</html>

