<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
		<div style="height:350px;">
		<table class="table table-striped">
			<caption>本月点评</caption>
			<tr>
				<th>点评内容</th>
				<th>用户名</th>
				<th>用户状态</th>
				<th>景点名</th>
				<th>时间</th>
				<th>编辑评论</th>
				<th>删除评论</th>
				<th>禁用用户</th>
			</tr>
		<c:forEach items="${ monthChart}" var="chart" varStatus="status">
				<tr class="chart${status.index }">
					<td class="content${status.index }">
						${chart.content }
					</td>	
					<td  class="user${status.index }">
						${chart.user.userName }
					</td>
					<td class="userAble${status.index }" value="${chart.user.userId }">
						<c:choose>
							<c:when test="${chart.user.isAble==0}">
								禁用
							</c:when>
							<c:otherwise>
								启用
							</c:otherwise>
						</c:choose>
					</td>	
					<td>
						${chart.scenic.scenicName }
					</td>
					<td >
						${chart.formatTime }
					</td>
					<td >
<%-- 					  <button type="button" class="btn btn-default btn-sm" onclick="modifycontent(${chart.chartId },${status.index })">编辑</button> 
 --%>						<%-- <a href="javascript:modifycontent(${chart.chartId },${status.index })">编辑</a> --%>

						   <button class="btn btn-default" data-toggle="modal"
							data-target=".${status.index }">编辑</button>

						<div class="modal fade ${status.index }"  tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">编辑</h4>
									</div>
									<!-- <form action="modifyChart.do" method="POST" onsubmit="return modifySubmit()"> -->
									<div class="modal-body">
										<input type="hidden" name="chartId" value="${chart.chartId }">
										<!-- 在这里添加一些文本 -->
										<textarea style="overflow: auto; width: 500px;" rows="10"
											cols="20" class="text${status.index }" name="content">${chart.content }</textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="button" class="btn btn-primary" onclick="modifySubmit(${chart.chartId },${status.index })">提交更改</button>
									</div>
									<!-- </form> -->
								</div>
							</div>
						</div>  
					</td>
					<td>
						<button type="button" class="btn btn-default btn-sm" onclick="deleteChart(${chart.chartId },${status.index })">删除</button>
						<%-- <a href="javascript:deleteChart(${chart.chartId },${status.index })">删除</a> --%>
					</td>
					<td value="able${chart.user.userId }">
						<c:choose>
							<c:when test="${chart.user.isAble==0}">
									<button type="button" class="btn btn-default btn-sm" onclick="able(${chart.user.userId },${status.index })">启用用户</button>
							</c:when>
							<c:otherwise>
									<button type="button" class="btn btn-default btn-sm" onclick="userAble(${chart.user.userId },${status.index })">禁用用户</button>
							</c:otherwise>
						</c:choose>
						<%-- <a href="javascript:userAble(${chart.user.userId },${status.index })">启用用户</a> --%>
					</td>
				</tr>
		</c:forEach>
		</table>
		</div>
		<div style="margin:0 auto; width:200px;">
			<ul class="pagination">
				<c:forEach var="p" begin="1" end="${pageSum }" step="1">
					<li><a href="manageMonthChart?p=${p}">${p }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
</body>
</html>
<script>
	var content="";
	function modifycontent(chartId,index){
		console.log(chartId);
		console.log($("td[class=content"+index+"]").html());
		var obj=$.trim($("td[class=content"+index+"]").html());
		content=obj;
		$("td[class=content"+index+"]").html("<input type='text' value='"+obj+"' onblur='modifySubmit("+chartId+","+index+")'>");
	}
	
	/* 修改评论 */
	function modifySubmit(chartId,index){
		
		 var obj=$("td[class=content"+index+"]").find(":text").val();
		
		//console.log(obj);
		//console.log("modify");
		/* if(confirm("确认修改？")){
			content=obj;
			$.ajax({
				url:"modifyChart.do?chartId="+chartId+"&content="+content,
				type:"GET",
				success:function(data){
					alert("修改成功");
					$("td[class=content"+index+"]").html(content);
				}
			})
		}
		else{
			
			$("td[class=content"+index+"]").html(content);
		}  */
		 if(confirm("确认修改？")){
			content=$("textarea[class=text"+index+"]").val();
			console.log(content);
			$.ajax({
				url:"modifyChart.do?chartId="+chartId+"&content="+content,
				type:"GET",
				success:function(data){
					alert("修改成功");
					$("td[class=content"+index+"]").html(content);
					$("textarea[class=text"+index+"]").html(content);
				}
			})
		}
		else{
			
			$("td[class=content"+index+"]").html(content);
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
					$("td[value="+userId+"]").html("禁用");
					$("td[value=able"+userId+"]").html("<button type='button' class='btn btn-default btn-sm' onclick='able("+userId+","+index+")'>启用用户</button>");
				}
			})
		}
	}
	
	/* 启用用户 */
	function able(userId,index){
		if(confirm("确认启用该用户？")){
			$.ajax({
				url:"enableUser?userId="+userId,
				type:"GET",
				success:function(date){
					alert("启用成功!");
					$("td[value="+userId+"]").html("启用");
					$("td[value=able"+userId+"]").html("<button type='button' class='btn btn-default btn-sm' onclick='userAble("+userId+","+index+")'>禁用用户</button>");
				}
			})
		}
	}
</script>