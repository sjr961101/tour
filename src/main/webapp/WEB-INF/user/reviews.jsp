<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
<link href="css/user/title.css"  type="text/css" rel="stylesheet">
<link href="css/user/scenic.css"  type="text/css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- 导入kinkeditor需要的脚本 -->
  <script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script> 
</head>
<body>
<%-- 	<div class="title">
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
	    <li ><a href="javascript:void(0);" name="hotal" class="go">住酒店</a></li>
	    <li ><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    <li ><a href="javascript:void(0);" name="recommend" class="go">我要推荐</a></li>
	    
	  </ul>
	</nav>
</div>
<div class="head"></div> --%>
	 <div style="">
	 <h4>发表评论</h4>
	 <input type="button" value="发表评论" onclick="publishChart()" id="publishButton"> 
	<div id="chartContent" style="display:none;">
	<!-- 图片上传服务器与文本提交应区分URL -->
	<form action="publishChart.do" method="post" onsubmit="return  press()"
		name="example" enctype="multipart/form-data">
		<table class="table" width="600" height="150">
			<tr>
				<td>
					<div>
						<input type="hidden" name="userId" value="3"> 
						<input type="hidden" name="scenicId" value="7">
					 	<!-- 使用textarea呈现富文本编辑器 -->
						<textarea id="editor_id" name="content"	style="width: 600px; height: 160px;overflow:auto">
						</textarea>
						<input type="hidden" id="content">
					</div>
					<div style="text-align:center;">
						<input	type="submit" value="发布">
					</div>
					
				</td>
			</tr>
		</table>
		
		
	</form>
	</div>
	</div>
	<div style="">
		<!-- <ul class="nav nav-pills">
			<li class="active"><a href="#">网友评论</a></li>
			<li></li>
		</ul> -->
		 <h4>网友评论</h4> 
		<table class="table" width="600">
		<c:forEach items="${chartList }" var="chart" varStatus="status">
			<tr style="height:100px;">	
				<td>
					<%-- ${chart.chartId } --%>
					<div style="width:600px;">
						<div style="float:left;text-align:left; width:300px;">${chart.user.userName }</div>
						<div style="text-align:right;float:left;width:300px;color:gray;font-size:12px;">发表时间：${chart.formatTime }</div>
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
	
	<!-- <ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li class="active"><a href="#">1</a></li>
    <li class="disabled"><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
	</ul> -->
</body>
</html>

