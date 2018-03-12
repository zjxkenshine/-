<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String  path = request.getContextPath();
%>
<head>
<base href="<%=path%>/qian/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>核对订单</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/index2.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="js/js.js" type="text/javascript"></script>
<SCRIPT src="js/slides.js" type=text/javascript></SCRIPT>
<script type="text/javascript" src="js/index_v20.js"></script>
<script src="../hou/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="../hou/js/jquery.cookie.js"></script>
<script src="../hou/js/layer/layer.js" type="text/javascript"></script>
<style>
	#nav{ display:none;}
</style>
</head>

<body>
<!---------------------top-------------------------->
	<div class="top_ban">
    	<div class="centers">
                <div class="main">
                    <ul style="margin-left:200px;">
                        <a href="password.html"><li>会员中心</li></a>
                        <a href="my_shop1.html"><li>我的订单</li></a>
                    </ul>
              </div> 
              <div class="ctt" style="width:140px; height:25px; float:right;  margin-top:-25px;">
                    <a href="login.html"><span style=" line-height:25px; color:#FE0002;">[登陆]</span></a>
                    <a href="register.html"><span style=" line-height:25px; color:#FE0002; ">[注册]</span></a>
              </div>
        </div>
    </div>
	<div class="top_head">
    	<div class="main">
        	<div class="left">
   		    	<a href="shop.html"><img src="images/logo.png" /></a>
            </div>
            <div class="right">            
       	    	<div class="left">
                	<dl>
               	  		<dt><input name="" type="text"  placeholder="小黄米" style="color:#999;"/><a href="produtclass.html">搜索</a></dt>
                        <dd>热门搜索：</dd>
                         <dd><a class="red" href="produtclass.html">干果</a></dd>
                        <dd><a href="produtclass.html">粮油</a></dd>
                        <dd><a href="produtclass.html">小黄米</a></dd>
                        <dd><a href="produtclass.html">液晶电视</a></dd>
                    </dl>
                </div>
                <img class="right" src="images/tou.jpg" height="60" />
            </div>
            <div class="cl"></div>
      </div>
    </div>
    <div class="bread">
    	<div style="width:1200px;" class="bread2">
        	<a href="../es_shop.go">首页 </a> <span> > 购物车</span>
        </div>
    </div>
<!---------------------produta-------------------------->
	<div class="car-tu">
        	<div class="process-02"></div>
        </div>
    <div class="shop-car" style=" margin-bottom:100px;">
        <hr />
        <div class="info">
        	<div class="box">填写核对订单信息</div>
            <div class="address">
            		
            		<div class="add" style="font-size:20px;margin-top:20px;"><b>选择收货地址(地址错误导致的问题本网站概不负责)</b></div>
            		<%int num=1;%>
            		<c:forEach items="${addresslist }" var="add">
                   	 <input type="radio" name="idendity" style="margin-left:50px; margin-top:15px; margin-bottom:10px;" value="${add.getAddressId()}" <%if(num==1){%>checked="checked"<%}num++;%> /><c:out value="${add.getName()}"></c:out>&nbsp;&nbsp;<c:out value="${add.getAddress()}"></c:out>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="Competence_upe(this,${add.getAddressId()})">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="Competence_del(this,${add.getAddressId()})">删除</a><br />
                   	</c:forEach>
                   	
                   	<a id="addaddress"><button>添加收货地址</button></a>
                    </div>
         			
            <div class="list">
            	<div style="font-size:20px; margin-top:20px;  float:left;"><b>商品清单</b></div>
                <a href="../shopcarset.go"><div style="float:right;margin-top:20px; font-size:12px;">回到购物车，修改商品>></div></a>
                 <div style=" height:auto; width:900px;">
                 <div class="nav-list">
        			<ul> 
            			<li style="margin-left:80px; margin-right:100px;">商品名称</li>
           			 	<li>商品单价</li>
           				<li>购买数量</li>
           				<li>优惠金额</li>
           			    <li>小计</li>
           			    
           		   </ul>
       		  </div>            
              <div class="nav-info">
              	<c:forEach items="${goodslist }" var="go">
        			<ul> 
            			<li style="float:left;margin-top:10px; width:200px; height:auto;">${go.getGoodsName() }</li>
           			 	<li >￥${go.getPrice()}</li>
           				<li>1</li>
           				<li>0</li>
           			    <li>￥${go.getPrice() }</li>
           			    
           		   </ul>
           	 	</c:forEach>
       		  </div >
              <div style="float:left;<c:if test="${goodslist.size()>=2}">display:none;</c:if>" >
              	 <a href="#"><div  style=" color:#F47469;">给卖家留言（50字之内）</div></a>
                <input id="discripe" style="width:340px; height:25px; margin-top:10px; color:#ccc; font-size:12px;" value="" />
              </div>
              <div>
             <p style=" margin-left:418px; margin-top:40px;">商品数量总计：${goodslist.size() }件  商品金额总计：¥${sumprice }</p>
             <p style=" margin-left:833px;">运费：¥0</p>
             <p style=" margin-left:765px;">您共需支付：¥${sumprice }</p>
			<a id="submitorder" ><div id="jiesuan" style="margin-left:790px; margin-top:30px; position:absolute;">提交订单</div></a></div>
            </div>
        </div>
        </div>
         <div class="cl"></div>
    </div>
    
