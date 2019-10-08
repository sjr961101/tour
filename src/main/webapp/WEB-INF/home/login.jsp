<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>用户登录注册界面</title>
	<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	  <link rel="stylesheet" href="css/jigsaw.css">
	  <style>
	  	
	  	  #msg {
      width: 100%;
      line-height: 40px;
      font-size: 14px;
      text-align: center;
    }
    .error{
    	color:red;
    }
	  </style>
</head>
<body>
	<div class="jq22-container" style="padding-top:100px">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
				<div class="login-form">
					<form action="login" method="post">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">用户名</label>
							<input id="username" name="userName" value="admin" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="password" name="password" type="password" class="input" data-type="password">
						</div>
						<div class="group">
							<div class="container">
							    <div id="captcha" style="position: relative" data-type="password"></div>
								<div id="msg"></div>
								<input type="hidden" name="msg" id="msgs"> 
							</div>
						</div>
						<!-- <div class="group" class="checkbox">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span> 保持登录</label>
						</div>		 -->				
						<div class="group">
							<input type="submit" class="button" value="登录">
						</div>
						<div class="error">${requestScope.error }</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="forget">忘记密码?</a>
						</div>
					</div>
					</form>
					<form action="regist" method="post" onsubmit="return submitForm()">
					<div class="sign-up-htm">
						<div class="group">
							<label for="user" class="label">用户名</label>
							<input id="uname" type="text" class="input" name="userName">
							<span id="nameError" class="error"></span>
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="passs" type="password" class="input" data-type="password" name="password">
							<span id="pwdError" class="error"></span>
						</div>
						<div class="group">
							<label for="pass" class="label">重复密码</label>
							<input id="confirm" type="password" class="input" data-type="password" name="confirm">
							<span id="confirmError" class="error"></span>
						</div>
						<div class="group">
							<label for="pass" class="label">邮箱地址</label>
							<input id="email" type="email" class="input" name="mail">
							<span id="emailError" class="error"></span>
						</div>
						<div class="group">
							<input type="submit" class="button" value="注册">
						</div>
						<div class="error">${requestScope.error }</div>
						<div class="hr"></div>
						<!-- <div class="foot-lnk">
							<label for="tab-1">已经成员?</a>
						</div> -->
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
	<script src="js/jigsaw.js"></script>
<script>
	var flag=false;	
	$("#msgs").val("0");
 	jigsaw.init(document.getElementById('captcha'), function () {
	  	flag=true;
	  	$("#msgs").val("1");
	    document.getElementById('msg').innerHTML = '验证成功！';
  	})
 	
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
</body>
</html>