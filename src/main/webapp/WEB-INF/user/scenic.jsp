<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>逛景点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="css/user/title.css"  type="text/css" rel="stylesheet">
<link href="css/user/scenic.css"  type="text/css" rel="stylesheet">
<!-- bottom -->
 <!--  <link rel="stylesheet icon" type="text/css" href="favicon.ico" /> -->
<!-- 引用css初始化文件 -->
<!-- 头部和底部 结构基本相同 基本的公共样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IsUMwYn6q9xRk8hIFfRhsh0pW25iMoxo"></script>
<!-- 广告 -->
<style type="text/css">
/* fixediv */
.fixediv{position:fixed;top:400px;z-index:9999;height:216px;width:100px;}
*html .fixediv{position:absolute;top:expression(eval(document.documentElement.scrollTop));margin:140px 0 0 0;}
.fixediv-l{left:0px;}
.fixediv-r{right:0px;}
.fixediv .btn2{height:40px;background:#CCCCCC;text-align:right;line-height:25px;overflow:hidden;}
</style>
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
	    <li class="active"><a href="javascript:void(0);" name="scenic" class="go">逛景点</a></li>
	    <li ><a href="javascript:void(0);" name="hotel" class="go">住酒店</a></li>
	    <li ><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    <li ><a href="javascript:void(0);" name="recommend" class="go">我要推荐</a></li>

	  </ul>
	</nav>
</div>

	<div class="head"></div>
	
		
	<div class="check">
		<div style="width:1100px;height:60px; margin-left:10px;">
			<a href="#" style="color:orange;">
				<div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;">景点搜索</div>
			</a>
			<div style="float:left;width:780px;height:60px;"></div>
		</div>
		<div style="clear:both;"></div>
		<div style="height:50px; margin:10px 0 0 10px;">
		
			<form>
				省份:<select class="form-control" style="width:200px;display:inline-block;margin-left:10px;" onchange="choose(this.options[this.options.selectedIndex].value)">
				<option value="0">--请选择省份--</option>
					<c:forEach var="list" items="${scenicList }">
						<option value="${list.province }">${list.province }</option>
					</c:forEach>
				</select>
			</form>
		</div>
		&nbsp;&nbsp;城市:&nbsp;&nbsp;
		<div class="citys">
			
		</div>
		<div style="clear:both;"></div>
		
		<div style="width:1100px;height:60px; margin-left:10px;">
			<a href="#" style="color:orange;">
				<div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;">热门景点</div>
			</a>
			<div style="float:left;width:780px;height:60px;"></div>
		</div>
		<div style="clear:both;"></div>
		<div style="width:1000px;height:800px; margin:0 auto;padding-top:20px;">
			<div style="width:1000px;height:800px;">
			<!-- 热门景点 -->
				<div style="height:600px;">
				<div style="width:1000px;height:60px;text-align:center;">
					<!-- <a href="#" style="color:orange;"><div style="float:left;text-align:center;width:120px;height:60px;line-height:60px;border-bottom:3px solid orange;color:orange;font-size:18px;">景点</div></a>
					<div style="float:left;width:780px;height:60px;"></div> -->
					<h3>世界那么大快去逛逛啊~</h3>
				</div>
				<div style="clear:both;"></div>
				<div style="width:1000px;margin-top:20px;">
					<div style="width:1000px;height:260px;" >
						<div style="float:left;width:280px;height:260px;padding:10px;margin-left:20px;cursor:pointer;" 
						 onclick="javascript:location.href='scenicDetail.do?scenicId=132'">
							<div><img src="img/scenic/city/外滩.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<!-- 	城市名称 -->
								<div style="height:20px;color:white;position:relative;top:-30px;left:20px;">外滩</div>
							</div>
							
						</div>
						<div style="float:left;width:280px;height:260px;padding:10px;margin-left:20px;cursor:pointer;" 
						 onclick="javascript:location.href='scenicDetail.do?scenicId=161'">
							<div><img src="img/scenic/city/八达岭长城.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<!-- 	城市名称 -->
								<div style="height:20px;color:white;position:relative;top:-30px;left:20px;">八达岭长城</div>
							</div>
							
						</div>
						<div style="float:left;width:280px;height:260px;padding:10px;margin-left:20px;cursor:pointer;"
						 onclick="javascript:location.href='scenicDetail.do?scenicId=208'">
							<div><img src="img/scenic/city/天涯海角游览区.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<!-- 	城市名称 -->
								<div style="height:20px;color:white;position:relative;top:-30px;left:20px;">天涯海角</div>
							</div>
							
						</div>
						<div style="float:left;width:280px;height:260px;padding:10px;margin-left:20px;cursor:pointer;"
						 onclick="javascript:location.href='scenicDetail.do?scenicId=360'">
							<div><img src="img/scenic/city/世外桃源.jpg" style="object-fit: cover; width:110%;height:80%;"/>
								<!-- 	城市名称 -->
								<div style="height:20px;color:white;position:relative;top:-30px;left:20px;">世外桃源</div>
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

	function choose(v){
		$(".citys").html("");
		if(v!=0){
			$.ajax({
				url:"findCity.do",
				type:"POST",
				data:{"pro":v},
				dataType:'json',
				success:function(date){
					var json = eval(date);
					$.each(json,function(index,item){
						
						$(".citys").append("<div onmouseover=\"this.style.cssText='	cursor:pointer;background-color:#93B16F;color:white;float:left; margin-left:20px; border-radius: 4px; padding:3px;'\" onmouseout=\"this.style.cssText='color:white;float:left; margin-left:20px; border-radius: 4px; background-color:#F0AD4E;padding:3px;'\" style='color:white;float:left; margin-left:20px; border-radius: 4px; background-color:#F0AD4E;padding:3px;' onclick='fun(this)'>"
						+json[index].city+"</div>");
					})
				}
			});
		}
	}
	function fun(e){
		var c = $(e).html();
		window.location.href="cityPage.do?city="+c+"&thisPage=1";
	}
</script>
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

