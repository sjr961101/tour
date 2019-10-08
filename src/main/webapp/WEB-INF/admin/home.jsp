<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>去旅行</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/admin/same.css">
<style>
    .t{float:right;}
</style>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="contain">
		<table class="table table-striped">
			<caption>个人信息</caption>
			<tr>
				<td  class="t">用户编号</td>
				<td>${loginUser.userId }</td>
			</tr>
			<tr>
				<td class="t">用户姓名</td>
				<td>${loginUser.userName }</td>
			</tr>
			<tr>
				<td class="t">用户密码</td>
				<td>${loginUser.password }</td>
			</tr>
			<tr>
				<td class="t">邮箱地址</td>
				<td>${loginUser.email }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="editUser?userId=${loginUser.userId }">
						<input type="button" value="编辑" class="btn btn-primary">
					</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>