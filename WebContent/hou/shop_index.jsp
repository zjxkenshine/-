<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css" rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script> 
<title>校园助手后台管理系统</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script type="text/javascript" src="js/PIE/PIE_IE678.js"></script>
 <![endif]-->
<body>
 <div class="Sellerber" id="Sellerber">
 <!--顶部-->
  <div class="Sellerber_header apex clearfix" id="Sellerber_header">
   	<div class="l_f logo"><img src="images/logo_03.png" /></div>
   <div class="r_f Columns_top clearfix">
   <!--<div class="time_style"><i class="fa  fa-clock-o"></i><span id="time"></span></div>-->
   <div class="news l_f"><a href="../mymessagelist.do" target="iframepage" class="fa  fa-bell "></a><em>${messagenum }</em></div>
     <div class="administrator l_f">
      <c:if test="${user.getPicture()==null }">
       <img src="images/avatar.png"  width="36px"/>
        </c:if>
        <c:if test="${user.getPicture()!=null }">
        <img src="${user.getPicture() }"  width="36px"/>
        </c:if>
        <span class="user-info">${user.getManagerName() }</span><i class="glyph-icon fa  fa-caret-down"></i>
       <ul class="dropdown-menu">
        <li><a href="../personalmessageset.do" target="iframepage"><i class="fa fa-user"></i>个人信息</a></li>
        <li><a href="#"><i class="fa fa-cog"></i>系统设置</a></li>
        <li><a href="javascript:void(0)" id="Exit_system"><i class="fa fa-user-times"></i>退出</a></li>
       </ul>
     </div>
   </div>
  </div>
