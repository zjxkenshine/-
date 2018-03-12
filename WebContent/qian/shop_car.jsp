<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String  path = request.getContextPath();
%>
<head>
<base href="<%=path%>/qian/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>购物车</title>
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
                    <ul style="margin-left:100px;">
                    <c:if test="${client!=null }">
                    	
                        <a href="password.html"><li>会员中心</li></a>
                        <a href="my_shop1.html"><li>我的订单</li></a>
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
	<div class="top_nav">
    	<div class="main">
        	<div class="left">
           	  <ul>
              	<li id="til" class="yel"  onmouseover="f1()"><a>全部分类</a>
                <div id="nav" onmouseout="f2()">
                <div class="category-content" id="guide_2" >
                <div class="category" >
                <div class="zi" align="center">全部商品分类</div>
                <ul class="category-list" id="js_climit_li">
                  <li class="appliance js_toggle relative first" >      
                    <div class="category-info list-nz" style="border:0px green solid;" >
                      <h3 class="category-name b-category-name"><a id="s-category-289"  target="_blank" class="ml-22" title="服装首饰">服装首饰</a></h3>
                      <p class="c-category-list limit-24"> <a href="../produtclist.go?typeid=1" target="_blank" title="男装" id="s-goods-category-289-1">男装</a> <a href="../produtclist.go?typeid=2" target="_blank" title="女装" id="s-goods-category-289-2">女装</a> <a href="../produtclist.go?typeid=3" target="_blank" title="鞋子" id="s-goods-category-289-3">鞋子</a> <a href="../produtclist.go?typeid=4" target="_blank" title="饰品" id="s-goods-category-289-2">饰品</a> </p>
                    </div>
                    <hr/>
                  </li> 
                  <li class="appliance js_toggle relative first" >
                    <div class="category-info list-nz" >
                      <h3 class="category-name b-category-name"><a id="s-category-289"target="_blank" class="ml-22" title="生活类">生活类</a></h3>
                      <p class="c-category-list limit-24"> <a href="../produtclist.go?typeid=5" target="_blank" title="箱包" id="s-goods-category-289-1">箱包</a> <a href="../produtclist.go?typeid=9" target="_blank" title="一般生活用品" id="s-goods-category-289-2">生活用品</a> <a href="../produtclist.go?typeid=16" target="_blank" title="会员卡" id="s-goods-category-289-3">会员卡</a> </p>
                   </div>
                  <hr/>
                  </li> 
                    <li class="appliance js_toggle relative first" >
                    <div class="category-info list-nz" >
                      <h3 class="category-name b-category-name"><a id="s-category-289"target="_blank" class="ml-22" title="电器类">电器类</a></h3>
                      <p class="c-category-list limit-24"> <a href="../produtclist.go?typeid=6" target="_blank" title="电脑及配件" id="s-goods-category-289-1">电脑配件</a> <a href="../produtclist.go?typeid=7" target="_blank" title="手机及配件" id="s-goods-category-289-2">手机配件</a> <a href="../produtclist.go?typeid=8" target="_blank" title="其他电器" id="s-goods-category-289-3">其他</a> </p>
                   </div>
                  <hr/>
                  </li> 
                  <li class="appliance js_toggle relative first">
                    <div class="category-info list-nz" >
                      <h3 class="category-name b-category-name"><a id="s-category-289" target="_blank" class="ml-22" title="运动健身">运动健身类</a></h3>
                      <p class="c-category-list limit-24"> <a href="../produtclist.go?typeid=11" target="_blank" title="户外用品" id="s-goods-category-289-1">户外用品</a> <a href="../produtclist.go?typeid=10" target="_blank" title="运动器材" id="s-goods-category-289-2">运动器材</a> <a href="../produtclist.go?typeid=14" target="_blank" title="医药" id="s-goods-category-289-2">医药</a> </p>
                    </div>
                    <hr/>
                  </li>
                  <li class="appliance js_toggle relative first">
                    <div class="category-info list-nz" >
                      <h3 class="category-name b-category-name"><a id="s-category-289"  target="_blank" class="ml-22" title="特殊物品">特殊物品</a></h3>
                      <p class="c-category-list limit-24" > <a href="../produtclist.go?typeid=12" target="_blank" title="图书" id="s-goods-category-289-1">图书</a><a href="../produtclist.go?typeid=13" target="_blank" title="食品" id="s-goods-category-289-2">食品</a> <a href="../produtclist.go?typeid=15" target="_blank" title="乐器" id="s-goods-category-289-2">乐器</a> </p>
                     </div>
                      <hr/>
                  </li>
                   <li class="appliance js_toggle relative first">
                    <div class="category-info list-nz" >
                      <h3 class="category-name b-category-name"><a id="s-category-289"   target="_blank" class="ml-22" title="其他二手物品">其他二手物品</a></h3>
                      <p class="c-category-list limit-24" > <a href="../produtclist.go?typeid=17" target="_blank" title="其他二手物品" id="s-goods-category-289-1">其他二手物品</a> </p>
                     </div>
                      <hr/>
                  </li>
                </ul>
              
                </div>
                </div>
                </div>
               </li>
                <li style=" margin-left:150px;"><a href="../es_shop.go">首页</a></li>
                
              </ul>
            </div>
            <div class="right">            
           	  <a href="../shopcarset.go" class="shop_car"></a>
          	</div>
            <div class="cl"></div>
      	</div>
	</div>
<!---------------------produta-------------------------->
	<div class="car-tu">
        	<div class="process-01"></div>
        </div>
    <div class="shop-car">  	

        <div class="car-zi">我的购物车</div>
        <div class="nav">
        	<ul> 
            <li>商品名称</li>
            <li>商品单价</li>
            <li>出售人</li>
            <li>商品类型</li>
            <li>操作</li>
            </ul>
        </div>
        <hr />
        <c:forEach items="${goodslist }" var="goods">
         <div class="content">
        	<a><img src="${goods.getPicture() }" style="width:70px; height:70px; float:left;" /></a>
        	<div class="price"></div>
            <div class="price"><c:out value="${goods.getGoodsName() }"></c:out></div>
            <div class="price">￥<c:out value="${goods.getPrice()}"></c:out></div>
            <div class="youhui"><c:out value="${clientname.get(goods.getClientId())}"></c:out></div>
            <div class="xiaoji"><c:out value="${typename.get(goods.getTypeId())}"></c:out></div>
            <div class="caozuo"><a href="../deleteshopcar.go?id=${goods.getGoodsId() }"><img  src="images/shanchu.png" width="20px" height="20px"/>删除</a></div>
        </div>
          <hr />
        
        </c:forEach>

      
        <div class="pay">
        	<p><a href="../cleanshopcar.go">清空购物车</a></p>
            <p><a href="../es_shop.go">继续购物</a></p>
            <p style="margin-left:500px;">商品件数：<font color="#FF0000"><c:out value="${goodslist.size() }"></c:out></font>件</p>
            <p>应付金额：<c:out value="${sumprice }"></c:out>元<font color="#FF0000"></font></p>
            <c:if test="${client!=null }">
            <a href="../checkorderset.go"><div id="jiesuan">去结算</div></a>
            </c:if>
            <c:if test="${client==null }">
            <a href="login.jsp"><div id="jiesuan">去结算</div></a>
            </c:if>
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
