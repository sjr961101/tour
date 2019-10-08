<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/admin/same.css">
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
<style>
    .t{float:right;}
</style>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="contain">
		<form action="edit" method="post">
			<table  class="table table-striped">
				<caption>编辑用户</caption>
				<tr>
					<td  class="t">用户编号</td>
					<td><input type="text" name="userId" value="${user.userId }" readOnly="true"></td>
				</tr>
				<tr>
					<td class="t">用户姓名</td>
					<td><input type="text" name="userName" value="${user.userName }"></td>
				</tr>
				<tr>
					<td class="t">用户密码</td>
					<td><input type="text" name="password" value="${user.password }" }></td>
				</tr>
				<tr>
					<td class="t">邮箱地址</td>
					<td><input type="email" name="email" value="${user.email }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="提交" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>