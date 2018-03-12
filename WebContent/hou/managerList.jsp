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
<title>管理员列表</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin Competence_style" id="page_style">
    <div class="operation clearfix">
		<button class="btn button_btn btn-danger" id="prodelete" type="button" value="" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>
		<a  id="addmanager"  class="btn button_btn bg-deep-blue" title="添加管理员"><i class="fa  fa-edit"></i>&nbsp;添加</a>
		<a  id="querymanager"  class="btn button_btn bg-deep-blue" title="搜索管理员"><i class="fa  fa-search"></i>&nbsp;搜索管理员</a>
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
			  <th>用户id</th>
			  <th>用户头像</th>
			  <th>用户名</th>
              <th>员工姓名</th>
              <th>角色</th>
              <th>邮箱</th>
			  <th class="hidden-480">添加时间</th>  
              <th>状态</th>         
			  <th class="hidden-480">操作</th>
             </tr>
		    </thead>
             <tbody>
             <c:forEach items="${manager }" var="man">
			  <tr>
			  <c:if test="${man.getDeleteStatus()==0&&man.getManagerId()!=1 }">
			  <c:if test="${ man.getManagerId()==user.getManagerId()}">
			  		<td class="center"><label><input btn_name="checkid"  type="checkbox" class="ace" value=""><span class="lbl"></span></label></td>
				</c:if>
				 <c:if test="${ man.getManagerId()!=user.getManagerId()}">
			  		<td class="center"><label><input btn_name="checkid" type="checkbox" class="ace" value="${man.getManagerId() }"><span class="lbl"></span></label></td>
				</c:if>
			</c:if>
			<c:if test="${ man.getManagerId()==1||man.getDeleteStatus()==1 }">
				<td class="center"><label><input btn_name="checkid" type="checkbox" class="ace" value=""><span class="lbl"></span></label></td>
			</c:if>
				<td><c:out value="${man.getManagerId() }"></c:out></td>
				<td><img src="${man.getPicture() }" width="100px" height="80px"></td>
				<td><c:out value="${man.getManagerName() }"></c:out></td>
				<td><c:out value="${worker.get(man.getWorkerId()) }"></c:out></td>
				<td><c:out value="${statusname.get(man.getStatus()) }"></c:out></td>
                <td><c:out value="${man.getE_mail() }"></c:out></td>
                <td><c:out value="${man.getRegisterTime() }"></c:out></td>
                <c:if test="${man.getDeleteStatus()==1 }">
                <td class="td-status"><span class="label label-success label-sm">已启用</span></td>
                </c:if>
               <c:if test="${man.getDeleteStatus()==0 }">
                <td class="td-status"><span class="label label-success label-sm">已冻结</span></td>
                </c:if>
				<td class="td-manage">
				<c:if test="${man.getManagerId()==1&&user.getManagerId()==1 }">
					 <a title="编辑"  onclick="Competence_upe(this,${man.getManagerId()})" href="javascript:;" class="btn button_btn bg-deep-blue">编辑</a>        
					 <a title="上传" href="javascript:;" onclick="Competence_upload(this,${man.getManagerId()})" class="btn button_btn btn-green">头像上传</a>
				</c:if>
				<c:if test="${man.getManagerId()==1&&user.getManagerId()!=1 }">
				</c:if>
				<c:if test="${man.getManagerId()!=1 }">
					<c:if test="${man.getDeleteStatus()==1 }">
						<a title="停用" onclick="Competence_close(this,${man.getManagerId()})" href="javascript:;" class="btn button_btn btn-Dark-success">停用</a> 
						<a title="编辑" onclick="Competence_upe(this,${man.getManagerId()})" href="javascript:;" class="btn button_btn bg-deep-blue">编辑</a>
						<a title="上传" href="javascript:;" onclick="Competence_upload(this,${man.getManagerId()})" class="btn button_btn btn-green">头像上传</a>
					</c:if>
					<c:if test="${man.getDeleteStatus()==0 }">
						<a style="text-decoration:none" class="btn button_btn btn-gray" onClick="Competence_start(this,${man.getManagerId()})" href="javascript:;" title="启用">启用</a>
						<c:if test="${ man.getManagerId()!=user.getManagerId()}">
						<a title="删除" href="javascript:;" onclick="Competence_del(this,${man.getManagerId()})" class="btn button_btn btn-danger">删除</a>
						</c:if>
					</c:if>
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
	        <li class="first"><a href="../managerlist.do?nowPage=1">首页</a></li>
	        <li class="prev"><a href="../managerlist.do?nowPage=${page.nowPage<=1?1:page.nowPage-1}">上一页</a></li>
	        <li class="active"><a>第<c:out value="${page.nowPage }"></c:out>页</a></li>
	        <li class="next"><a href="../managerlist.do?nowPage=${page.nowPage>=page.totalpage?page.totalpage:page.nowPage+1}">下一页</a></li>
	        <li class="last"><a href="../managerlist.do?nowPage=${page.totalpage}">末页</a></li>
	         
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
	layer.confirm('确认要停用吗？',function(index){
		var nowpage=$("#nowpage").val();
		window.location.href="../changemanagerstatus.do?status=0&nowpage="+nowpage+"&id="+id;
	});
}

