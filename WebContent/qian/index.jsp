<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<title>校园助手</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
		$(document).ready(function() {		
        $("#oul").children(this).children($("#oul").children(this)).hover(function(){
	 	var index=$("#oul").children(this).index(this);
		$(this).css("backgroundColor","#EB4642").css("color","#fff");
			},function(){
					$(this).css("backgroundColor","#fff").css("color","#999");
				});
    });
</script>
</script>
</head>

<body>
<!--头部开始-->
<div class="head">
	<div class="nav">
    	<a href="index.jsp"><img src="images/logo_shop.png" /></a>
        <div class="nav_class">
        	<ul id="oul">
                <li style="background-color:#EB4642; color:#fff; width:95px;">/首页/</li>
                <a href="../es_shop.go"><li>/ 二手中心/ </li></a>
                <a href="shop.html"><li>/ 兼职中心/ </li></a>
                <a href="jianjie.html"><li>/ 公司简介/ </li></a>
                <a href="about.html"><li>/ 关于我们/ </li></a>
            </ul>
        </div>
        <div class="search">
        	<div class="btn">
        	<c:if test="${client==null }">
            	<a href="login.jsp"><div class="dl">登陆</div></a>
                <a href="register.jsp"><div class="zc">注册</div></a>
            </c:if>
            <c:if test="${client!=null }">
           		 <a><div class="zc"><c:out value="已登录"></c:out></div></a>
            	<a href="../logout.go"><div class="dl">退出</div></a>
            </c:if>
            </div>
        </div>
    </div>
</div>
<!--头部结束-->
 <!--banner开始-->
 <script type="text/javascript">
$(document).ready(function(){

	$(".prev,.next").hover(function(){
		$(this).stop(true,false).fadeTo("show",0.9);
	},function(){
		$(this).stop(true,false).fadeTo("show",0.4);
	});
	
	$(".banner-box").slide({
		titCell:".hd ul",
		mainCell:".bd ul",
		effect:"fold",
		interTime:3500,
		delayTime:500,
		autoPlay:true,
		autoPage:true, 
		trigger:"click" 
	});

});
</script>
    <div class="banner">
    		<div class="banner-box">
	<div class="bd">
        <ul> 
        <c:if test="${lunbopic==null }"> 	    
            <li style="background:#F3E5D8;">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="images/banner.jpg" /></a>
                </div>
            </li>
            <li style="background:#B01415">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="images/banner2.jpg" /></a>
                </div>
            </li>
            <li style="background:#C49803;">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="images/banner3.jpg" /></a>
                </div>
            </li>
            <li style="background:#FDFDF5">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="images/banner4.jpg" /></a>
                </div>
            </li>  
         </c:if> 
          <c:if test="${lunbopic!=null }"> 
          	<c:forEach items="${lunbopic }" var="pic">
          		 <li style="background:#FDFDF5">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="${pic.getPicAddress() }" /></a>
                </div>
            </li>  
          	</c:forEach>
          </c:if>
        </ul>
    </div>
    <div class="banner-btn">
        <a class="prev" href="javascript:void(0);"></a>
        <a class="next" href="javascript:void(0);"></a>
        <div class="hd"><ul></ul></div>
    </div>
</div>
   		
    <div class="box">
        	<div class=" box_top"></div>
             <c:if test="${qianmessage!=null }">
             <span>${qianmessage.get('首页大标题') }</span>
              <p>${qianmessage.get('大标题简介') }</p>
             </c:if>
             <c:if test="${qianmessage==null }">
             <span>济南校园助手有限公司</span>
              <p>专门面对校园二手交易而成立的网站（更多信息请登录后查看）</p>
             </c:if>
        	
        </div>
    </div>
    <!--banner结束-->
<div class="center1">
	<div class="box">
    	<div class="zi">服务中心</div>
   		<ul id="oul">
        	<a href="mianhua.html"><li style="margin-left:46px;"><div class="img1"></div><p>找兼职>></p></li></a>
            <a href="../es_shop.go"><li><div class="img3"></div><p>淘二手>></p></li></a>
            <a href="nong.html"><li><div class="img2"></div><p>聊一聊>></p></li></a>
            <a><li><div class="img5"></div><p>更多功能，敬请期待</p></li></a>
        </ul>
    </div>
</div>
<c:if test="${qianmessage!=null }">
<script>
	$(document).ready(function() {
       $(".li1").hover(function(){
		$(".bb1").css("display","block");
		},function(){
			$(".bb1").css("display","none");
			});
			
		$(".li2").hover(function(){
		$(".bb2").css("display","block");
		},function(){
			$(".bb2").css("display","none");
			}); 
			
		$(".li3").hover(function(){
		$(".bb3").css("display","block");
		},function(){
			$(".bb3").css("display","none");
			});  
    });
	
</script>

<hr>
<div class="center3">
	<div class="box">
    	<div class="title">
        	<img src="images/img_r.png" />
            <div class="wenhua">
            	<p class="p1">Corporate culture</p>
                <p class="p2">企业文化</p>
            </div>
        </div>
        <img src="images/c4.jpg" />
        <div class="right">
            <c:out value="${qianmessage.get('企业文化') }"></c:out>
        </div>
    </div>
</div>
<div class="center4">
	<div class="box">
    	<div class="left">
            <div class="title">
                <img src="images/img_r.png" />
                <div class="wenhua">
                    <p class="p1">Corporate strategy</p>
                    <p class="p2">公司战略</p>
                </div>
       		</div>
            <img src="images/c5.jpg" />
            <p><c:out value="${qianmessage.get('公司战略') }"></c:out></p>
        </div>
    	<div class="right">
        	<div class="title">
                <img src="images/img_r.png" />
                <div class="wenhua">
                    <p class="p1">Announcement notice</p>
                    <p class="p2">公告通知</p>
                </div>
       		 </div>
            <div class="box">
            	<ul id="newlog">
            		<c:if test="${news!=null }">
                		<a href="news.html"><li><span>1.</span> 专业铁路、公路综合性仓储物流企业...</li></a>
                	</c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="center5">
	<div class="box">
    	<div class="left">
        	<div class="title">
                <img src="images/img_r.png" />
                <div class="wenhua">
                    <p class="p1">Company profile</p>
                    <p class="p2">公司简介</p>
                </div>
       		 </div>
            <p><c:out value="${qianmessage.get('公司简介') }"></c:out></p>
            
        </div>
    	<img src="images/c6.png" />
    </div>
</div>
</c:if>
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
                <a href="http://www.baidu.com/">百度</a>
            </div>
            <div class="copy">Copyright ©2017 济南市校园助手信息科技有限公司</div>
        </div>
        <div class="box_class2">
        	<p class="p1" style="margin-top:45px;">联系我们： <span> 400-000-0000</span></p>
            <p class="p1">客服热线 ：<span> 0991-584944</span></p>
            <p class="p1">地址：<span style="margin-left:30px;">0991-58945</span></p>
        </div>
        <div class="box_class3">
        <c:if test="${weixinpic!=null }">
        	<p>关注微信号：</p>
            <img src="${weixinpic }" />
        </c:if>
        </div>
    </div>
</div>
</body>
</html>
