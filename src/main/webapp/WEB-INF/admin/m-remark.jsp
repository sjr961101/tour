<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>点评管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/admin/same.css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="contain">
		用户点评
		<table>
			<tr>
				<th>点评内容</th>
				<th>用户名</th>
				<th>用户状态</th>
				<th>景点名</th>
				<th>时间</th>
				<th>编辑</th>
			</tr>
		<c:forEach items="${ chartList}" var="chart" varStatus="status">
				<tr class="chart${status.index }">
					<td class="content${status.index }">
						${chart.content }
					</td>	
					<td  class="user${status.index }">
						${chart.user.userName }
					</td>
					<td class="userAble${status.index }">
						${chart.user.isAble}
					</td>	
					<td>
						${chart.scenic.scenicName }
					</td>
					<td>
						${chart.formatTime }
					</td>	
					<td>
						<a href="javascript:modifycontent(${chart.chartId },${status.index })">编辑</a><a href="javascript:deleteChart(${chart.chartId },${status.index })">删除</a><a href="javascript:userAble(${chart.user.userId },${status.index })">禁用用户</a>
					</td>	
				</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>
<script>
	var content="";
	function modifycontent(chartId,index){
		console.log(chartId);
		console.log($("td[class=content"+index+"]").text());
		var obj=$.trim($("td[class=content"+index+"]").text());
		
		$("td[class=content"+index+"]").html("<input type='text' value='"+obj+"' onblur='modifySubmit("+chartId+","+index+")'>");
	}
	
	/* 修改评论 */
	function modifySubmit(chartId,index){
		console.log(index);
		var obj=$("td[class=content"+index+"]").find(":text").val();
		content=obj;
		console.log(obj);
		console.log("modify");
		if(confirm("确认修改？")){
			$.ajax({
				url:"modifyChart.do?chartId="+chartId+"&content="+content,
				type:"GET",
				success:function(data){
					alert("修改成功");
					$("td[class=content"+index+"]").html(content);
				}
			})
		}
		
	}
	
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
	
	/* 禁用用户 */
	function userAble(userId,index){
		if(confirm("确认禁用该用户？")){
			$.ajax({
				url:"userAble?userId="+userId,
				type:"GET",
				success:function(date){
					alert("禁用成功!");
					$("td[class=userAble"+index+"]").html("0");
				}
			})
		}
	}
</script>