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
    .error{
    	color:red;
    }
    .t{float:right;}
    .t2{margin-left:200px;}
</style>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="contain">
		<form action="add" method="post" onsubmit="return submitForm()">
			<table  class="table table-striped">
				<caption>添加用户</caption>
				<tr>
					<td class="t">用户姓名</td>
					<td><input id="uname" type="text" class="input" name="userName">
					<span id="nameError" class="error"></span></td>
				</tr>
				<tr>
					<td class="t">用户密码</td>
					<td><input id="passs" type="password" class="input" data-type="password" name="password">
					<span id="pwdError" class="error"></span></td>
				</tr>
				<tr>
					<td class="t">重复密码</td>
					<td><input id="confirm" type="password" class="input" data-type="password" name="confirm">
					<span id="confirmError" class="error"></span></td>
				</tr>
				<tr>
					<td class="t">邮箱地址</td>
					<td><input id="email" type="email" class="input" name="mail">
					<span id="emailError" class="error"></span></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="添加" class="btn btn-primary"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><div class="error">${requestScope.error }</div></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<script>
 	var uname=document.getElementById("uname");
	var pwd=document.getElementById("passs");
	var confirm=document.getElementById("confirm");
	var email=document.getElementById("email");
	
	var nameError=document.getElementById("nameError");
	var pwdError=document.getElementById("pwdError");
	var confirmError=document.getElementById("confirmError");
	var emailError=document.getElementById("emailError");
	
	function submitForm(){
		nameError.innerText="";
		pwdError.innerText="";
		confirmError.innerText="";
		emailError.innerText="";
		
		if(uname.value==""){
			nameError.innerText="请填写用户名";
			uname.focus();
			return false;
		}
		if(pwd.value==""){
			pwdError.innerText="请填写密码";
			pwd.focus();
			return false;
		}
		if(confirm.value==""){
			confirmError.innerText="请确认密码";
			confirm.focus();
			return false;
		}
		if(email.value==""){
			emailError.innerText="请填写邮箱";
			email.focus();
			return false;
		}
	}
</script>