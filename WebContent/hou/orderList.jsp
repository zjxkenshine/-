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
<button class="btn button_btn btn-danger" id="prodelete"  type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>
</div>
<!--列表展示-->
<div class="list_Exhibition margin-sx">
 <table class="table table_list table_striped table-bordered" id="sample-table">
  <thead>
  <tr>
  <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
   <th width="100">订单号</th>
   <th>商品id</th>
   <th>商品名</th>
   <th>出售人</th>
   <th>购买人</th>
   <th>快递单号</th>
   <th>订单生成时间</th>
   <th>订单完成时间</th>
   <th>操作</th>
   </tr>   
  </thead>
  <tbody>
  <c:forEach items="${order }" var="ord">
    <tr class="main">
    <c:if test="${ord.getFinishTime()!=null }">
    	<td class="center"><label><input btn_name="checkid" type="checkbox" class="ace" value="${ord.getOrderId() }"><span class="lbl"></span></label></td>
   	</c:if>
   	  <c:if test="${ord.getFinishTime()==null }">
   	  	<td class="center"><label><input btn_name="checkid" type="checkbox" class="ace" value=""><span class="lbl"></span></label></td>
   	  </c:if>
   		<td><c:out value="${ord.getOrderId() }"></c:out></td>
   		<td><c:out value="${ord.getGoodsId() }"></c:out></td>
   		<td><c:out value="${ord.getGoodsName() }"></c:out></td>
   		<td><c:out value="${clientname.get(ord.getSaleClientId()) }"></c:out></td>
   		<td><c:out value="${clientname.get(ord.getBuyClientId()) }"></c:out></td>
   		<td><c:out value="${ord.getExpressCode() }"></c:out></td>
   		<td><c:out value="${ord.getAddTime() }"></c:out></td>
   		<td><c:out value="${ord.getFinishTime() }"></c:out></td>
   		<td>
   			<c:if test="${ord.getFinishTime()!=null }">
	        <a title="删除" href="javascript:;" onclick="Competence_del(this,${ord.getOrderId() })" class="btn button_btn btn-danger">删除</a>
   			</c:if>
   		</td>
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

$("#prodelete").click(function(){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		var status=[];
		$(".ace[btn_name='checkid']:checked").each(function(){
			status.push($(this).val());
		})
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '批量删除'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../deleteorder.do?orderid='+status,
		});
	});
})

function addSpot(obj, sm ,sid) {
  if($('.delete_Upload').size() >= sm) {$(obj).hide();layer.msg('当前为最大图片添加量!',{icon:0,time:1000});}}

			$(function() {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		        "bStateSave": true,//状态保存
				"searching": true,
				"paging":true,   //取消分页
		        "aoColumnDefs": [{"orderable":false,"aTargets":[6]}]
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
	/*职位删除*/
function Competence_del(obj,id){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '删除订单'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../deleteorder.do?orderid='+id,
		  
		});
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
