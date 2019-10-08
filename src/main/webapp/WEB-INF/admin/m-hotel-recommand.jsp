<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>酒店推荐</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/admin/same.css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="contain">
		<table class="table table-striped">
		  <caption>酒店推荐审核</caption>
		  <thead>
		    <tr>
		      <th>推荐人</th>
		      <th>酒店名称</th>
		      <th>酒店地址</th>
		      <th>申请时间</th>
		      <th>详情</th>
		    </tr>
		  </thead>
		  <tbody>
		 
		 	
			   <c:forEach var="hotel" items="${hotelList }">
			   		<tr>
			   			<td>${hotel.user.userName }</td>
			   			<td>${hotel.hotelName }</td>
			   			<td>${hotel.hotelAddress }</td>
			   			<td><fmt:formatDate value="${hotel.recommandTime}" pattern="yyyy-MM-dd HH:mm"/></td>
			   			<td>
						<button class="btn btn-primary btn-xs" data-toggle="modal" data-target=".${hotel.uhId }">
								显示详情
							</button>
							<!-- 模态框（Modal） -->
							
							<div class="modal fade ${hotel.uhId }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div>
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												&times;
											</button>
											<h4 class="modal-title" id="myModalLabel">
												<b>${hotel.user.userName }</b>的推荐
											</h4>
											<hr>
											酒店:<b>${hotel.hotelName }</b>
											<br>
											<img src="/img/hotel/${hotel.picture }" style="width:50%;height:50%;">
										</div>
										<div class="modal-body" style="height:230px; overflow:auto;">
											<table class="table">
												<tr><td style="width:80px;">地　　点：</td><td>${hotel.hotelAddress}</td></tr>
												<tr><td>申请时间：</td><td><fmt:formatDate value="${hotel.recommandTime}" pattern="yyyy-MM-dd HH:mm"/></td></tr>
												<tr><td>申请理由：</td><td>${hotel.reason }</td></tr>
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<button type="button" class="btn btn-primary" style="background-color:#E86C57;" onclick="check(${hotel.uhId },0)">
												驳回
											</button>
											<button type="button" class="btn btn-primary" onclick="check(${hotel.uhId },1)">
												通过
											</button>
										</div>
									</div><!-- /.modal-content -->
								</div><!-- /.modal -->
							</div>
							</div>
						</td>
			   		</tr>		   		
			   </c:forEach>
			
		  
		  </tbody>
		</table>
	</div>
</body>
</html>
<script>
	function check(id,index){
		if(index==0){
			var msg = "确认驳回此推荐吗？";
			if (confirm(msg)==true){
				$.ajax({
					url:"checkHodel?uhId="+id+"&index=-1",
					type:"GET",
					dataType:"text",
					success:function(){
						alert("已驳回！");
						location.replace(location.href);
					}
				});
				
			}else{
				return false;
			}
		}
		else{
			var msg = "确认通过此推荐吗？";
			if (confirm(msg)==true){
				$.ajax({
					url:"checkHodel?uhId="+id+"&index=1",
					type:"GET",
					dataType:"text",
					success:function(){
						alert("已通过！");
						location.replace(location.href);
					}
				});
			}else{
				return false;
			}
		}
	}
</script>