<!--左侧-->
  <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
    <div class="menu_style" id="menu_style">
    <div class="list_content">
    <div class="skin_select">
      <ul class="dropdown-menu dropdown-caret">
         <li><a class="colorpick-btn selected" href="javascript:ovid()"data-val="default"  id="default" style="background-color:#222A2D" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="blue" style="background-color:#438EB9;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="green" style="background-color:#72B63F;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="pink" style="background-color:#D0D0D0;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="red" style="background-color:#FF6868;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="yellow" style="background-color:#ffffa2;" ></a></li>
        </ul>     
     </div>
     <div class="search_style">
        <form action="#" method="get" class="sidebar_form">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control">
                        <span class="input-group-btn">
                            <a class="btn_flat" href="javascript:" onclick=""><i class="fa fa-search"></i></a>
                        </span>
                    </div>
                </form>
     </div>     
    <dl class="nav nav-list" id="menu_list">
     <dt class="shop_index nav_link " ><a href="javascript:void(0)" name="../indexset.do" class="iframeurl" title=""><i class="fa fa-home"></i><span class="menu-text">后台首页</span></a></dt>
     <dd class="submenu" style="height:0px; border:0px;"></dd>
     <c:if test="${user.getManagerId()==1 }">
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-users"></i><span class="menu-text">管理员管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
     	<dd class="submenu">
     	<ul>
	       	<li class="home"><a href="javascript:void(0)" name="../statuslist.do" title="权限管理" class="iframeurl"><i class="fa fa-angle-double-right"></i>权限管理</a></li>
	       	<li class="home"><a href="javascript:void(0)" name="../managerlist.do" title="管理员列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>管理员列表</a></li>
	       
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-user"></i><span class="menu-text">员工管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
    	<ul>
	       <li class="home"><a href="javascript:void(0)" name="../workertypelist.do" title="职位管理" class="iframeurl"><i class="fa fa-angle-double-right"></i>职位管理</a></li>
	       <li class="home"><a href="javascript:void(0)" name="../workerlist.do" title="员工列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>员工管理</a></li>
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-cogs"></i><span class="menu-text">日志管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
	       <li class="home"><a href="javascript:void(0)" name="../manageroperationlist.do" title="管理员日志" class="iframeurl"><i class="fa fa-angle-double-right"></i>管理员日志</a></li>
	       <li class="home"><a href="javascript:void(0)" name="#" title="用户日志" class="iframeurl"><i class="fa fa-angle-double-right"></i>用户日志</a></li>
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-file-photo-o"></i><span class="menu-text">邮件管理</span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
     		<li class="home"><a href="javascript:void(0)" name="../mymessagelist.do" title="个人邮件" class="iframeurl"><i class="fa fa-angle-double-right"></i>个人邮件</a></li>
       		<li class="home"><a href="javascript:void(0)" name="sendAll.jsp" title="群发消息" class="iframeurl"><i class="fa fa-angle-double-right"></i>群发消息</a></li>
       		<li class="home"><a href="javascript:void(0)" name="Category_Manage.html" title="网站反馈" class="iframeurl"><i class="fa fa-angle-double-right"></i>网站反馈</a></li>
       		<li class="home"><a href="javascript:void(0)" name="Category_Manage.html" title="投诉邮箱" class="iframeurl"><i class="fa fa-angle-double-right"></i>投诉邮箱</a></li>
       	</ul>
     	</dd>
     	
     	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-user"></i><span class="menu-text">会员管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
    	<ul>
       		<li class="home"><a href="javascript:void(0)" name="../clientlist.do" title="会员列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>客户列表</a></li>
       	</ul>
      	</dd>
      
        <dt class="nav_link ">
     	<a href="javascript:void(0)" class="dropdown-toggle title_nav"><i class="fa fa-desktop"></i><span class="menu-text"> 商品管理 </span><b class="arrow fa fa-angle-down"></b></a>
     	</dt>
     	<dd class="submenu">
       	<ul>
         	<li class="home"><a href="javascript:void(0)" name="../goodslist.do" title="商品列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品列表</a></li>
        </ul>
        </dd>
        
        <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-database"></i><span class="menu-text">订单管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
       		<li class="home"><a href="javascript:void(0)" name="../orderlist.do" title="订单列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>订单列表</a></li>
       		<li class="home"><a href="javascript:void(0)" name="#" title="物流管理" class="iframeurl"><i class="fa fa-angle-double-right"></i>物流管理</a></li>
        	<li class="home"><a href="javascript:void(0)" name="../" title="退款操作" class="iframeurl"><i class="fa fa-angle-double-right"></i>退款操作</a></li>
       	</ul>
      	</dd>
      	
	    <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-wrench"></i><span class="menu-text">界面工具</span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
       		<li class="home"><a href="javascript:void(0)" name="form_builder.jsp" title="表单构建器" class="iframeurl"><i class="fa fa-angle-double-right"></i>表单构建器</a></li>
       	</ul>
     	</dd>
     	
	    <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-user"></i><span class="menu-text">会员信息列表 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
     	    <li class="home"><a href="javascript:void(0)" name="../jobcollectlist.do" title="收藏列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>兼职收藏列表</a></li>
       		<li class="home"><a href="javascript:void(0)" name="../collectlist.do" title="收藏列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>商品收藏列表</a></li>
       		<li class="home"><a href="javascript:void(0)" name="../shoplist.do" title="购物车列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>购物车列表</a></li>
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-th-list"></i><span class="menu-text">会员搜索列表</span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
       		<li class="home"><a href="javascript:void(0)" name="../goodsquerylist.do" title="商品搜索列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品搜索列表</a></li>
       		<li class="home"><a href="javascript:void(0)" name="../goodslatequerylist.do" title="最近搜索表" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品最近搜索表</a></li>
       		<li class="home"><a href="javascript:void(0)" name="../jobquerylist.do" title="兼职最近搜索表" class="iframeurl"><i class="fa fa-angle-double-right"></i>兼职最近搜索表</a></li>
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-hdd-o "></i><span class="menu-text">兼职管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
   	 	<dd class="submenu">
     	<ul>
       		<li class="home"><a href="javascript:void(0)" name="../joblist.do" title="兼职列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>兼职列表</a></li>
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-file-photo-o"></i><span class="menu-text">图片管理</span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
      		<li class="home"><a href="javascript:void(0)" name="Advertising_list.html" title="广告列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>广告图片</a></li>
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-bar-chart"></i><span class="menu-text">商品销量管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
   		<dd class="submenu">
     	<ul>
       		<li class="home"><a href="javascript:void(0)" name="Columns.html" title="商品销量" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品销量</a></li>
       	</ul>
      	</dd>
      	
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-cogs"></i><span class="menu-text">前台信息管理</span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
       		<li class="home"><a href="javascript:void(0)" name="Products_List.html" title="前台信息" class="iframeurl"><i class="fa fa-angle-double-right"></i>前台信息列表</a></li>
       	</ul>
     	</dd>    	    	   	
     </c:if>
     
    <c:if test="${user.getManagerId()!=1 }">
     <c:forEach items="${statuslist }" var="sta">
     	<c:if test="${sta eq '8'}">
	     	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-users"></i><span class="menu-text">管理员管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
	     	<dd class="submenu">
	     	<ul>
		       	<li class="home"><a href="javascript:void(0)" name="../managerlist.do" title="管理员列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>管理员列表</a></li>
	       	</ul>
	      	</dd>
     	</c:if>
     	
     	<c:if test="${sta eq '7'}">
	     	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-user"></i><span class="menu-text">员工管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
	    	<dd class="submenu">
	    	<ul>
		       <li class="home"><a href="javascript:void(0)" name="../workerlist.do" title="员工列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>员工列表</a></li>
	       	</ul>
	      	</dd>
	     </c:if>
	     
	     
	     <c:if test="${sta eq '9'}">
	     	 <dt class="nav_link ">
     			<a href="javascript:void(0)" class="dropdown-toggle title_nav"><i class="fa fa-desktop"></i><span class="menu-text"> 商品管理 </span><b class="arrow fa fa-angle-down"></b></a>
     		</dt>
     		<dd class="submenu">
       		<ul>
         		<li class="home"><a href="javascript:void(0)" name="../goodslist.do" title="商品列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品列表</a></li>
        	</ul>
        	</dd>
	     </c:if>
	     
	      <c:if test="${sta eq '10'}">
	        <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-database"></i><span class="menu-text">订单管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
	    	<dd class="submenu">
	     	<ul>
	       		<li class="home"><a href="javascript:void(0)" name="Order.html" title="订单类表" class="iframeurl"><i class="fa fa-angle-double-right"></i>订单列表</a></li>
	       		<li class="home"><a href="javascript:void(0)" name="Order_Logistics.html" title="物流管理" class="iframeurl"><i class="fa fa-angle-double-right"></i>物流管理</a></li>
	        	<li class="home"><a href="javascript:void(0)" name="Category_Manage.html" title="分类管理" class="iframeurl"><i class="fa fa-angle-double-right"></i>退款操作</a></li>
	       	</ul>
	      	</dd>
	     </c:if>
	     
		<c:if test="${sta eq '11'}">
	      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-hdd-o "></i><span class="menu-text">会员信息列表 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    		<dd class="submenu">
     		<ul>
      			<li class="home"><a href="javascript:void(0)" name="../jobcollectlist.do" title="收藏列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>兼职收藏列表</a></li>
       			<li class="home"><a href="javascript:void(0)" name="../collectlist.do" title="收藏列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>商品收藏列表</a></li>
       			<li class="home"><a href="javascript:void(0)" name="../shoplist.do" title="购物车列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>购物车列表</a></li>
			</ul>
      		</dd>
      	</c:if>
      	
      	<c:if test="${sta eq '12'}">
	      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-th-list"></i><span class="menu-text">会员搜索列表</span><b class="arrow fa fa-angle-down"></b></a></dt>
	    	<dd class="submenu">
	     	<ul>
	       		<li class="home"><a href="javascript:void(0)" name="../goodsquerylist.do" title="商品搜索列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品搜索列表</a></li>
	       		<li class="home"><a href="javascript:void(0)" name="../goodslatequerylist.do" title="最近搜索表" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品最近搜索表</a></li>
	       		<li class="home"><a href="javascript:void(0)" name="../jobquerylist.do" title="兼职最近搜索表" class="iframeurl"><i class="fa fa-angle-double-right"></i>兼职最近搜索表</a></li>
	       	</ul>
	      	</dd>
	     </c:if>
	     
	    <c:if test="${sta eq '13'}">
	        <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-hdd-o "></i><span class="menu-text">兼职管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
   	 		<dd class="submenu">
     		<ul>
       			<li class="home"><a href="javascript:void(0)" name="../joblist.do" title="兼职列表" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>兼职列表</a></li>
       		</ul>
      		</dd>    
	    </c:if>
	     
	     <c:if test="${sta eq '14'}">
     	 	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-file-photo-o"></i><span class="menu-text">图片管理</span><b class="arrow fa fa-angle-down"></b></a></dt>
    		<dd class="submenu">
     		<ul>
      			<li class="home"><a href="javascript:void(0)" name="Advertising_list.html" title="广告列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>广告图片</a></li>
       		</ul>
      		</dd>
	     </c:if>
	     
	     <c:if test="${sta eq '4'}">
	     	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-cogs"></i><span class="menu-text">日志管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    		<dd class="submenu">
     		<ul>
	       		<li class="home"><a href="javascript:void(0)" name="../manageroperationlist.do" title="管理员日志" class="iframeurl"><i class="fa fa-angle-double-right"></i>管理员日志</a></li>
	       		<li class="home"><a href="javascript:void(0)" name="#" title="用户日志" class="iframeurl"><i class="fa fa-angle-double-right"></i>用户日志</a></li>
       	   	</ul>
      	 	</dd>
	     </c:if>
	     
	     <c:if test="${sta eq '2'}">
	     	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-user"></i><span class="menu-text">会员管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    		<dd class="submenu">
    	 	<ul>
       			<li class="home"><a href="javascript:void(0)" name="../clientlist.do" title="会员列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>客户列表</a></li>
       		</ul>
      		</dd>
	     </c:if>
	     
	     <c:if test="${sta eq '15'}">
		   	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-bar-chart"></i><span class="menu-text">商品销量管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
	   		<dd class="submenu">
	     	<ul>
	       		<li class="home"><a href="javascript:void(0)" name="Columns.html" title="商品销量" class="iframeurl"><i class="fa fa-angle-double-right"></i>商品销量</a></li>
	       	</ul>
	      	</dd>    
	     </c:if>
	     
	     <c:if test="${sta eq '16'}">
		   	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-cogs"></i><span class="menu-text">前台信息管理</span><b class="arrow fa fa-angle-down"></b></a></dt>
    		<dd class="submenu">
     		<ul>
       			<li class="home"><a href="javascript:void(0)" name="Products_List.html" title="前台信息" class="iframeurl"><i class="fa fa-angle-double-right"></i>前台信息列表</a></li>
       		</ul>
     		</dd>
	     </c:if>
	
	     
	     <c:if test="${sta eq '3'}">
	     	 <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-wrench"></i><span class="menu-text">界面工具</span><b class="arrow fa fa-angle-down"></b></a></dt>
    		<dd class="submenu">
     		<ul>
       			<li class="home"><a href="javascript:void(0)" name="form_builder.jsp" title="表单构建器" class="iframeurl"><i class="fa fa-angle-double-right"></i>表单构建器</a></li>
       		</ul>
     		</dd>
	     </c:if>
     </c:forEach>
     
      	<dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa  fa-file-photo-o"></i><span class="menu-text">邮件管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    	<dd class="submenu">
     	<ul>
     		<li class="home"><a href="javascript:void(0)" name="../mymessagelist.do" title="个人邮件" class="iframeurl"><i class="fa fa-angle-double-right"></i>个人邮件</a></li>
       		<c:forEach items="${statuslist }" var="sta">
       		<c:if test="${sta eq '6'}">
       			<li class="home"><a href="javascript:void(0)" name="sendAll.jsp" title="群发消息" class="iframeurl"><i class="fa fa-angle-double-right"></i>群发邮件</a></li>
       		</c:if>
       		<c:if test="${sta eq '5'}">	
       			<li class="home"><a href="javascript:void(0)" name="Category_Manage.html" title="网站反馈" class="iframeurl"><i class="fa fa-angle-double-right"></i>网站反馈</a></li>
       			<li class="home"><a href="javascript:void(0)" name="Category_Manage.html" title="投诉邮箱" class="iframeurl"><i class="fa fa-angle-double-right"></i>投诉邮箱</a></li>
       		</c:if>
       		</c:forEach>
       	</ul>
     	</dd>
     	
     	
      </c:if>
      <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-file-text-o"></i><span class="menu-text">共享中心 </span><b class="arrow fa fa-angle-down"></b></a></dt>
      <dd class="submenu">
      <ul>
      	<li class="home"><a href="javascript:void(0)" name="../sharefilelist.do" title="文件共享" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>文件共享</a></li>
      	<li class="home"><a href="javascript:void(0)" name="../sharepiclist.do" title="图片共享" class="iframeurl"><i class="fa fa-angle-double-rightt"></i>图片共享</a></li>
      </ul>
      </dd>
      
      <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-cogs"></i><span class="menu-text">系统清理</span><b class="arrow fa fa-angle-down"></b></a></dt>
      <dd class="submenu">
      <ul>
       	<li class="home"><a href="javascript:void(0)" name="cleanQuery.jsp" title="查询清理" class="iframeurl"><i class="fa fa-angle-double-right"></i>查询清理</a></li>
       	<li class="home"><a href="javascript:void(0)" name="cleanDateBase.jsp" title="数据库清理" class="iframeurl"><i class="fa fa-angle-double-right"></i>数据库清理</a></li>
       	<li class="home"><a href="javascript:void(0)" name="cleanPage.jsp" title="页面清理" class="iframeurl"><i class="fa fa-angle-double-right"></i>页面清理</a></li>
      </ul>
      </dd>
      
      
   
  
   
      
    </dl>  
    </div>
  </div>
 </div>
