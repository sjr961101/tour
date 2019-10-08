<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/admin/admin-menu.css">
<title></title>
</head>
<body>

<div class="menuHolder" style="overflow: visible;">
	<div class="menuWindow">
		<ul class="p1">
			<li class="s1"><a href="#url">旅游吧~</a>
				<ul class="p2">
					<li class="s2"><a href="adminPage.do?index=home"><span>首页</span></a></li>
					<li class="s2"><a href="showUser"><span>用户管理</span></a>
						<ul class="p3 a3">
							<li><a href="showUser">查看用户</a></li>
							<li><a href="addUser">添加用户</a></li>
							<!-- <li><a href="#">用户推荐</a></li> -->
						</ul>
					</li>
					
					<li class="s2"><a href="hotelSelect?p=1"><span>酒店信息管理</span></a>
						<ul class="p3 a3">
							<li><a href="hotelSelect?p=1">查看酒店信息</a></li>
							<li><a href="hotelRecommand">添加酒店信息</a></li>
						</ul>
					</li>
					<li class="s2"><a href="adminPage.do?index=m-scenic"><span>热门景点管理</span></a>
						<ul class="p3 a3">
							<li><a href="adminPage.do?index=m-scenic">查看景点</a></li>

						</ul>
					</li>
					<li class="s2 b6"><a href="manageMonthChart?p=1"><span>用户点评管理</span></a>
						<ul class="p3 a3">
							<li><a href="manageMonthChart?p=1">本月点评</a></li>
							<li><a href="manageWeekChart?p=1">本周点评</a></li>
							
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>

</div>
<div class="login">
	<div>您好,<a>${loginUser.userName }</a>&nbsp;管理员&nbsp;&nbsp;<a style="color:gray;" href="loginOff">退出</a></div>
</div>
</body>
</html>