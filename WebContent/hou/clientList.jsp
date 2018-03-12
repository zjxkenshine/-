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
<title>客户列表</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin Competence_style" id="page_style">
    <div class="operation clearfix">
		<a  id="queryclient"  class="btn button_btn bg-deep-blue" title="搜索用户"><i class="fa  fa-search"></i>&nbsp;搜索用户</a>
		<a  id="resetquery" class="btn button_btn bg-deep-blue" title="重置搜索">&nbsp;重置搜索</a>
		每页数量：
		  <select class="select Competence_sort" name="pagesize" size="1" id="pagesize">
							<option value="${page.getPageSize()}"><c:out value="${page.getPageSize() }"></c:out></option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="30">30</option>
			</select>
	</div>
<div class="compete_list">
       <table id="sample_table" class="table table_list table_striped table-bordered dataTable">
		 <thead>
			<tr>
			  <th class="center"><label><input  type="checkbox" class="ace"><span class="lbl"></span></label></th>
			  <th>客户编号</th>
			  <th>账号</th>
			  <th>用户名</th>
              <th>真实姓名</th>
              <th>所在学校</th>
              <th>邮箱</th>
              <th>信誉积分</th>
              <th>权限</th>
              <th>状态</th>         
			  <th class="hidden-480">操作</th>
             </tr>
		    </thead>
             <tbody>
             <c:forEach items="${clientlist }" var="client">
			  <tr>
			  	<td class="center"><label><input btn_name="checkid"  type="checkbox" class="ace" value=""><span class="lbl"></span></label></td>
				<td><c:out value="${client.getClientId() }"></c:out></td>
				<td><c:out value="${client.getClientCode() }"></c:out></td>
				<td><c:out value="${client.getClientName() }"></c:out></td>
				<td><c:out value="${client.getRealName()}"></c:out></td>
				<td><c:out value="${client.getSchool() }"></c:out></td>
				<td><c:out value="${client.getE_mail() }"></c:out></td>
                <td><c:out value="${client.getTruhCode() }"></c:out></td>
                <c:if test="${client.getStatus()==1 }">
               		<td>认证用户</td>
                </c:if>
                 <c:if test="${client.getStatus()==0 }">
               		<td>普通用户</td>
                </c:if>
                <c:if test="${client.getUserStatus()==1 }">
                <td class="td-status"><span class="label label-success label-sm">正常使用</span></td>
                </c:if>
               <c:if test="${client.getUserStatus()==0 }">
                <td class="td-status"><span class="label label-success label-sm">已冻结</span></td>
                </c:if>
				<td class="td-manage">
			
					<c:if test="${client.getUserStatus()==1 }">
						<a title="冻结" onclick="Competence_close(this,${client.getClientId()})" href="javascript:;" class="btn button_btn btn-Dark-success">冻结</a> 
						<a title="查看" onclick="Competence_view(this,${client.getClientId()})" href="javascript:;" class="btn button_btn bg-deep-blue">查看</a>
					</c:if>
					<c:if test="${client.getUserStatus()==0 }">
						<a style="text-decoration:none" class="btn button_btn btn-gray" onClick="Competence_start(this,${client.getClientId()})" href="javascript:;" title="解封">解封</a>
						<a title="删除" href="javascript:;" onclick="Competence_del(this,${client.getClientId()})" class="btn button_btn btn-danger">删除</a>
					</c:if>
                
                 
                
				</td>
			   </tr>
             </c:forEach>										
		      </tbody>
	        </table>
	        <div class="row"><div class="col-sm-6"><div class="dataTables_info" id="sample-table_info" role="status" aria-live="polite">第<c:out value="${(page.nowPage-1)*page.pageSize }"></c:out>到 <c:out value="${page.nowPage*page.pageSize>page.totalcount?page.totalcount:page.nowPage*page.pageSize }"></c:out> 条记录，共  <c:out value="${page.totalcount }"></c:out> 条,共 <c:out value="${page.totalpage }"></c:out>页</div>
	        	  跳到该页：
	        	<input type="text" id="pagejump" value="${page.nowPage }">
	        </div>
	        <div class="col-sm-6"><div class="dataTables_paginate paging_bootstrap" id="sample-table_paginate">
	        <ul class="pagination">
	        <li class="first"><a href="../clientlist.do?nowPage=1">首页</a></li>
	        <li class="prev"><a href="../clientlist.do?nowPage=${page.nowPage<=1?1:page.nowPage-1}">上一页</a></li>
	        <li class="active"><a>第<c:out value="${page.nowPage }"></c:out>页</a></li>
	        <li class="next"><a href="../clientlist.do?nowPage=${page.nowPage>=page.totalpage?page.totalpage:page.nowPage+1}">下一页</a></li>
	        <li class="last"><a href="../clientlist.do?nowPage=${page.totalpage}">末页</a></li>
	         
	        <input type="hidden" id="count" value="${page.totalcount}">
	        <input type="hidden" id="nowpage" value="${page.nowPage }">
	        </ul>
	        </div></div></div>
   </div>
   </div>
</body>
</html>
<script>

/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
/*管理员-停用*/
function Competence_close(obj,id){
	layer.confirm('确认要冻结吗？',function(index){
		var nowpage=$("#nowpage").val();
		window.location.href="../changeclientusestatus.do?status=0&nowpage="+nowpage+"&id="+id;
	});
}

function Competence_view(obj,id){
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '查看客户信息'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../viewclient.do?clientid='+id,
		  
		});
}

function Competence_del(obj,id){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		var count=$("#count").val();
		var nowpage=$("#nowpage").val();
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '删除客户'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../deleteclient.do?id='+id+"&count="+count+"&nowpage="+nowpage,
		  
		});
	});
}

/*管理员-启用*/
function Competence_start(obj,id){
	layer.confirm('确认要解封吗？',function(index){
		var nowpage=$("#nowpage").val();
		window.location.href="../changeclientusestatus.do?status=1&nowpage="+nowpage+"&id="+id;
	});
}

/****复选框选中******/
$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
				


				
		//搜索		
			$("#queryclient").click(function(){
				layer.open({
				    type: 2 //Page层类型
				   	,area: ['700px', '530px']
				    ,title: '查询客户'
				    ,shade: 0.6 //遮罩透明度
				    ,maxmin: true //允许全屏最小化
				    ,anim: 2 //0-6的动画形式，-1不开启
				    ,content: 'queryClient.jsp',
				});
			})
		//管理员添加
		$("#resetquery").click(function(){
				layer.open({
					    type: 2 //Page层类型
					   	,area: ['700px', '530px']
					    ,title: '重置搜索'
					    ,shade: 0.6 //遮罩透明度
					    ,maxmin: true //允许全屏最小化
					    ,anim: 2 //0-6的动画形式，-1不开启
					    ,content: '../resetclientquery.do',
					  
					});
		})
		

		//datatable
$(function() {
	var oTable1 = $('#sample_table').dataTable( {
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"searching": false,   //去掉查询
	"bStateSave": true,//状态保存
	"paging":false,   //取消分页
	"bInfo":false,//去掉每页显示多少条
    "aoColumnDefs": [{"orderable":false,"aTargets":[9,10]}]
   })
})

		//换页
$("#pagesize").change(function(){
	var pagesize = $("#pagesize").val();
	window.location.href="../updatepage.do?pagesize="+pagesize+"&pagename=客户列表";
})

$("#pagejump").change(function(){
	var nowpage = $("#pagejump").val();
	window.location.href="../clientlist.do?nowPage="+nowpage;
})
</script>