<!--内容-->
  <div class="Sellerber_content" id="contents">
    <div class="breadcrumbs" id="breadcrumbs">
       <a id="js-tabNav-prev" class="radius btn-default left_roll" href="javascript:;"><i class="fa fa-backward"></i></a>
       <div class="breadcrumb_style clearfix">
	  <ul class="breadcrumb clearfix" id="min_title_list">
        <li class="active home"><span title="我的桌面" data-href="index.html"><i class="fa fa-home home-icon"></i>首页</span></li>
      </ul>
      </div>
       <a id="js-tabNav-next" class="radius btn-default right_roll" href="javascript:;"><i class="fa fa-forward"></i></a>
       <div class="btn-group radius roll-right">
                    <a class="dropdown tabClose" data-toggle="dropdown" aria-expanded="false">
                        页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" id="dropdown_menu">
                        <li><a class="tabReload" href="javascript:void();">刷新当前</a></li>
                        <li><a class="tabCloseCurrent" href="javascript:void();">关闭当前</a></li>
                        <li><a class="tabCloseAll" href="javascript:void();">全部关闭</a></li>
                    </ul>
                </div>
                <a href="javascript:void()" class="radius roll-right fullscreen"><i class="fa fa-arrows-alt"></i></a>
    </div>
  <!--具体内容-->  
  <div id="iframe_box" class="iframe_content">
  <div class="show_iframe" id="show_iframe">
       <iframe scrolling="yes" class="simei_iframe" frameborder="0" src="../indexset.do" name="iframepage" data-href="../indexset.do"></iframe>
       </div>
      </div>
  </div>
<!--底部-->
  <div class="Sellerber_bottom info" id="bottom">
  <span class="l_f">版权所有：济南市校园助手技术有限公司</span>
  </div>
 </div>
</body>
</html>
<script>
//设置框架
 $(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		header:70,//顶部高度
		bottom:30,//底部高度
		menu:200,//菜单栏宽度
		Sellerber_menu:'.list_content',
		Sellerber_header:'.Sellerber_header',
	});
});
//时间设置
  function currentTime(){ 
   var weekday=new Array(7)
	weekday[0]="星期一"
	weekday[1]="星期二"
	weekday[2]="星期三"
	weekday[3]="星期四"
	weekday[4]="星期五"
	weekday[5]="星期六"
	weekday[6]="星期日"	
    var d=new Date(),str='';	
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+= d.getSeconds()+'秒'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	str+=weekday[d.getDay()-1]; 
    return str; 
} 
setInterval(function(){$('#time').html(currentTime)},1000); 
$('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="login.jsp";
        
    });
});
</script>
<script type="text/javascript">
$("#menu_style").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
}); 
</script>

