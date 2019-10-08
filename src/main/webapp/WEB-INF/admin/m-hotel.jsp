<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>酒店管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/admin/same.css">
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="contain">
		<table class="table table-striped">
		  <caption>查看酒店</caption>
		  <thead>
		    <tr>
		      <th>酒店编号</th>
		      <th>酒店名称</th>
		      <th>酒店地址</th>
			  <th>删除</th>
		    </tr>
		  </thead>
		  <tbody>
		   <c:forEach var="hotel" items="${hotelList}">
		   		<tr>
		   			<td width="70">${hotel.hotelId }</td>
		   			<td>${hotel.hotelName }</td>
		   			<td>${hotel.hotelAddress }</td>
					<td width="40">
						<a href="javascript:deleteHotel(${hotel.hotelId })">删除</a>
					</td>
		   		</tr>
		   </c:forEach>
		  </tbody>
		</table>
		
		<div style="margin:0 auto; width:560px;">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pageCount-page>10 }">
						<c:forEach begin="${0 }" end="${9 }" step="1" var="p">
							<li><a href="hotelSelect?p=${page+p }">${page+p }</a></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${0 }" end="${pageCount-page }" step="1" var="p">
							<li><a href="hotelSelect?p=${page+p }">${page+p }</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	/* 删除用户 */
	function deleteHotel(hotelId){
		$.ajax({
			url:"deleteHotel",
			type:"get",
			data:{"hotelId":hotelId},
			dataType:"json",
			success:function(data){
				location.reload();
			}
		});
		location.reload();
		return false;
	}
</script>