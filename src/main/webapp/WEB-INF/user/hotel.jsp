<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>住酒店</title>
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
<link href="css/user/title.css"  type="text/css" rel="stylesheet">
<link href="css/user/hotal.css"  type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/hotel/style.css">
<script type="text/javascript" src="js/hotel/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/hotel/jquery.hover3d.js" ></script>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;color:#5e5e5e;text-decoration:none;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
*html,*html body{background-image:url(about:blank);background-attachment:fixed;}
/* fixediv */
.fixediv{position:fixed;top:300px;z-index:9999;height:216px;width:100px;}
*html .fixediv{position:absolute;top:expression(eval(document.documentElement.scrollTop));margin:140px 0 0 0;}
.fixediv-l{left:0px;}
.fixediv-r{right:0px;}
.fixediv .btn{height:40px;background:#CCCCCC;text-align:right;line-height:25px;overflow:hidden;}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IsUMwYn6q9xRk8hIFfRhsh0pW25iMoxo"></script>
<link href="css/user/hotel.css"  type="text/css" rel="stylesheet">
<%-- <!-- bottom -->

 <!--  <link rel="stylesheet icon" type="text/css" href="favicon.ico" /> -->
    <!-- 引用css初始化文件 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/normalize.css" />
    <!-- 头部和底部 结构基本相同 基本的公共样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" /> --%>
</head>
<body>
<div>
<div class="title">
	<div >
	<c:choose>
		<c:when test="${not empty sessionScope.loginUser }">
			<a href="#">${loginUser.userName }</a>&nbsp;&nbsp;&nbsp;
			<a href="loginOff.do">退出</a>
		</c:when>
		<c:otherwise>
			<a href="showLogin" style="color:white;">登录注册</a>
		</c:otherwise>
	</c:choose>	
	</div>
	<nav>
	  <ul>
	    <li ><a href="javascript:void(0);" name="home" class="go">首页</a></li>
	    <li><a href="javascript:void(0);" name="scenic" class="go">逛景点</a></li>
	    <li class="active"><a href="javascript:void(0);" name="hotel" class="go">住酒店</a></li>
	    <li ><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    <li ><a href="javascript:void(0);" name="recommend" class="go">我要推荐</a></li>
	    
	  </ul>
	</nav>
</div>
	<div class="head"></div>
	<div style="width:900px;height:50px;margin:0 auto;margin-top:20px;text-align:center;">
		<div style="width:800px;margin:0 auto;">
		<form role="form" action="findHotelBySearch.do" method="POST">
			<select id="findType" name="findType" class="form-control" style="width:100px;display:inline-block;margin-right:20px;">
				<option value="city">城市</option>
				<option value="scenicname">景区</option>
			</select>
  		<!-- <div class="form-group"> -->
    		<input type="text" id="findName" name="findName" class="form-control" placeholder="酒店查询" style="width:240px;display:inline-block;margin-right:20px;">
    		<input type="hidden" id="thisPage"name="thisPage" value="1">
    		<button type="submit" class="btn btn-default">查询</button>
 		 <!-- </div> -->			
		</form>
 		 </div>
 		
	</div>
	<div style="width:1200px;height:800px; margin:0 auto;padding-top:20px;margin-left:160px;">
			<div style="width:1200px;height:800px;">
			<!-- 热门景点 -->
				<div style="height:600px;">
				<div style="width:1100px;height:60px;text-align:center;">
					<!-- <a href="#" style="color:orange;"><div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;">景点</div></a>
					<div style="float:left;width:780px;height:60px;"></div> -->
					<h3>城市热门酒店</h3>
				</div>
				<div style="clear:both;"></div>
				<div style="width:1200px;margin-top:20px;">
				
					<div class="project-list">
						<div class="project" style="width:320px;height:320px;">
							<div class="project__card" >
								<a href="findHotelBySearch.do?findType=city&findName=苏州&thisPage=1" class="project__image"><img
									src="img/hotel/苏州.jpg" width=220 height=250 alt=""></a>
								<div class="project__detail">
									<h2 class="project__title">
										<a href="findHotelBySearch.do?findType=city&findName=苏州">苏州</a>	
									</h2>
									<small class="project__category"><a href="#">Photography</a></small>
								</div>
							</div>
						</div>

						<div class="project" style="width:320px;height:320px;">
							<div class="project__card">
								<a href="findHotelBySearch.do?findType=city&findName=上海&thisPage=1" class="project__image"><img src="img/hotel/上海.jpg"
									width=220 height=250 alt=""></a>
								<div class="project__detail">
									<h2 class="project__title">
										<a href="#">上海</a>
									</h2>
									<small class="project__category"><a href="#">Photography</a></small>
								</div>
							</div>
						</div>
						<div class="project" style="width:320px;height:320px;">
							<div class="project__card">
								<a href="findHotelBySearch.do?findType=city&findName=杭州&thisPage=1" class="project__image"><img src="img/hotel/杭州.jpg"
									width=220 height=250 alt=""></a>
								<div class="project__detail">
									<h2 class="project__title">
										<a href="#">杭州</a>
									</h2>
									<small class="project__category"><a href="#">Photography</a></small>
								</div>
							</div>
						</div>
						
						<div class="project" style="width:320px;height:320px;">
							<div class="project__card">
								<a href="findHotelBySearch.do?findType=city&findName=北京&thisPage=1" class="project__image"><img
									src="img/hotel/北京.jpg" width=220 height=250 alt=""></a>
								<div class="project__detail">
									<h2 class="project__title">
										<a href="#">北京</a>	
									</h2>
									<small class="project__category"><a href="#">Photography</a></small>
								</div>
							</div>
						</div>

						<div class="project" style="width:320px;height:320px;">
							<div class="project__card">
								<a href="findHotelBySearch.do?findType=city&findName=天津&thisPage=1" class="project__image"><img src="img/hotel/天津.jpg"
									width=220 height=250 alt=""></a>
								<div class="project__detail">
									<h2 class="project__title">
										<a href="#">天津</a>
									</h2>
									<small class="project__category"><a href="#">Photography</a></small>
								</div>
							</div>
						</div>
						<div class="project" style="width:320px;height:320px;">
							<div class="project__card">
								<a href="findHotelBySearch.do?findType=city&findName=三亚&thisPage=1" class="project__image"><img src="img/hotel/三亚.jpg"
									width=220 height=250 alt=""></a>
								<div class="project__detail">
									<h2 class="project__title">
										<a href="#">三亚</a>
									</h2>
									<small class="project__category"><a href="#">Photography</a></small>
								</div>
							</div>
						</div>
					</div>				
				</div>
				</div>
				
			
				
			</div>
		</div>
</div>
	 <div style="height: 200px;" class="bottom">
		<jsp:include page="bottom.jsp"></jsp:include>
	</div> 
</body>
</html>

<script>
	$(".go").click(function(){
		var name = $(this).attr("name");
		if(name=="way"){
			window.setTimeout("window.location.href='userPage.do?index=way'", 500);
		}
		else if(name=="hotel"){
			window.setTimeout("window.location.href='userPage.do?index=hotel'", 500);
		}
		else if(name=="scenic"){
			window.setTimeout("window.location.href='userPage.do?index=scenic'", 500);
		}
		else if(name=="recommend"){
			window.setTimeout("window.location.href='userPage.do?index=recommend'", 500);
		}
		else{
			window.setTimeout("window.location.href='userPage.do?index=home'", 500);
		}
	})
</script>
<script>
var nav = $('nav');
var line = $('<div />').addClass('line');

line.appendTo(nav);

var active = nav.find('.active');
var pos = 0;
var wid = 0;

if(active.length) {
  pos = active.position().left;
  wid = active.width();
  line.css({
    left: pos,
    width: wid
  });
}

nav.find('ul li a').click(function(e) {
  if(!$(this).parent().hasClass('active')) {
    e.preventDefault();

    var _this = $(this);

    nav.find('ul li').removeClass('active');

    var position = _this.parent().position();
    var width = _this.parent().width();

    if(position.left >= pos) {
      line.animate({
        width: ((position.left - pos) + width)
      }, 300, function() {
        line.animate({
          width: width,
          left: position.left
        }, 150);
        _this.parent().addClass('active');
      });
    } else {
      line.animate({
        left: position.left,
        width: ((pos - position.left) + wid)
      }, 300, function() {
        line.animate({
          width: width
        }, 150);
        _this.parent().addClass('active');
      });
    }

    pos = position.left;
    wid = width;
  }
});
</script>
