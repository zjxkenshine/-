<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String  path = request.getContextPath();
%>
<head>
<base href="<%=path%>/hou/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/dist/echarts.js" type="text/javascript"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>首页</title>
</head>

<body  id="iframe_box">
<div id="index_style" style="height:100%" class="clearfix">
<div class="spacing_style" ></div>
 <div class="margin-bottom clearfix ">
 	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-4">
   	<a href="javascript:ovid()" class="tile-button btn_Plate bg-deep-blue">
   	<div class="carousel Module_info">
   	<div class="left_img bg_color_bule">
    <i class="fa fa-cny"></i>
    <h3>网站成交总额</h3>
   </div>
   <div class="right_info">0元</div>
   </div>
   </a>
  </div>
 
  <div class="col-xs-2 col-sm-2 col-md-2 col-lg-4">
   <a href="javascript:ovid()" class="tile-button btn_Plate bg-deep-blue">
   <div class="carousel Module_info">
   <div class="left_img bg_color_bule">
    <i class="fa fa-cny"></i>
    <h3>月成交金额</h3>
   </div>
   <div class="right_info">0元</div>
   </div>
   </a>
  </div>
  
   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-4">
   <a href="javascript:ovid()" class="tile-button btn_Plate bg-deep-blue">
   <div class="carousel Module_info">
   <div class="left_img bg_color_bule">
    <i class="fa fa-cny"></i>
    <h3>周成交金额</h3>
   </div>
   <div class="right_info">0元</div>
   </div>
   </a>
  </div>
  
   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-4">
   <a href="javascript:ovid()" class="tile-button btn_Plate bg-red ">
   <div class="carousel Module_info">
   <div class="left_img bg_color_red">
    <i class="fa fa-shopping-cart"></i>
    <h3>月成交订单</h3>
   </div>
   <div class="right_info">0笔</div>
   </div>
   </a>
  </div> 
   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-4">
   <a href="javascript:ovid()" class="tile-button btn_Plate bg-red ">
   <div class="carousel Module_info">
   <div class="left_img bg_color_red">
    <i class="fa fa-shopping-cart"></i>
    <h3>周成交订单</h3>
   </div>
   <div class="right_info">0笔</div>
   </div>
   </a>
  </div> 
   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-4">
   <a href="javascript:ovid()" class="tile-button btn_Plate bg-green">
   <div class="carousel Module_info">
   <div class="left_img bg_color_green">
    <i class="fa  fa-comments-o"></i>
    <h3>未读消息</h3>
   </div>
   <div class="right_info">${messagenum }条</div>
   </div>
   </a>
  </div>
  
  
 
 </div>
 <div class="center  clearfix margin-bottom">
 <!--店铺信息-->
 <div class="col-xs-9">
 <div class="Shops_info clearfix frame">
  <div class="left_shop">
  <div class="left_shop_logo">
   <div class="shop_logo"><span class="bg_yuan"></span><img id="webpicture" src="${webpic.getWebPicture() }" /></div>
   <a href="../qian/index.jsp" target="top" class="btn bg-deep-blue paddings">网站首页</a>
   </div>
   <div class="Shops_content">
   <p><label class="name">商城名称：</label>校园助手网</p>
   <ul class="clearfix">
   <c:forEach items="${webmessage }" var="wbs">
  	 <li><label class="name"><c:out value="${wbs.getWebMessageName() }"></c:out>：</label><c:out value="${wbs.getWebMessageValue() }"></c:out></li>
   </c:forEach>
    
    </ul>
   </div>
  
  
  <div class="right_shop">
   <p>网站综合评分：</p>
   <ul>
   <li><label class="name">界面美观</label><span class="score">4.5分</span></li>
   <li><label class="name">服务态度</label><span class="score">4.0分</span></li>
   <li><label class="name">满意度</label><span class="score">4.6分</span></li>
   </ul>
  </div>
  </div>
  <div class="operating_style Quick_operation" >
  <c:if test="${user.getManagerId()==1 }">
  <ul>
   <li class="submenu"><a  id="changewebpic" class="btn" title="网站图片"><i class="fa  fa-edit"></i>&nbsp;网站图片</a></li> 
   <li class="submenu"><a  id="addwebmessage" class="btn" title="信息修改"><i class="fa  fa-edit"></i>&nbsp;信息修改</a></li>
    <li class="submenu"><a  id="updatenotice" class="btn" title="公告修改"><i class="fa  fa-edit"></i>&nbsp;公告修改</a></li>
  </ul> 
  </c:if> 
  </div>
 </div>
 </div>
 <div class=" col-xs-3">
  <div class="admin_info frame clearfix">
  <div class="title_name"><i></i>登陆记录 </div>
  <table class="record_list table table_list">
  <tbody>
  <c:forEach items="${loginlist}" var="log">
   <tr><td><c:out value="${worker }"></c:out></td><td><c:out value="${log.getOperationTime() }"></c:out></td></tr>
   </c:forEach>
   </tbody>
  </table>
  </div>
 </div>
 </div>
 <!---->
 <div class="Order_form ">
  <div class="col-xs-6 col-lg-7">
  <div class="frame margin-right clearfix">
  <div class="title_name"><i></i>网站公告</div>
  <div class="clearfix">
  <div class="col-xs-3 col-lg-6 ">   
   <div class="padding list_info"><h3>${notice}</h3></div>
 	
  </div>
   
  </div>
  
  <div class="dd_echarts">
   <div id="main" style="width:100%; height:225px"></div>
  </div>
  </div>
  </div>
  
  
  <div class="col-xs-6 ranking_style col-lg-5" >
  <div class="frame clearfix">
   <div class="title_name"><i></i>商品销售排行</div>
   <table  class="table table_list ranking_list">
    <thead>
     <th width="50">排名</th>
     <th>商品编号</th>
     <th>商品名称</th>
     <th width="80">销售数量</th>
    </thead>
    <tbody>
     <tr>
      <td ><em>1</em></td>
      <td>2345776</td>
      <td><a href="#">联想（ThinkPad ）轻薄系列</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>2</em></td>
      <td>2345776</td>
      <td><a href="#">施巴（sebamed）婴儿泡泡沐浴露200ml家庭装</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>3</em></td>
      <td>2345776</td>
      <td><a href="#">七匹狼纯棉时尚休闲条纹翻领POLO衫T恤</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>4</em></td>
      <td>2345776</td>
      <td><a href="#">桂格即食燕麦片超值装1478g</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>5</em></td>
      <td>2345776</td>
      <td><a href="#">韩国爱敬挚爱香氛花香洗护套装（洗发水600ml+护发素</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>6</em></td>
      <td>2345776</td>
      <td><a href="#">韩国爱敬挚爱香氛花香洗护套装（洗发水600ml+护发素</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>7</em></td>
      <td>2345776</td>
      <td><a href="#">韩国爱敬挚爱香氛花香洗护套装（洗发水600ml+护发素</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>8</em></td>
      <td>2345776</td>
      <td><a href="#">韩国爱敬挚爱香氛花香洗护套装（洗发水600ml+护发素</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>9</em></td>
      <td>2345776</td>
      <td><a href="#">韩国爱敬挚爱香氛花香洗护套装（洗发水600ml+护发素</a></td>
      <td>23</td>
     </tr>
      <tr>
      <td ><em>10</em></td>
      <td>2345776</td>
      <td><a href="#">韩国爱敬挚爱香氛花香洗护套装（洗发水600ml+护发素</a></td>
      <td>23</td>
     </tr>
    </tbody>
   </table>
  </div>
  </div>
 </div>
