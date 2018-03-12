<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String  path = request.getContextPath();
%>
<head>
<base href="<%=path%>/qian/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>商品详情</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link href="css/index2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
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
                    <ul style="margin-left:100px;">
                    <c:if test="${client!=null }">
                    	
                        <a href="../myself.go"><li>会员中心</li></a>

                        <c:if test="${client.getStatus()==1 }">
                    	<a id="add_goods"><li>发布二手商品</li></a>
                    	</c:if>
                        </c:if>
                    </ul>
              </div>
       
              <div class="ctt" style="width:auto; height:25px; float:right;  margin-top:-25px;">
              <c:if test="${client!=null }">
                    <a href="../logout.go"><span style=" line-height:25px; color:#FE0002;">[退出]</span></a>
                    <a ><span style=" line-height:25px; color:#FE0002; ">[<c:out value="${client.getClientName() }"></c:out>]</span></a>
              </c:if>
              <c:if test="${client==null }">
              		<a href="login.jsp"><span style=" line-height:25px; color:#FE0002;">[登录]</span></a>
                    <a href="register.jsp"><span style=" line-height:25px; color:#FE0002; ">[注册]</span></a>
              </c:if>
              </div>
          
        </div>
    </div>
	<div class="top_head">
    	<div class="main">
        	<div class="left">
   		    	<a href="index.jsp"><img src="images/logo.png" /></a>
            </div>
            <div class="right">            
       	    	<div class="left">
                	<dl>
               	  		<dt><input name="querystring" id="querystring" type="text" style="color:#999;"/><a id="goodsquery" >搜索</a></dt>
                        <dd>最近搜索：</dd>
                        <c:forEach items="${goodslatequery }" var="glq">
                         <dd><a href="../produtclist.go?query=${glq.getQueryString() }" ><c:out value="${glq.getQueryString() }"></c:out></a></dd>
                        </c:forEach>
                    </dl>
                </div>
         
            </div>
            <div class="cl"></div>
      </div>
    </div>
	
<!---------------------produta-------------------------->


    <div class="produta">    
    	<div class="produta_til"><p>您现在的位置：<a href="../es_shop.go">首页</a> > <a><c:out value="${goods.getGoodsName() }"></c:out></a>  </p></div>
        <div class="produta_info">
        	
        
            <div class="zoombox">
              <div class="zoompic"><img src="${goods.getPicture() }" width="400" height="400" alt="" /></div>
              <div class="sliderbox">
                <div id="btn-left" class="arrow-btn dasabled"></div>
                <div class="slider" id="thumbnail">
                  <ul>
                    <li class="current"><a target="_blank"><img src="${goods.getPicture() }" width="48" height="48" alt="" /></a></li>
                  </ul>
                </div>
                <div id="btn-right" class="arrow-btn"></div>
              </div>
            </div>
           <script> 
				$(function(){ 
				$(".icon-add").click(function(){ 
				var t=$(this).parent().find('input[class=text]'); 
				t.val(parseInt(t.val())+1) 
				})
				$(".icon-cut").click(function(){ 
				var t=$(this).parent().find('input[class=text]'); 
				t.val(parseInt(t.val())-1) 
				if(parseInt(t.val())<0){ 
				t.val(0); 
				} 
				}) 
				}) 
			</script>
        	<div class="produta_info_all">
            	<ul>
                	<li><h3>商品名称：${goods.getGoodsName() }</h3></li>
                    <li><p><span class="proinfo_til">商    家:</span><span><a>${clientname.get(goods.getClientId()) }</a></span></p></li>
                    <li><p><span class="proinfo_til">售        价:</span><span>￥${goods.getPrice() }</span></p></li>
                    <li><p><span class="proinfo_til">商品详情:</span><span class="proinfo_all">${goods.getDiscripe() }</span></p></li>
                   	<li><p><span class="proinfo_til">商品类型:</span><span>${typename.get(goods.getTypeId()) }</span></p></li>
                    <li><p><span class="proinfo_til">商品编号:</span><span>${goods.getGoodsId() }</span></p></li>
                    <li class="produta_info_red"><p><span class="proinfo_til" style="margin-top:10px;">我 要 买：</span>
                        	
                           	 <c:if test="${client!=null }">
                           		 <div class="libgc ml6mr6">
                           	 	<a href="../buyonegoods.go?id=${goods.getGoodsId() }"><button style="border:none; background-color:#F47469; color:#fff; padding:3px 10px; border-radius:3px; margin-left:10px;">立即购买</button></a>
                            	</div>
                        		<a class="shop_car1" onclick="add_shopcar(this,${goods.getGoodsId() })"></a>
                        	 </c:if>
                        	 <c:if test="${client==null }">
	                        	<div class="libgc ml6mr6">
	                            <a href="login.jsp"><button style="border:none; background-color:#F47469; color:#fff; padding:3px 10px; border-radius:3px; margin-left:10px;">立即购买</button></a>
	                            </div>
                        	 	<a class="shop_car1" href="login.jsp"></a>
                        	 </c:if>
                    </p></li>
                    <li>
<script type="text/javascript">
bShareOpt = {
   uuid: "", 
   url: "", //商品的永久链接
   summary: "", //商品描述
   pic: "", //商品图片链接
   vUid: "", //用户id，为了让您能够知道您网站的注册用户分享、喜欢了哪些商品
   product: "", //商品名称
   price: "0", //商品价格
   brand: "", //商品品牌
   tag: "", //商品标签
   category: "", //商品分类
   template: "1" 
};
</script>
<script type="text/javascript">
	
</script>

<a class="bsLikeDiv" href="http://static.bshare.cn"></a>

                </ul>            	
            </div>
      </div>
      
        <div class="produta_hist">
        <div><p class="produta_hist_til">商家其他商品</p><p class="produta_hist_dian"></p></div>
        <div class="produta_hist_all">
        <div class="proclasa_all">
                	<ul style="margin-left:30px;">
                	<c:forEach items="${goodslist }" var="go">
                        <li><a href="../productallset.go?goodsid=${go.getGoodsId()}"><p class="proclasa_all_img"><img src="${go.getPicture()}"/></p>
                        <p>${go.getGoodsName()}</p><p class="red">¥${go.getPrice()} </p></a></li>
                   	</c:forEach>
                   </ul>
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
<script>
	var div1=document.getElementById("nav");
	
	function f1(){
		div1.style.display="inline";
		}
	function f2(){
		div1.style.display="none";
		}
	
	function add_shopcar(obj,id){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '添加购物车'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../addshopcar.go?goodsid='+id,
		});
		
	}
		
</script>
</body>
</html>
