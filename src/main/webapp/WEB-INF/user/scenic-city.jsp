<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>景点</title>
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
<link href="css/user/title.css"  type="text/css" rel="stylesheet">

<!-- bottom -->
<%-- <!-- 引用css初始化文件 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/normalize.css" /> --%>
<!-- 头部和底部 结构基本相同 基本的公共样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" />
<link href="css/user/picture.css" type="text/css" rel="stylesheet">
<link href="css/user/scenic.css"  type="text/css" rel="stylesheet">

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
			<a href="showLogin">登录注册</a>
		</c:otherwise>
	</c:choose>	
	</div>
	<nav>
	  <ul>
	    <li ><a href="javascript:void(0);" name="home" class="go">首页</a></li>
	    <li class="active"><a href="javascript:void(0);" name="scenic" class="go">逛景点</a></li>
	    <li ><a href="javascript:void(0);" name="hotel" class="go">住酒店</a></li>
	    <li ><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    <li ><a href="javascript:void(0);" name="recommend" class="go">我要推荐</a></li>

	  </ul>
	</nav>
</div>
	<div class="head"></div>
	<div class="contain1">
		<div style="width:1100px;height:60px; margin-left:10px;">
			<div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;color:orange;">${city }</div>
			<div style="float:left;width:780px;height:60px;"></div>
		</div>
			<div style="clear:both;"></div>
		<br><br>
		<c:forEach var="scenic" items="${scenicList }" varStatus="status">
			<%-- <c:if test="${(status.index+1)%3==0}">
				<div ></div>
			</c:if> --%>
			<div style=" margin-left:15px; height:300px;width:345px;float:left;">				
				<div class="box">
					<img src="img/scenic/city/${scenic.picture }" alt="" style="object-fit: cover; width:100%;height:80%;">
					<div class="box-content">
						<div class="content">
							<h3 class="title2">${scenic.scenicName }</h3>
							<span class="post">${scenic.address }</span>
							<ul class="icon">
								<li><a href="findHotelBySearch.do?findType=scenicname&findName=${scenic.scenicName}&thisPage=1" ><b style="font-size:10px;">酒店</b></a></li>
								<li><a href="scenicDetail.do?scenicId=${scenic.scenicId }"><b style="font-size:10px;">详情</b></a></li>
								<li><a href="findRoute.do?address=${scenic.scenicName}"><b style="font-size:10px;">路线</b></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div style="margin:5px 0 0 0;"><a style="font-size: 15px;" href="scenicDetail.do?scenicId=${scenic.scenicId }">${scenic.scenicName }</a></div>
			</div>
			
			<%-- <c:if test="${(status.index+1)%3==0||(status.index+1)==total}">
				<div style="clear:both;"></div>
				</div >
			</c:if> --%>
		</c:forEach>
	</div>
	<div style="height:50px;background-color:white;magin:10px 0 0 0;display:flex;align-items:center;justify-content:center;" class="page">
	<c:forEach begin="1" end="${totalPage }" step="1" var="i" >
		<c:choose>
			<c:when test="${thisPage==i }">
				<div class="scenicPage2" onclick="javascript:location.href='cityPage.do?city=${city }&thisPage=${i }'">${i }</div>
			</c:when>
			<c:otherwise>
				<div class="scenicPage" onclick="javascript:location.href='cityPage.do?city=${city }&thisPage=${i }'">${i }</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	 </div>
	<div style="clear:both;"></div>
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
});</script>