</div>
</body>
</html>
<script>
//设置框架
 $(function() { 
	$("#index_style").frame({
		float : 'left',
		menu_nav:'.Quick_operation',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		Sellerber_header:'.Sellerber_header',
	});
	
	
});
$("#iframe_box").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});

$("#addwebmessage").click(function(){
	layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '网站信息修改'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../updatewebmessage.do',
		  
		});
})

$("#changewebpic").click(function(){
	var webpic=$("#webpicture").attr("src");
	layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '网站图片修改'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../updatewebpicset.do?webpic='+webpic,
		  
		});
})

$("#updatenotice").click(function(){
	var webpic=$("#webpicture").attr("src");
	layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '公告修改'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../updatenoticeset.do',
		  
		});
})
/*********************/
   require.config({
            paths: {
                echarts: './js/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('main'),theme);
               option = {
    title : {
        text: '当周交易记录',
        subtext: '每周7天的交易记录'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['所有订单','已完成','未完成']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['周一','周二','周三','周四','周五','周六','周日']
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel : {
                formatter: '{value}单'
            }
        }
    ],
    series : [
        {
            name:'所有订单',
            type:'line',
            data:[110, 110, 150, 130, 125, 133, 106],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            }
        },
        {
            name:'已完成',
            type:'line',
            data:[110, 105, 140, 130, 110, 121, 100],
            markPoint : {
                data : [
                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            }
        },
		   {
            name:'未完成',
            type:'line',
            data:[0, 5, 10, 0, 15, 12, 6],
            markPoint : {
                data : [
                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            }
        }
    ]
};
                  
			myChart.setOption(option);
			}
			);
</script>