function Competence_upload(obj,id){
	layer.open({
	    type: 2 //Page层类型
	   	,area: ['700px', '530px']
	    ,title: '上传照片'
	    ,shade: 0.6 //遮罩透明度
	    ,maxmin: true //允许全屏最小化
	    ,anim: 2 //0-6的动画形式，-1不开启
	    ,content: '../uploadmanagerpicset.do?managerid='+id,	  
	});
}


function Competence_del(obj,id){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		var count=$("#count").val();
		var nowpage=$("#nowpage").val();
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '删除角色'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../deletemanager.do?managerid='+id+"&count="+count+"&nowpage="+nowpage,
		  
		});
	});
}

/*管理员-启用*/
function Competence_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		var nowpage=$("#nowpage").val();
		window.location.href="../changemanagerstatus.do?status=1&nowpage="+nowpage+"&id="+id;
	});
}

function Competence_upe(obj,id){
	layer.open({
	    type: 2 //Page层类型
	   	,area: ['700px', '530px']
	    ,title: '更新管理员'
	    ,shade: 0.6 //遮罩透明度
	    ,maxmin: true //允许全屏最小化
	    ,anim: 2 //0-6的动画形式，-1不开启
	    ,content: '../updatemanagerset.do?managerid='+id,
	  
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
				
$("#prodelete").click(function(){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		var status=[];
		$(".ace[btn_name='checkid']:checked").each(function(){
			status.push($(this).val());
		})
		var count=$("#count").val();
		var nowpage=$("#nowpage").val();
		layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '批量删除'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../deletemanager.do?managerid='+status+"&count="+count+"&nowpage="+nowpage,
		});
	});
})
				
		//搜索		
			$("#querymanager").click(function(){
				layer.open({
				    type: 2 //Page层类型
				   	,area: ['700px', '530px']
				    ,title: '搜索管理员'
				    ,shade: 0.6 //遮罩透明度
				    ,maxmin: true //允许全屏最小化
				    ,anim: 2 //0-6的动画形式，-1不开启
				    ,content: '../querymanagerset.do',
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
					    ,content: '../resetmanagerquery.do',
					  
					});
		})
		
		$("#addmanager").click(function(){
				layer.open({
					    type: 2 //Page层类型
					   	,area: ['700px', '530px']
					    ,title: '添加管理员'
					    ,shade: 0.6 //遮罩透明度
					    ,maxmin: true //允许全屏最小化
					    ,anim: 2 //0-6的动画形式，-1不开启
					    ,content: '../addmanagerset.do',
					  
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
    "aoColumnDefs": [{"orderable":false,"aTargets":[8]}]
   })
})

		//换页
$("#pagesize").change(function(){
	var pagesize = $("#pagesize").val();
	window.location.href="../updatepage.do?pagesize="+pagesize+"&pagename=管理员表";
})

$("#pagejump").change(function(){
	var nowpage = $("#pagejump").val();
	window.location.href="../managerlist.do?nowPage="+nowpage;
})
</script>
