<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我要推荐</title>
<script src="js/jquery-v1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<link href="css/user/title.css"  type="text/css" rel="stylesheet">
<link href="css/user/way.css"  type="text/css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/recommend/style.css" type="text/css" />
<link href="${pageContext.request.contextPath }/css/recommend/css.css" rel="stylesheet" type="text/css" />
<!-- bottom -->
    <!-- 引用css初始化文件 -->
 <!-- 头部和底部 结构基本相同 基本的公共样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bottom/base.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/recommend/jquery.js"></script>

<style type="text/css">
/* fixediv */
.fixediv{position:fixed;top:400px;z-index:9999;height:216px;width:100px;}
*html .fixediv{position:absolute;top:expression(eval(document.documentElement.scrollTop));margin:140px 0 0 0;}
.fixediv-l{left:0px;}
.fixediv-r{right:0px;} 
.fixediv .btn2{height:40px;background:#CCCCCC;text-align:right;line-height:25px;overflow:hidden;}
</style>
<style>
	.btn {
    background-color: #4CAF50; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 12px;
    margin: 4px 2px;
    cursor: pointer;
}
/* .text1{
	width:350px;
	height:30px;
	border-radius:5px;
} */
.reason{
	width:350px;
	height:100px;
	border-radius:5px;
}
.menu{

	width:260px;
	border:0px;
	margin:0 auto;
}
.select{
	width:100px;
	height:30px;
	border-radius:5px;
}
.error{
		color:red;
	}
</style>
</head>
<body>
	<div style="height:1100px;">
	<div class="title">
	<div >
	<c:choose>
		<c:when test="${not empty sessionScope.loginUser }">
			<a href="#">${loginUser.userName }</a>&nbsp;&nbsp;&nbsp;
			<a href="loginOff.do">退出</a>
		</c:when>
		<c:otherwise>
			<a href="showLogin">登录</a>
		</c:otherwise>
	</c:choose>	
	</div>
	<nav>
	  <ul>
	    <li ><a href="javascript:void(0);" name="home" class="go">首页</a></li>
	    <li><a href="javascript:void(0);" name="scenic" class="go">逛景点</a></li>
	    <li><a href="javascript:void(0);" name="hotel" class="go">住酒店</a></li>
	    <li ><a href="javascript:void(0);" name="way" class="go">找路线</a></li>
	    <li class="active"><a href="javascript:void(0);" name="recommend" class="go">我要推荐</a></li>
	   
	  </ul>
	</nav>
</div>
	<div class="head"></div>
	
	<div>
		<div class="teacherPic">

			<div class="content" id="sirendingzhi1">
				<div class="txt">
					<h3>新疆</h3>
					<h4>草场丰腴、林木葱郁，有着“塞外江南”的美称</h4>
					<p>
						发团日期：7-10月<br> 参考价格：5280元<br> 摄影器材: 单反 广角 中长焦 三脚架等
					</p>
				</div>
			</div>

			<div class="content" id="sirendingzhi2">
				<div class="txt">
					<h3>云南</h3>
					<h4>东川红土地的炫彩、高原明珠——抚仙湖的柔美</h4>
					<p>
						发团日期：7-11月<br> 参考价格：2780元<br> 摄影器材: 单反 广角 中长焦 三脚架等
					</p>
				</div>
			</div>

			<div class="content" id="sirendingzhi3">
				<div class="txt">
					<a href="#"><h3>贵州</h3></a>
					<h4>西江千户苗寨 以美丽回答一切</h4>
					<p>
						发团日期：7-12月<br> 参考价格：2680元<br> 摄影器材: 单反 广角 中长焦 三脚架等
					</p>
				</div>
			</div>

			<div class="content" id="sirendingzhi4">
				<div class="txt">
					<h3>色达</h3>
					<h4>地球上最后的一片净土，心灵净化之旅</h4>
					<p>
						发团日期：7-10月<br> 参考价格：3900元<br> 摄影器材: 单反 广角 中长焦 三脚架等
					</p>
				</div>
			</div>

			<div class="content" id="sirendingzhi5">
				<div class="txt">
					<h3>斯里兰卡</h3>
					<h4>印度洋上的一滴眼泪！</h4>
					<p>
						发团日期：6-12月<br> 参考价格：1250美金<br> 摄影器材: 单反 广角 中长焦 三脚架等
					</p>
				</div>
			</div>

		</div>
	</div>
	<div style="margin:0 auto;width:1100px;">
		
			<!-- 用户推荐	 -->
			<div id="content">
<div class="tab1" id="tab1">
	<div class="menu">
		<ul>
			<li id="one1" onclick="setTab('one',1)" style="border-left:0px;border-right:0px;cursor:pointer;">景点推荐</li>
			<li id="one2" onclick="setTab('one',2)" style="border-left:0px;border-right:0px;cursor:pointer;">酒店推荐</li>
			
		</ul>
	</div>
	
	<div class="menudiv" style="margin:0 auto;border-radius:5%;margin-top:10px; box-shadow:30%;">
		<div id="con_one_1">
        <div id="1"> 
      <form  action="scenicRecommand?userName=${loginUser.userName }" method="POST" enctype="multipart/form-data" onsubmit="return submitForm()">   
      <table width="500" height="400" border="0" cellpadding="0" cellspacing="0" align="center" >
	  <tr>
		<td width="142" align="right">景点名称：</td>
		<td width="352"><input type="text" id="usName" name="usName" placeholder="请输入景点名称" class="text1"  style="width:350px;height:30px;border-radius:5px;" value="" size="30" /><span id="nameError"  class="error"></span></td>
	  </tr>
	  <tr>
	  	 <td height="28" align="right">所在地：</td>
		<td>
		<form id="form1">
				<select id="selProvince" name="province" onChange = "getCity(this.options[this.selectedIndex].value,0)" class="select">
					<option value="">-请选择-</option>
					<option value="北京市">北京市</option>
					<option value="上海市">上海市</option>
					<option value="天津市">天津市</option>
					<option value="重庆市">重庆市</option>
					<option value="河北省">河北省</option>
					<option value="内蒙古">内蒙古</option>
					<option value="吉林省">吉林省</option>
					<option value="辽宁省">辽宁省</option>
					<option value="黑龙江">黑龙江</option>
					<option value="江苏省">江苏省</option>
					<option value="浙江省">浙江省</option>
					<option value="安徽省">安徽省</option>
					<option value="福建省">福建省</option>
					<option value="江西省">江西省</option>
					<option value="山东省">山东省</option>
					<option value="河南省">河南省</option>
					<option value="湖北省">湖北省</option>
					<option value="湖南省">湖南省</option>
					<option value="广东省">广东省</option>
					<option value="广西省">广西省</option>
					<option value="海南省">海南省</option>
					<option value="四川省">四川省</option>
					<option value="贵州省">贵州省</option>
					<option value="陕西省">陕西省</option>
					<option value="甘肃省">甘肃省</option>
					<option value="云南省">云南省</option>
					<option value="其它">其它</option>
				</select>
			
				<select id="selCity" name="city" class="select">
					<option>-城市-</option>
				</select><span id="cityError"  class="error"></span>
			</form>		
			</td>
	  </tr>
	  <tr>
		<td width="142" align="right">详细地址：</td>
		<td width="352"><input type="text" id="address" name="scenicAddress" placeholder="请输入景点地址"  style="width:200;height:40;border-radius:5px;" value="" size="30" /><span id="addressError"  class="error"></span></td>
	  </tr>
		<tr>
		<td height="30" align="right">推荐理由：</td>
		<td><textarea rows="8" cols="40" id="reason" name="reason" class="reason" style="overflow:auto;"/></textarea><span id="reasonError"  class="error"></span></td>
	  </tr>
	  <tr>
      		<td height="30" align="right">上传图片：</td>
		<td>
			<input type="file"  id="inputfile" name="myFile"><span id="fileError"  class="error"></span>
		 </td>
	  </tr>
      <tr>
      	<td colspan="2" style="text-align:center;">
      		<input type="submit" class="btn" value="提交">
      	</td>
      </tr> 
        
	  
	 </table>
	 </form>
	 </div>
        
        <div id="bc01"></div>
      </div>
		<div id="con_one_2" style="display:none;">
               <div id="1">   
               
        <form  action="hotelRecommand1?userName=${loginUser.userName }" method="POST" enctype="multipart/form-data">      
        <table width="500"  height="400" border="0" cellpadding="0" cellspacing="0" align="center" >
	  <tr>
		<td width="142" align="right">酒店名称：</td>
		<td width="352"><input type="text" placeholder="请输入酒店名称"  class="text1"  id="hotelName" name="hotelName" style="width:200;height:40;border-radius:5px;" value="" size="30" /></td>
	  </tr>
		 <tr>
	  	 <td height="28" align="right">所在地：</td>
		<td>
		<form id="form2">
				<!-- <select id="selProvince1" name="province" onChange = "getCity(this.options[this.selectedIndex].value,1)" class="select"> -->
				<select id="selProvince1" name="province" onchange="chooseCity(this.options[this.options.selectedIndex].value)" class="select">
					<option value="0">-请选择-</option>
					<option value="北京市">北京市</option>
					<option value="上海市">上海市</option>
					<option value="天津市">天津市</option>
					<option value="重庆市">重庆市</option>
					<option value="河北省">河北省</option>
					<option value="内蒙古">内蒙古</option>
					<option value="吉林省">吉林省</option>
					<option value="辽宁省">辽宁省</option>
					<option value="黑龙江">黑龙江</option>
					<option value="江苏省">江苏省</option>
					<option value="浙江省">浙江省</option>
					<option value="安徽省">安徽省</option>
					<option value="福建省">福建省</option>
					<option value="江西省">江西省</option>
					<option value="山东省">山东省</option>
					<option value="河南省">河南省</option>
					<option value="湖北省">湖北省</option>
					<option value="湖南省">湖南省</option>
					<option value="广东省">广东省</option>
					<option value="广西省">广西省</option>
					<option value="海南省">海南省</option>
					<option value="四川省">四川省</option>
					<option value="贵州省">贵州省</option>
					<option value="陕西省">陕西省</option>
					<option value="甘肃省">甘肃省</option>
					<option value="云南省">云南省</option>
					<option value="其它">其它</option>
				</select>
			
				<select id="City1" name="City1" class="select"  onchange="chooseScenic(this.options[this.options.selectedIndex].value)">
					<option>-城市-</option>
				</select>
				<select id="scenicId" name="scenicId" class="select">
					<option value="0">-景点-</option>	
				</select>
			</form>		
			</td>
	  </tr>
	  <tr>
		<td width="142" align="right" >详细地址：</td>
		<td width="352"><input type="text" id="hotelAddress" name="hotelAddress" placeholder="请输入酒店地址" class="text"  style="width:200;height:40;" value="" size="30" /></td>
	  </tr>
		<tr>
		<td height="30" align="right">推荐理由：</td>
		<td><textarea rows="8" cols="40" id="teason1" name="reason"  class="reason" style="overflow:auto;"/></textarea>
	  </tr>
	  <tr>
      		<td height="30" align="right">上传图片：</td>
		<td>
			<input type="file" name="myFile1">
		 </td>
	  </tr>
      <tr>
      	<td colspan="2" style="text-align:center;">
      		<input type="submit" class="btn" value="提交">
      	</td>
      </tr>  
        
	  
	 </table>
	 </form>
	 </div>
               <div id="bc01"></div>
      </div> 
        
		
	</div>
</div>
</div>
	</div>
	</div>
		 <div style="height: 200px;" class="bottom">
			<jsp:include page="bottom.jsp"></jsp:include>
		</div> 

<script  type="text/javascript">
	var usName=document.getElementById("usName");
	var city=document.getElementById("selCity")
	var address=document.getElementById("address")
	var reason=document.getElementById("reason")
	var inputFile=document.getElementById("inputfile")
	
	var nameError=document.getElementById("nameError")
	var cityError=document.getElementById("cityError")
	var addressError=document.getElementById("addressError")
	var reasonError=document.getElementById("reasonError")
	var fileError=document.getElementById("fileError")
	function submitForm(){
		nameError.innerText="";
		cityError.innerText="";
		addressError.innerText="";
		reasonError.innerText="";
		fileError.innerText="";
		
		if(usName.value==""){
			nameError.innerText="请填写推荐信息名称";
			usName.focus();
			return false;
		}
		if(city.value==""){
			cityError.innerText="请选择城市";
			city.focus();
			return false;
		}
		if(address.value==""){
			addressError.innerText="请填写推荐信息地址";
			address.focus();
			return false;
		}
		if(reason.value==""){
			reasonError.innerText="请填写推荐原因";
			reason.focus();
			return false;
		}
		if(inputFile.value==""){
			fileError.innerText="请选择图片";
			inputFile.focus();
			return false;
		}
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

<script type="text/javascript">
$(".content") .hover(function(){
	$(this) .children(".txt").stop() .animate({height:"360px"},200);
	$(this) .parent(".teacherPic") .css({"background":"url(${pageContext.request.contextPath }/img/recommend/"+($(this).attr('id'))+".jpg) no-repeat","-webkit-transition":"all 0.8s ease 0.2s","transition":"all 0.8s ease 0.2s"});
/*			$(this) .parent(".teacherPic") .css("background","url(images/"+($(this).attr('id'))+".jpg) no-repeat");*/
	$(this) .find(".txt h3").stop() .animate({paddingTop:"130"},550);
	$(this) .find(".txt p").stop() .show();
},function(){
	$(this) .children(".txt").stop() .animate({height:"100px"},200);
	$(this) .find(".txt h3").stop().animate({paddingTop:"0px"},550);
	$(this) .find(".txt p").stop() .hide();
})
</script>
<script>
function setTab(name,cursel){
	cursel_0=cursel;
	for(var i=1; i<=links_len; i++){
		var menu = document.getElementById(name+i);
		var menudiv = document.getElementById("con_"+name+"_"+i);
		if(i==cursel){
			menu.className="off";
			menudiv.style.display="block";
		}
		else{
			menu.className="";
			menudiv.style.display="none";
		}
	}
}
function Next(){                                                        
	cursel_0++;
	if (cursel_0>links_len)cursel_0=1
	setTab(name_0,cursel_0);
} 
var name_0='one';
var cursel_0=1;
//循环周期，可任意更改（毫秒）
var links_len,iIntervalId;
onload=function(){
	var links = document.getElementById("tab1").getElementsByTagName('li')
	links_len=links.length;
	for(var i=0; i<links_len; i++){
		links[i].onmouseover=function(){
			clearInterval(iIntervalId);
			this.onmouseout=function(){
				iIntervalId = setInterval(Next,ScrollTime);;
			}
		}
	}
	document.getElementById("con_"+name_0+"_"+links_len).parentNode.onmouseover=function(){
		clearInterval(iIntervalId);
		this.onmouseout=function(){
			iIntervalId = setInterval(Next,ScrollTime);;
		}
	}
	setTab(name_0,cursel_0);
	iIntervalId = setInterval(Next,ScrollTime);
}
</script>
<script language="javascript" type="text/javascript">
         //定义 城市 数据数组
        cityArray = new Array(); 
        cityArray[0] = new Array("北京市","东城区|西城区|朝阳区|海淀区|丰台区|石景山区|房山区|通州区|顺义区|大兴区|昌平区|平谷区|怀柔区|门头沟区|密云县|延庆县"); 
        cityArray[1] = new Array("上海市"," 黄浦区|卢湾区|徐汇区|长宁区|静安区|普陀区|闸北区|虹口区|杨浦区|宝山区|闵行区|嘉定区|浦东新区|松江区|金山区|青浦区|南汇区|奉贤区");
        cityArray[2] = new Array("天津市","和平区|河西区|河东区|河北区|南开区|红桥区|东丽区|西青区|北辰区|津南区|塘沽区|大港区|汉沽区"); 
		cityArray[3] = new Array("重庆市","渝中区|大渡口区|江北区|沙坪坝区|九龙坡区|南岸区|北碚区|綦江区|双桥区|渝北区|巴南区|万州区|涪陵区|黔江区|长寿区|江津区|合川区|永川区|南川区");
		cityArray[4] = new Array("河北省","石家庄|唐山|秦皇岛|邯郸|邢台|保定|张家口|承德|沧州|廊坊|衡水");
		cityArray[5] = new Array("山西省","太原|大同|阳泉|长治|晋城|朔州|晋中|运城|忻州|临汾|吕梁");
		cityArray[6] = new Array("内蒙古","呼和浩特|包头|乌海|赤峰|通辽|鄂尔多斯|呼伦贝尔|巴彦淖尔|乌兰察布|兴安|锡林郭勒|阿拉善");
		cityArray[7] = new Array("辽宁省","沈阳|大连|鞍山|抚顺|本溪|丹东|锦州|营口|阜新|辽阳|盘锦|铁岭|朝阳|葫芦岛");
		cityArray[8] = new Array("吉林省","长春|吉林|四平|辽源|通化|白山|松原|白城|延边");
		cityArray[9] = new Array("黑龙江","哈尔滨|齐齐哈尔|鸡西|鹤岗|双鸭山|大庆|伊春|佳木斯|七台河|牡丹江|黑河|绥化|大兴安岭");
		cityArray[10] = new Array("江苏省","南京|无锡|徐州|常州|苏州|南通|连云港|淮安|盐城|扬州|镇江|泰州|宿迁");
		cityArray[11] = new Array("浙江省","杭州|宁波|温州|嘉兴|湖州|绍兴|金华|衢州|舟山|台州|丽水");
		cityArray[12] = new Array("安徽省","合肥|芜湖|蚌埠|淮南|马鞍山|淮北|铜陵|安庆|黄山|滁州|阜阳|宿州|巢湖|六安|亳州|池州|宣城");
		cityArray[13] = new Array("福建省","福州|厦门|莆田|三明|泉州|漳州|南平|龙岩|宁德");
		cityArray[14] = new Array("江西省","南昌|景德镇|萍乡|九江|新余|鹰潭|赣州|吉安|宜春|抚州|上饶");
		cityArray[15] = new Array("山东省","济南|青岛|淄博|枣庄|东营|烟台|潍坊|威海|济宁|泰安|日照|莱芜|临沂|德州|聊城|滨州|菏泽");
		cityArray[16] = new Array("河南省","郑州|开封|洛阳|平顶山|安阳|鹤壁|新乡|焦作|濮阳|许昌|漯河|三门峡|南阳|商丘|信阳|周口|驻马店|济源");
		cityArray[17] = new Array("湖北省","武汉|黄石|襄樊|十堰|荆州|宜昌|荆门|鄂州|孝感|黄冈|咸宁|随州|恩施");
		cityArray[18] = new Array("湖南省","长沙|株洲|湘潭|衡阳|邵阳|岳阳|常德|张家界|益阳|郴州|永州|怀化|娄底|湘西");
		cityArray[19] = new Array("广东省","广州|深圳|珠海|汕头|韶关|佛山|江门|湛江|茂名|肇庆|惠州|梅州|汕尾|河源|阳江|清远|东莞|中山|潮州|揭阳云浮");
		cityArray[20] = new Array("广西省","南宁|柳州|桂林|梧州|北海|防城港|钦州|贵港|玉林|百色|贺州|河池|来宾|崇左");
		cityArray[21] = new Array("海南省","海口|三亚");
		cityArray[22] = new Array("四川省","成都|自贡|攀枝花|泸州|德阳|绵阳|广元|遂宁|内江|乐山|南充|宜宾|广安|达州|眉山|雅安|巴中|资阳|阿坝|甘孜凉山");
		cityArray[23] = new Array("贵州省","贵阳|六盘水|遵义|安顺|铜仁|毕节|黔西南|黔东南|黔南");
		cityArray[24] = new Array("陕西省","西安|铜川|宝鸡|咸阳|渭南|延安|汉中|榆林|安康|商洛");
		cityArray[25] = new Array("甘肃省","兰州|嘉峪关|金昌|白银|天水|武威|张掖|平凉");
		cityArray[26] = new Array("云南省","昆明市|大理市|曲靖市|玉溪市|昭通市|楚雄市|红河市|文山市|思茅市|西双版纳市|保山市|德宏市|丽江市|怒江市|迪庆市|临沧市");
		cityArray[27] = new Array("其它","其它");    

        function getCity(currProvince,flag)
        {
            //当前 所选择 的 省
            var currProvince = currProvince;
            var i,j,k;
 			if(flag==0){
 			    //清空 城市 下拉选单
 	            document.all.selCity.length = 0 ; 
 	           
 	            for (i = 0 ;i <cityArray.length;i++)
 	              {   
 	                  //得到 当前省 在 城市数组中的位置
 	                  if(cityArray[i][0]==currProvince)
 	                    {   
 	                        //得到 当前省 所辖制的 地市
 	                        tmpcityArray = cityArray[i][1].split("|")
 	                          for(j=0;j<tmpcityArray.length;j++)
 	                          {
 	                            //填充 城市 下拉选单
 	                            document.all.selCity.options[document.all.selCity.length] = new Option(tmpcityArray[j],tmpcityArray[j]); 
 	                          }
 	                    } 
 	              } 
            }
 			else{
 				//清空 城市 下拉选单
 	            document.all.selCity1.length = 0 ; 
 	           for (i = 0 ;i <cityArray.length;i++)
 	            {   
 	                //得到 当前省 在 城市数组中的位置
 	                if(cityArray[i][0]==currProvince)
 	                  {   
 	                      //得到 当前省 所辖制的 地市
 	                      tmpcityArray = cityArray[i][1].split("|")
 	                        for(j=0;j<tmpcityArray.length;j++)
 	                        {
 	                          //填充 城市 下拉选单
 	                          document.all.selCity1.options[document.all.selCity1.length] = new Option(tmpcityArray[j],tmpcityArray[j]); 
 	                        }
 	                  } 
 	            }
 			}
		} 
		function chooseCity(v){
			$("#City1").html("<option value='0'> -请选择- </option>");
			if(v!=0){
				$.ajax({
					url:"findCity.do",
					type:"POST",
					data:{"pro":v},
					dataType:'json',
					success:function(date){
						var json = eval(date);
						$.each(json,function(index,item){
							
							$("#City1").append("<option value='"+json[index].city+"'>"+json[index].city+"</option>");
						})
					}
				});
			}
		}
        function chooseScenic(v){
    		$("#scenicId").html("<optino> 请选择  </option>");
    		if(v!=0){
    			$.ajax({
    				url:"findScenic.do",
    				type:"POST",
    				data:{"pro":v},
    				dataType:'json',
    				success:function(date){
    					var json = eval(date);
    					$.each(json,function(index,item){
    						
    						$("#scenicId").append("<option value='"+json[index].scenicId+"'>"+json[index].scenicName+"</option>");
    					})
    				}
    			});
    		}
    	}
    </script>
</body>
</html>