<!---------------------foot-------------------------->

<div class="footer">
	<div class="box">
    	<div class="box_class1">
        	<div class="xins">
            	<ul>
                	<a href="about.html"><li style="padding-left:5px;">关于我们</li></a>
                    <a href="wuliu.html"><li>运输服务</li></a>
                    <a href="lianxi.html"><li>联系我们</li></a>
                    <a href="ditu.html"><li style="border-right:none; padding-right:5px;">网站地图</li></a>
                </ul>
            </div>
            <div class="lianjie">
            	<span style="color:#;">友情链接 :</span>
                <a href="http://www.cncexj.com/">新疆监管棉花网</a>
                <a href="http://www.ccqsc.gov.cn/">中国棉花公证检验</a>
                <a href="http://www.88086609.cn/">全国棉花交易市场</a>
                <a href="http://www.china-50.com/">中国纺织网</a>
            </div>
            <div class="copy">Copyright ©2015 乌鲁木齐市信息科技有限公司</div>
        </div>
       <div class="box_class2">
        	<p class="p1" style="margin-top:45px;">联系我们： <span> 400-000-0000</span></p>
            <p class="p1">客服热线 ：<span> 0991-584944</span></p>
            <p class="p1">传 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：<span style="margin-left:30px;">0991-58945</span></p>
        </div>
        <div class="box_class3">
        	<p>关注微信号：</p>
            <img src="images/erwei.jpg" />
        </div>
    </div>
</div>
    
<!---------------------mask-------------------------->

 <!--全部分类-->   
<script>
	var div1=document.getElementById("nav");
	function f1(){
		div1.style.display="inline";
		}
	function f2(){
		div1.style.display="none";
		}
</script>
<!--订单信息修改-->
<script>
	function down(div3,div4){
		div4.style.display="inline";
		}
</script>
<script>
	function up(div3,div4){
		div4.style.display="none";
		}
</script>
<!--支付方式-->
<script>
	function pay(div5,div6,div7,div8,div9,div10){
		div6.style.display="inline";
		div7.style.display="none";
		div8.style.display="none";
		div5.style.backgroundColor="#E8403F";
		div5.style.color="#fff";
		div9.style.backgroundColor="#ccc";
		div9.style.color="#000";
		div10.style.backgroundColor="#ccc";
		div10.style.color="#000";
		}	
	
	$("#addaddress").click(function(){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '添加地址'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: 'addaddress.jsp',
		  
		});
	})
	
	function Competence_upe(obj,id){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '修改地址'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../updateaddressset.go?id='+id,
		  
		});
}
	
	function Competence_del(obj,id){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '删除地址'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../deleteaddress.go?id='+id,
		  
		});
}
	
	$("#submitorder").click(function(){
		var msg=$("#discripe").val();
		window.location.href="../buygoods.go?discripe="+msg;
	})
</script>
</body>
</html>
