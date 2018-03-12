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
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>订单列表</title>
</head>

<body>
<div class="margin" id="page_style">
<div class="operation clearfix">
</div>
<!--列表展示-->
<div class="list_Exhibition margin-sx">
 <table class="table table_list table_striped table-bordered" id="sample-table">
  <thead>
  <tr>
  <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
   <th width="100">查询编号</th>
   <th>查询类型id</th>
   <th>查询类型名</th>
   <th>查询人id</th>
   <th>查询人</th>
   <th>查询次数</th>
   </tr>   
  </thead>
  <tbody>
  <c:forEach items="${goodsquery }" var="gq">
    <tr class="main">
   	  	<td class="center"><label><input btn_name="checkid" type="checkbox" class="ace" value=""><span class="lbl"></span></label></td>
   		<td><c:out value="${gq.getQueryId() }"></c:out></td>
   		<td><c:out value="${gq.getGoodsTypeId() }"></c:out></td>
   		<td><c:out value="${typename.get(gq.getGoodsTypeId()) }"></c:out></td>
   		<td><c:out value="${gq.getClient() }"></c:out></td>
   		<td><c:out value="${clientname.get(gq.getClient()) }"></c:out></td>
   		<td><c:out value="${gq.getQueryNum() }"></c:out></td>
   	</tr>
  </c:forEach>
  </tbody>
 </table>
</div>
</div>
</body>
</html>
<script type="text/javascript">
//设置框架
 $(function() { 
	$("#page_style").frame({
		float : 'left',
		menu_nav:'.operation',
		color_btn:'.skin_select',
	});
});
$(document).ready(function(){
    var spotMax = 8;
  if($('#add_Carousel_figure .table tbody tr').size() >= spotMax) {$(obj).hide();}
  $("#add_Upload").on('click',function(){ 
       var cid =$('.images_Upload').each(function(i){ $(this).attr('id',"Uimages_Upload_"+i)});
       addSpot(this, spotMax, cid);
  });
  
 
});


function addSpot(obj, sm ,sid) {
  if($('.delete_Upload').size() >= sm) {$(obj).hide();layer.msg('当前为最大图片添加量!',{icon:0,time:1000});}}

			$(function() {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		        "bStateSave": true,//状态保存
				"searching": true,
				"paging":true,   //取消分页
		        "aoColumnDefs": [{"orderable":false,"aTargets":[]}]
			   });
								
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').attr('selected','selected');
					});
						
				});
			});

/***********图片查看**********/
function picture_img(ojb,id){
	 layer.open({
        type: 1,
        title: '产品轮播图',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , '400px'],
        content:$('#add_Carousel_figure'),
		btn:['提交','取消'],
	 });
	}
/*********滚动事件*********/
$("#page_style").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});



 $(document).ready(function(){
	var ReturnWindow=$('#contents', parent.document); 
	var width = ReturnWindow.css("width");
	 $("#sample-table").css({"width":width-20+"px"});
	 });
</script>
