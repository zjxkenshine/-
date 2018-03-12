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
<title>个人中心</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/index2.css" rel="stylesheet" type="text/css" />
<link href="css/style2.css" rel="stylesheet" type="text/css" />
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
                    	<a id="add_jobs"><li>发布兼职</li></a>
                    	</c:if>
                        </c:if>
                    </ul>
              </div>
       
              <div class="ctt" style="width:auto; height:25px; float:right;  margin-top:-25px;">
              <c:if test="${client!=null }">
                    <a href="../logout.go"><span style=" line-height:25px; color:#FE0002;">[退出]</span></a>
                    <a href="myself.jsp"><span style=" line-height:25px; color:#FE0002; ">[<c:out value="${client.getClientName() }"></c:out>]</span></a>
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


    <div class="produta">    
    	<div class="produta_til">
    	  <p>您现在的位置：<a href="../es_shop.go">首页</a> > <a href="../myself.go">我的账户</a></p></div>
          
          
 <!---------------------individual-------------------------->

	<div class="indiv">
    	<div class="left indivter">
        	<div class="indivtertil">
        	  <p class="indivtertil_all"><a href="../myself.go">个人信息</a></p></div>
            <div class="indivterall">
                 <ul>
                 	<li class="indivterta"><p>个人中心</p>
               	    <div class="indivterta_til_onc"><a href="../myorder.go">我的订单</a> <a href="../mycollect.go">我的收藏</a> <c:if test="${client.getStatus()==1 }"><a href="../mygoods.go">我的商品</a>  <a href="../mysale.go">售出订单</a></c:if> </div></li>
                    <li class="link"></li>
              </ul>
            </div>
        </div>
    	<div class="right indivters">
    	 <p class="red">我的收藏</p>
        	<div class="indivters_all">
                
            	<ul> 	 	 	 	 	 	 	 	
                	<li><p>收藏编号</p></li>
                    <li class="links"></li>
                	<li><p>商品</p></li>
                    <li class="links"></li>
                    <li><p>收藏时间</p></li>
                    <li class="links"></li>
                	<li><p>操作</p></li>
                </ul>
                <c:forEach items="${collectlist }" var="collect">
            	<ul>
            	<input id="collectid" type="hidden" value="${collect.getCollectId()}">
            	<input id="goodsid" type="hidden" value="${collect.getGoodsId()}">  	 	 	 	 	 	 	 	
                	<li><p title="收藏编号">${collect.getCollectId()}</p></li>
                    <li class="links"></li>
                	<li><p title="商品">${goodsname.get(collect.getGoodsId())}</p></li>
                    <li class="links"></li>
                    <li><p title="商品">${collect.getCollectTime()}</p></li>
                    <li class="links"></li>
                	<li><a id="deletecollect">删除</a><a href="../productallset.go?goodsid=${collect.getGoodsId()} ">查看商品</a></li>
                </ul>
            	</c:forEach>
    	
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
    
<!---------------------mask-------------------------->


<div class="indt_edito">
	<div class="allmain"></div>
	<div class="indt_edito_ran">
    	<div class="allmain_top"><P class="red">欢迎来到社区平台</P><P>您可以对订单进行编辑修改</P></div>
    	<div class="indt_editos">
        	<div class="indivters_edito">
                	
            	<ul> 	 	 	 	 	 	 	 	
                	<li><p title="订单号">订单号</p><span>派送中</span></li>
                	<li><p title="下单时间">下单时间</p><span>2014-08-08</span></li>
                	<li><p title="状态">状态</p> <span>派送中</span></li>
                	<li><p title="状态">产品种类</p> 
        				<select name="dssds">
                            <option value="fiat" selected="selected">啤酒</option>
                            <option value="volvo">香烟</option>
                            <option value="saab">食用油</option>
                            <option value="audi">零食</option>
                		</select><span class="red">请选择种类</span>
                    </li>
                	<li><p>订单数量</p><div class="libgc ml6mr6">
                            <input class="icon-cut" type="button">
                            <input id="qty0" type="text" _minsaleqty="1" value="1" isfcl="0" name="input_catalog_qtc">
                            <input class="icon-add" type="button">
                            </div></li>
                	<li><p title="订单金额">订单金额</p><span class="red">￥500.00</span></li>
                	<li><p title="支付方式">支付方式</p><input name="" type="text" /></li>
                	<li><p title="收货人"><p>支付人</p><input name="" type="text" /></p></li>
                	<li><a class="indt_edito_on">保存</a><a class="indt_edito_on">取消</a></li>
                </ul>
                </div>
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
	
	$("#add_goods").click(function(){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '添加商品'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: 'addgoods.jsp',
		  
		});
	})
	
	$("#goodsquery").click(function(){
		var id=$("#querystring").val();
		window.location.href="../produtclist.go?querystring="+id;
		
	})
	
	$("#deletecollect").click(function(){
		var id=$("#collectid").val();
		window.location.href="../deletecollect.go?id="+id;
	})
	
		
</script>
</body>
</html>
