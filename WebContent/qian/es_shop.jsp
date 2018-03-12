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
<title>二手中心</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="js/js.js" type="text/javascript"></script>
<SCRIPT src="js/slide.js" type=text/javascript></SCRIPT>
<script type="text/javascript" src="js/script.js"></script>
<script src="../hou/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="../hou/js/jquery.cookie.js"></script>
<script src="../hou/js/layer/layer.js" type="text/javascript"></script>
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
                <c:if test="${goodsquery!=null }">
                <c:forEach items="${goodsquery }" var="gq">
	                <li><a href="../es_shop.go#${gq.getGoodsTypeId()}"><c:out value="${typename.get(gq.getGoodsTypeId()) }"></c:out></a></li>
                </c:forEach>
                </c:if>
              </ul>
            </div>
            <div class="right">            
           	  <a href="../shopcarset.go" class="shop_car"></a>
          	</div>
            <div class="cl"></div>
      	</div>
	</div>

<!---------------------banner_img-------------------------->

    <div class="banner_img">
    	<div align="left">
                <div class="main_content">

	<div class="nf_hp_kv js_nf_hp_kv">
		<div class="window js_window">
			<div class="kv_item"><a href="everyday.html"><img src='images/slov/b2.jpg' /></a></div>
			<div class="kv_item"><a href="everyday.html"><img src='images/slov/b2.jpg' /></a></div>
			<div class="kv_item"><a href="everyday.html"><img src='images/slov/P020130422604104730736.jpg' /></a></div>
		</div>
		<ul class="nav js_nav"></ul>
		<div class="btn_prev js_btn_prev"><a href="javascript:;">Prev</a></div>
		<div class="btn_next js_btn_next"><a href="javascript:;">Next</a></div>
	</div>
	
	<div class="nf_hp_teaser_c3x js_nf_hp_teaser_c3x">
		<div class="t_l js_t_group">
			<div class="t_item"><a href="everyday.html"><img src='images/slov/P020130422620707571884.jpg' width="292" height="159" /></a></div>
			<div class="t_item"><a href="everyday.html"><img src='images/slov/s2.jpg' width="292" height="159" /></a></div>
			<div class="t_item"><a href="everyday.html"><img src='images/slov/P020130506718680739253.jpg' width="292" height="159" /></a></div>
		</div>
		<div class="t_m js_t_group">
			<div class="t_item"><a href="everyday.html"><img src='images/slov/s1.jpg' width="292" height="159" /></a></div>
			<div class="t_item"><a href="everyday.html"><img src='images/slov/P020130313527277055795.jpg' width="292" height="159" /></a></div>
			<div class="t_item"><a href="everyday.html"><img src='images/slov/s2.jpg' width="292" height="159"/></a></div>
		</div>
		<div class="t_r js_t_group">
			<div class="t_item"><a href="everyday.html"><img src='images/slov/s3.jpg' width="292" height="159" /></a></div>
			<div class="t_item"><a href="everyday.html"><img src='images/slov/P020130422620707571884.jpg' width="292" height="159" /></a></div>
			<div class="t_item"><a href="everyday.html"><img src='images/slov/s4.jpg' width="292" height="159"/></a></div>
		</div>
	</div>
</div>
              </div>
    </div>

<!---------------------notice-------------------------->

    <a href="everyday.html"><div class="notice">
    	<p><span class="red"><font color="#E84C3D">促销活动：</font></span><a></a></p>
    </div></a>

<!---------------------layout_main-------------------------->
	<script type="text/javascript">
    	$(document).ready(function() {
           $("#cata_til").children(this).click(function(){
			   var index=$("#cata_til").children(this).index(this);
			   for(i=0;i<$("#cata_til").children(this).length;i++){
				 
				   if(index==i){
					   $("#cata_til").children(this).eq(i).css("backgroundColor","#E8403F");
					   $("#cata_til").children(this).eq(i).children( $("#cata_til").children(this).eq(i)).css("color","#fff");
					   }else{
					   $("#cata_til").children(this).eq(i).css("backgroundColor","#fff");
					   $("#cata_til").children(this).eq(i).children( $("#cata_til").children(this).eq(i)).css("color","#9999B2");
						   }
				   }
			   
			   
			   if(index==0){
				   	$("#text1").css("display","block");
					$("#text2").css("display","none");
				   }else if(index==1){
					   $("#text2").css("display","block");
					   $("#text1").css("display","none");
					   }
			   }); 
        });
    </script>

    
<!---------------------conts-------------------------->
<c:forEach items="${typelist }" var="type">
<div class="conts" id="${type.getTypeId() }">    
    	<div class="conts_til">
        	<ul>
            	<li class="conts_til_onck"><a style=" background-color:#D06716"><c:out value="${type.getTypeName() }"></c:out></a></li> 
            </ul>
            <p><a href="../produtclist.go?typeid=${type.getTypeId() }" class="conts_til_all"><img src="images/conts_til_all.jpg" width="112" height="26" /></a></p>
        </div>
        <div class="conts_prod" style="display:block;">
        	<ul>
        	<c:forEach items="${lgoods }" var="go">
        		<%int a=0; %>
        		<c:if test="${go.getTypeId()==type.getTypeId() }">
        		<%a++; %>
        		<%if(a<=8){ %>
	            	<li><a href="../productallset.go?goodsid=${go.getGoodsId()} "><p class="conts_prod_img"><img src="${go.getPicture() }" /></p><p>【<c:out value="${go.getGoodsName() }"></c:out>】</p><p class="red">¥<c:out value="${go.getPrice() }"></c:out> </p></a>
	                <a href=""><p>出售人：<c:out value="${clientname.get(go.getClientId()) }"></c:out></p></a></li>
                <%} %>
            	</c:if>
			</c:forEach>
            </ul>
        </div>
        <div class="cl"></div>
    </div>
</c:forEach>
	
     
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
    <div class="top">
        <div class="yi">意见反馈</div>
        <a href="../es_shop.go"><img src="images/top.png" /></a>
    </div>
    <div class="liulan" style="display:none;">
    	<p>*请描述你的意见:</p>
        <textarea></textarea>        
        <form>
        	<p>*您对我们的整体满意度如何？</p>
        	<input type="radio" name="yi" />非常满意<br />
            <input type="radio" name="yi" />满意<br />
            <input type="radio" name="yi" />一般<br />
            <input type="radio" name="yi" />不满意<br />
            <input type="radio" name="yi" />非常不满意<br />
           
        </form>
        <hr />
        <div class="dd">
         &nbsp;姓名：<input type="text" /><br />
         *电话：<input type="tel"  />
         </div>
        <button class="tijiao">提 交</button>
        <a class="butijiao">暂不提交</a>
    </div>
    <script type="text/javascript">
    	$(document).ready(function() {
            $(".yi").click(function(){
					$(".liulan").css("display","block");
				});
			 $(".tijiao").click(function(){
					$(".liulan").css("display","none");
				});
			 $(".butijiao").click(function(){
					$(".liulan").css("display","none");
				});
        });
    	
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
    	
    	
    </script>
</body>
</html>
