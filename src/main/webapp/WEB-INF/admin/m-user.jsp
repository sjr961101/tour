<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/admin/same.css">
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="contain">
		<table  class="table table-striped">
			<caption>用户管理</caption>
			<tr>
				<th>用户编号</th>
				<th>用户姓名</th>
				<th>用户密码</th>
				<th>用户邮箱</th>
				<th>用户权限</th>
				<th>用户可用</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>
			<c:forEach var="user" items="${userList }">
			<tr>
				<td>${user.userId }</td>
				<td>${user.userName }</td>
				<td>${user.password }</td>
				<td>${user.email }</td>
				<c:choose>
					<c:when test="${user.authorityId==1 }">
						<td>用户</td>
					</c:when>
					<c:otherwise>
						<td>管理员</td>
					</c:otherwise>
				</c:choose>
				<!-- 1为可用  0为禁用 -->
				<c:choose>
					<c:when test="${user.isAble==1 }">
						<td><a href="javascript:disableUser(${user.userId })">禁用</a></td>
					</c:when>
					<c:otherwise>
						<td><a href="javascript:enableUser(${user.userId })">启用</a></td>
					</c:otherwise>
				</c:choose>
				<td>
					<a href="editUser?userId=${user.userId }">编辑</a>
				</td>
				<td>
					<a href="javascript:deleteUser(${user.userId })">删除</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
	/* 删除用户 */
	function deleteUser(userId){
		$.ajax({
			url:"deleteUser",
			type:"get",
			data:{"userId":userId},
			dataType:"json",
			success:function(data){
				location.reload();
			}
		});
		location.reload();
		return false;
	}
	
	/* 禁用 */
	function disableUser(userId){
		$.ajax({
			url:"disableUser",
			type:"get",
			data:{"userId":userId},
			dataType:"json",
			success:function(data){
				location.reload();
			}
		});
		location.reload();
		return false;
	}
	
	/* 启用 */
	function enableUser(userId){
		$.ajax({
			url:"enableUser",
			type:"get",
			data:{"userId":userId},
			dataType:"json",
			success:function(data){
				location.reload();
			}
		});
		location.reload();
		return false;
	}
</script>