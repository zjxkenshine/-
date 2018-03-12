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
<title>兼职列表</title>
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
   <th width="100">兼职编号</th>
   <th>职位名称</th>
   <th>发布人</th>
   <th>工作地点</th>
   <th>工作时间</th>
   <th>描述</th>
   <th>联系电话</th>
   <th>状态</th>
   <th>操作</th>
   </tr>   
  </thead>
  <tbody>
  <c:forEach items="${joblist }" var="job">
    <tr class="main">
    <c:if test="${job.getStatus()==0 }">
    	<td class="center"><label><input btn_name="checkid" type="checkbox" class="ace" value="${good.getGoodsId()}"><span class="lbl"></span></label></td>
   	</c:if>	
   	 <c:if test="${job.getStatus()==1 }">
    	<td class="center"><label><input btn_name="checkid" type="checkbox" class="ace" value=""><span class="lbl"></span></label></td>
   	</c:if>	
   		<td><c:out value="${job.getJobId() }"></c:out></td>
   		<td><c:out value="${job.getJobName() }"></c:out></td>
   		<td><c:out value="${clientname.get(job.getJobId()) }"></c:out></td>
   		<td><c:out value="${job.getWorkPlace() }"></c:out></td>
   		<td><c:out value="${job.getWorkTime() }"></c:out></td>
   		<td><c:out value="${job.getDiscripe() }"></c:out></td>
   		<td><c:out value="${job.getTel() }"></c:out></td>
   			<c:if test="${job.getStatus()==0}">
   			  <td class="td-status"><span class="label label-success label-sm">已下架</span></td>
   			</c:if>
   			<c:if test="${job.getStatus()==1}">
   			  <td class="td-status"><span class="label label-success label-sm">上架中</span></td>
   			</c:if>
   		<td>
   			<c:if test="${job.getStatus()==0}">
   				<a style="text-decoration:none" class="btn button_btn btn-gray" onClick="Competence_start(this,${job.getJobId()})" href="javascript:;" title="上架">上架</a>
   			</c:if>
   			<c:if test="${job.getStatus()==1}">
   				<a title="下架" onclick="Competence_close(this,${job.getJobId()})" href="javascript:;" class="btn button_btn btn-Dark-success">下架</a> 
   			</c:if>
   			<c:if test="${job.getStatus()==0}">
	            <a title="删除" href="javascript:;" onclick="Competence_del(this,${job.getJobId() })" class="btn button_btn btn-danger">删除</a>
            </c:if>
            <a title="查看" onclick="Competence_view(this,${job.getJobId() })" href="javascript:;" class="btn button_btn bg-deep-blue">查看</a>        
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
		    ,content: '../deletejob.do?id='+status,
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
		    ,title: '删除兼职信息'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../deletejob.do?id='+id,
		  
		});
	});
}
function Competence_close(obj,id){
	layer.confirm('确认要下架吗？',{icon:0,},function(index){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '下架兼职消息'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../changejobstatus.do?status=0&id='+id,
		  
		});
	});
}
function Competence_start(obj,id){
	layer.confirm('确认要上架吗？',{icon:0,},function(index){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '下架兼职消息'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../changejobstatus.do?status=1&id='+id,
		  
		});
	});
}

function Competence_view(obj,id){
	layer.open({
	    type: 2 //Page层类型
	   	,area: ['700px', '530px']
	    ,title: '查看兼职信息'
	    ,shade: 0.6 //遮罩透明度
	    ,maxmin: true //允许全屏最小化
	    ,anim: 2 //0-6的动画形式，-1不开启
	    ,content: '../viewJob.do?id='+id,
	  
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
