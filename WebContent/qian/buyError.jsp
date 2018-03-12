<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>华腾汇金</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/index2.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="js/js.js" type="text/javascript"></script>
<SCRIPT src="js/slides.js" type=text/javascript></SCRIPT>
<script type="text/javascript" src="js/index_v20.js"></script>
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
   		    	<a href="index_shop.html"><img src="images/logo.png" width="275" height="60" /></a>
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
        	<div class="process-03"></div>
        </div>
    <div class="shop-car">
       <div class="success">
       		<div class="d1" style="margin-left:370px;" >购买失败</div>
            <div class="d2">可能原因：该商品已被别人抢先购买或您购买了自己发布的商品！</div>
          <a href="../shopcarset.go"> <div  style="background-color:#F47469; height:25px; width:100px; border-radius:5px; margin-left:400px; margin-top:50px; text-align:center; line-height:20px;"> 回到购物车</div> </a>
           <a href="../es_shop.go"> 继续购物</a></div>
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
    
<script>
	var div1=document.getElementById("nav");
	function f1(){
		div1.style.display="inline";
		}
	function f2(){
		div1.style.display="none";
		}
		
</script>
</body>
</html>
