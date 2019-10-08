<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="css/user/title.css"  type="text/css" rel="stylesheet">
<link href="css/user/scenic.css"  type="text/css" rel="stylesheet">
<!-- bottom -->
<!-- 引用css初始化文件 -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/normalize.css" />
 --%><!-- 头部和底部 结构基本相同 基本的公共样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" />
<!-- 导入kinkeditor需要的脚本 -->
  <script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script> 
</head>
<body>
<div>
	<div class="title">
	<div >
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
	    <li class="active"><a href="javascript:void(0);" name="scenic" class="go">逛景点</a></li>
	    <li ><a href="javascript:void(0);" name="hotel" class="go">住酒店</a></li>
	    <li ><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    <li ><a href="javascript:void(0);" name="recommend" class="go">我要推荐</a></li>

	  </ul>
	</nav>
</div>
	<div class="head"></div>
	<div class="contain1">
	<div style="width:1100px;height:60px;">
			<a href="#" style="color:orange;"><div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;">景点详情</div></a>
			<div style="float:left;width:780px;height:60px;"></div>
	</div>
			<div style="clear:both;"></div>
			<font size="15px">${scenic.scenicName}</font>
			<br><br>
	<table class="detail-table">
		<tr><td colspan="2"><img src="img/scenic/city/${scenic.picture }" style="width:400px;height:auto;object-fit: cover"></td></tr>
		<tr><td style="width:100px;">地　　点：</td><td>${scenic.province}&nbsp;&nbsp;${scenic.city }</td></tr>
		<tr><td>详细地址：</td><td>${scenic.address }</td></tr>
		<tr><td align="left" valign="top">介　　绍：</td>
		
		<td style="width:850px;" align="left" valign="top">
			<c:if test="${ empty scenic.info }">
				暂无介绍
			</c:if>
			${scenic.info }
		</td>
		
		</tr>
	</table>
	<br><br>
	</div>
	
	<div class="user-chart" style="height:350px;">
		<div style="width:1100px;height:60px;text-align:center;">
			<a href="javascript:loadPage(this)"  id="chartUser"><div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;" >用户评论</div></a>
			<a href="javascript:publishChart(this)"><div style="margin-left:5px;float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;" id="pubChart">发表评论</div></a>
			<!-- <div style="float:left;width:640px;height:60px;"></div> -->
		</div>
		<div style="clear:both;"></div>
		<div>
	<div style="">
	 <!-- <h4 style="display:inline-block;">发表评论</h4> -->
<!-- 	  <button class="btn btn-default" value="发表评论" onclick="publishChart()" id="publishButton">发表评论</button>
 -->	<div id="chartContent" style="display:none;">
	<!-- 图片上传服务器与文本提交应区分URL -->
	<form action="publishChart.do" method="post" onsubmit="return  press()"
		name="example" enctype="multipart/form-data">
		<table class="table" width="600" height="150">
			<tr>
				<td>
					<div>
						<input type="hidden" name="userId" value="${loginUser.userId }"> 
						<input type="hidden" name="scenicId" value="${scenic.scenicId }">
					 	<!-- 使用textarea呈现富文本编辑器 -->
						<textarea id="editor_id" name="content"	style="width: 600px; height: 160px;overflow:auto">
						</textarea>
						<input type="hidden" id="content">
					</div>
					<div style="margin-top:10px;padding-left:500px;">
						<input	type="submit" style="width:130px;height:30px;border-radius:5%;background-color:orange;color:white;" value="发布">
					</div>
					
				</td>
			</tr>
		</table>
		
		
	</form>
	</div>
	<div style="height:50px;"></div>
	</div>
	<div style="" id="tabChart">
		<!-- <ul class="nav nav-pills">
			<li class="active"><a href="#">网友评论</a></li>
			<li></li>
		</ul> -->
		 <!-- <h4>网友评论</h4>  -->
		<table class="table" width="1000">
		<c:forEach items="${chartList }" var="chart" varStatus="status">
			<tr style="height:100px;">	
				<td>
					<%-- ${chart.chartId } --%>
					<div style="width:1000px;">
						<div style="float:left;text-align:left; width:300px;">${chart.user.userName }</div>
						<div style="text-align:right;float:left;width:700px;color:gray;font-size:12px;text-align:right;">发表时间：${chart.formatTime }</div>
					</div>
					<div style="clear:both;"></div>
					<div style="text-align:left;"  class="content${status.index }">${chart.content}</div>
					<div style="text-align:right; color:black;">
							<c:if test="${loginUser.userId==chart.user.userId }">
								<a href="javascript:modifycontent(${chart.chartId },${status.index })"><font style="color:purple;">编辑</font></a>
								<a href="javascript:deleteChart(${chart.chartId },${status.index })"><font style="color:purple;">删除</font></a>
							</c:if>
					</div>
				</td>
			</tr>
		</c:forEach>	
	</table>
	</div> 
		</div>
	</div>
</div>
 <div style="height: 200px;" class="bottom">
		<jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>
</html>
<script>
	function loadPage(){
		$("#chartContent").hide();
		$("#tabChart").show();
	}
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
});</script>
<script>

/* 删除评论 */
function deleteChart(chartId,index){
	if(confirm("确认删除该评论？")){
		$.ajax({
			url:"deleteChart.do?chartId="+chartId,
			type:"GET",
			success:function(data){
				alert("删除成功");
				$("tr[class=chart"+index+"]").remove();
			}
		})
	}
}

var content="";
function modifycontent(chartId,index){
	console.log(chartId);
	console.log($("div[class=content"+index+"]").text());
	var obj=$.trim($("div[class=content"+index+"]").text());
	content=obj;
	$("div[class=content"+index+"]").html("<textarea  onblur='modifySubmit("+chartId+","+index+")'>"+obj+"</textarea>");
}

/* 修改评论 */
function modifySubmit(chartId,index){
	
	//var obj=$("div[class=content"+index+"]").find(":text").val();
	var obj=$("div[class=content"+index+"]").find("textarea").val();
	console.log(obj);
	//console.log("modify");
	if(confirm("确认修改？")){
		content=obj;
		content=$.trim(content);
		//console.log(content);
		$.ajax({
			url:"modifyChart.do?chartId="+chartId+"&content="+content,
			type:"GET",
			success:function(data){
				alert("修改成功");
				$("div[class=content"+index+"]").html(content);
			}
		})
	}
	else{
		
		$("div[class=content"+index+"]").html(content);
	}
	
}

 function publishChart(){
	 $("#tabChart").hide();
	$.ajax({
		url:"isLogin.do",
		type:"GET",
		success:function(data){
			if(data=="success"){
				$("#chartContent").show();
				$("#publishButton").hide();
			}
			else{
				location.href="showLogin";
			}
		}
	})
	
}

//加载创建富文本编辑器
KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id',{
        	//AJAX异步上传的URL
        	uploadJson:"editorUpload.do"
        });       
}); 
var editor = K.create('#editor_id', options);


 

function press(){
	//alert(editor.html());
	$("#chartError").html("");
	if(editor.html()==""){
		alert("请输入评论再提交！");
		//$("#chartError").html("请输入评论再提交！");
		//$("#chartError").show();
		return false;
	}
	else{
		$("#content").val(editor.html());
		alert($("#content.val()").length());
		return true;
		//return true;
	}
	
} 
</script>