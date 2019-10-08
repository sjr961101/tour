<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>

<!--Include flickerplate-->

<link href="css/user/title.css"  type="text/css" rel="stylesheet">
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
<script src="js/modernizr-custom-v2.7.1.min.js" type="text/javascript"></script>
<script src="js/jquery-finger-v0.1.0.min.js" type="text/javascript"></script>
<script src="js/flickerplate.min.js" type="text/javascript"></script>
<link href="css/flickerplate.css"  type="text/css" rel="stylesheet">

<!-- bottom -->
<!--  <link rel="stylesheet icon" type="text/css" href="favicon.ico" /> -->
<!-- 引用css初始化文件 -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/normalize.css" />
 --%><!-- 头部和底部 结构基本相同 基本的公共样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" />
<!--Execute flickerplate-->
<script>
$(document).ready(function(){
	$('.flicker-example').flicker();
});
</script>


</head>
<body>
<div style="background-color:black;height:1500px;">
<div class="title">
	<div >
	<c:choose>
		<c:when test="${not empty sessionScope.loginUser }">
			<a href="#">${loginUser.userName }</a>&nbsp;&nbsp;&nbsp;
			<a href="loginOff">退出</a>
		</c:when>
		<c:otherwise>
			<a href="showLogin">登录</a>
		</c:otherwise>
	</c:choose>	
	</div>
	<nav>
	  <ul>
	    <li class="active"><a href="javascript:void(0);" name="home" class="go">首页</a></li>
	    <li><a href="javascript:void(0);" name="scenic" class="go">逛景点</a></li>
	    <li><a href="javascript:void(0);" name="hotel" class="go">住酒店</a></li>
	    <li><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    
	  </ul>
	</nav>
</div>
<div id="content" style="height:1500px;background-color:white;">
		<div class="flicker-example" data-block-text="false">
			<ul>
				<li data-background="img/head/head-1.jpg">
					<div class="flick-sub-text" style="text-align:right;margin:40px 0 0 0;">有的人只会放假，有的人懂得放下</div>
					<div class="flick-sub-text" style="text-align:right;">路上有斑马线，不如有斑马</div>
					<div class="flick-sub-text" style="text-align:right;">想尝鲜 ，不进卖场，只上农场</div>
					<div class="flick-sub-text" style="text-align:right;">摆脱空气清新剂，只去空气清新地</div>
					<div class="flick-sub-text" style="text-align:right;">高级雅座不在地图上</div>
					<div class="flick-sub-text" style="text-align:right;">只在地球上</div>
				</li>
				<li data-background="img/head/forest.jpg" >
					<div class="flick-title">If you don't go out, you think this is the world.</div>
					<div class="flick-sub-text">Dealing with the web and documents every day This time, make friends with the gull from Siberia</div>
				</li>
				<li data-background="img/head/frozen-water.jpg">
					<div class="flick-sub-text" style="text-align:right; margin:80px 0 0 0;">当你下定决心准备出发时，</div>
					<div class="flick-sub-text" style="text-align:right;">最困难的时刻就已经过去了。</div>
					<div class="flick-sub-text" style="text-align:right;">那么，出发吧。</div>
				</li>
				<li data-background="img/head/frozen-water.jpg">
					<div class="flick-sub-text" style="text-align:right; margin:80px 0 0 0;">当你下定决心准备出发时，</div>
					<div class="flick-sub-text" style="text-align:right;">最困难的时刻就已经过去了。</div>
					<div class="flick-sub-text" style="text-align:right;">那么，出发吧。</div>
				</li>
			</ul>
		</div>
		<div style="width:1200px;height:800px; margin:0 auto;padding-top:40px;">
			<div style="width:1200px;height:800px;">
				
				<div style="height:380px;">
				<div style="width:1100px;height:60px;">
					<a href="#" style="color:orange;"><div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;">热门景点</div></a>
					<div style="float:left;width:780px;height:60px;"></div>
					
				</div>
				<div style="clear:both;"></div>
				<div style="width:1200px;margin-top:50px;">
					<div style="width:1200px;">
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/scenic/city/外滩.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:263px;height:25px;background-color:rgba(0,0,0,0.5);"><a href="scenicDetail.do?scenicId=132">外滩</a></div>
							</div>
							<div style="height:20px;"><a href="scenicDetail.do?scenicId=132" style="color:black;">外滩</a></div>
						</div>
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/scenic/city/八达岭长城.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:263px;height:25px;background-color:rgba(0,0,0,0.5);"><a href="scenicDetail.do?scenicId=161">八达岭长城</a></div>
							</div>
							<div style="height:20px;"><a href="scenicDetail.do?scenicId=161" style="color:black;">八达岭长城</a></div>
						</div>
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/scenic/city/天涯海角游览区.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:263px;height:25px;background-color:rgba(0,0,0,0.5);"><a href="scenicDetail.do?scenicId=208">天涯海角</a></div>
							</div>
							<div style="height:20px;"><a href="scenicDetail.do?scenicId=208" style="color:black;">天涯海角</a></div>
						</div>
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/scenic/city/世外桃源.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:263px;height:25px;background-color:rgba(0,0,0,0.5);"><a href="scenicDetail.do?scenicId=360">世外桃源</a></div>
							</div>
							<div style="height:20px;"><a href="scenicDetail.do?scenicId=161" style="color:black;">世外桃源</a></div>
						</div>
					</div>
				</div>
				</div>
				
				<!-- 酒店推荐 -->
				<div style="width:1100px;height:60px;">
					<a href="#" style="color:orange;"><div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;">酒店推荐</div></a>
					<div style="float:left;width:780px;height:60px;"></div>
					
				</div>
				<div style="clear:both;"></div>
				<div style="width:1200px;margin-top:50px;">
					<div style="width:1200px;">
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/hotel/常熟沙家浜芸海阁酒店.jpg" width="240" height="200"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:240px;height:25px;background-color:rgba(0,0,0,0.5);"><a href="">常熟沙家浜芸海阁酒店</a></div>
							</div>
							<div style="height:20px;"><a href="findRoute.do?address=常熟沙家浜芸海阁酒店" style="color:black;">常熟沙家浜芸海阁酒店</a></div>
						</div>
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/hotel/秋雪楼.jpg" width="240" height="200"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:240px;height:25px;background-color:rgba(0,0,0,0.5);"><a href="">秋雪楼</a></div>
							</div>
							<div style="height:20px;"><a href="findRoute.do?address=秋雪楼" style="color:black;">秋雪楼</a></div>
						</div>
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/hotel/芦逸度假酒店.jpg" width="240" height="200"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:240px;height:25px;background-color:rgba(0,0,0,0.5);"><a href="">芦逸度假酒店</a></div>
							</div>
							<div style="height:20px;"><a href="findRoute.do?address=芦逸度假酒店" style="color:black;">芦逸度假酒店</a></div>
						</div>
						<div style="float:left;width:240px;height:240px;padding:10px;margin-left:10px;cursor:pointer;">
							<div><img src="img/hotel/芦荡人家.jpg" width="240" height="200"/>
								<div style="color:white;position:relative;top:-25px;left:0px;width:240px;height:25px;background-color:rgba(0,0,0,0.5);">芦荡人家</div>
							</div>
							<div style="height:20px;"><a href="findRoute.do?address=芦荡人家" style="color:black;">芦荡人家</a></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	</div>
	 <div class="bottom" style="height:126px;">
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