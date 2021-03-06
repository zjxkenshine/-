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
<title>管理员日志表</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin Competence_style" id="page_style">
    <div class="operation clearfix">
    <a  id="sharepic"  class="btn button_btn bg-deep-blue" title="分享图片"><i class="fa  fa-edit"></i>&nbsp;分享图片</a>
	<a  id="querypic"  class="btn button_btn bg-deep-blue" title="搜索图片"><i class="fa  fa-search"></i>&nbsp;搜索图片</a>
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
			  <th>图片序号</th>
			  <th>缩略图</th>
			  <th>分享人ID</th>
              <th>用户名</th>
              <th>分享时间</th>
              <th>描述</th>
			  <th>操作</th>           
             </tr>
		    </thead>
             <tbody>
             <c:forEach items="${sharepiclist }" var="share">
			  <tr>
			  	<td class="center"><label><input btn_name="checkid"  type="checkbox" class="ace" value=""><span class="lbl"></span></label></td>
				<td><c:out value="${share.getSharePicId() }"></c:out></td>
				<td><img src="${share.getPicAddress() }" width="100px" height="80px"></td>
				<td><c:out value="${share.getManagerId() }"></c:out></td>
				<td><c:out value="${managername.get(share.getManagerId()) }"></c:out></td>
				<td><c:out value="${share.getUploadTime() }"></c:out></td>
                <td><c:out value="${share.getDiscripe() }"></c:out></td>
                <td>
                <a title="下载附件" href="${share.getPicAddress()}" download=""  class="btn button_btn btn-green">下载</a>
                <c:if test="${share.getManagerId()==user.getManagerId()}">
               	 <a title="删除" href="javascript:;" onclick="Competence_del(this,${share.getSharePicId()})" class="btn button_btn btn-danger">删除分享</a></td>
			   </c:if>
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
	        <li class="first"><a href="../sharepiclist.do?nowPage=1">首页</a></li>
	        <li class="prev"><a href="../sharepiclist.do?nowPage=${page.nowPage<=1?1:page.nowPage-1}">上一页</a></li>
	        <li class="active"><a>第<c:out value="${page.nowPage }"></c:out>页</a></li>
	        <li class="next"><a href="../sharepiclist.do?nowPage=${page.nowPage>=page.totalpage?page.totalpage:page.nowPage+1}">下一页</a></li>
	        <li class="last"><a href="../sharepiclist.do?nowPage=${page.totalpage}">末页</a></li>
	         
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


/****复选框选中******/
$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
				
		$("#sharepic").click(function(){
			layer.open({
			    type: 2 //Page层类型
			   	,area: ['700px', '530px']
			    ,title: '分享文件'
			    ,shade: 0.6 //遮罩透明度
			    ,maxmin: true //允许全屏最小化
			    ,anim: 2 //0-6的动画形式，-1不开启
			    ,content: 'addsharepic.jsp',
			});
		})
		//取消分享
		function Competence_del(obj,id){
			layer.confirm('确认要取消分享吗？',{icon:0,},function(index){
				var count=$("#count").val();
				var nowpage=$("#nowpage").val();
					layer.open({
		  			  type: 2 //Page层类型
		   				,area: ['700px', '530px']
					    ,title: '取消分享'
					    ,shade: 0.6 //遮罩透明度
					    ,maxmin: true //允许全屏最小化
					    ,anim: 2 //0-6的动画形式，-1不开启
					    ,content: '../deletesharepic.do?picid='+id+"&count="+count+"&nowpage="+nowpage,
		  
					});
				});
			}
		//搜索		
			$("#querypic").click(function(){
				layer.open({
				    type: 2 //Page层类型
				   	,area: ['700px', '530px']
				    ,title: '查询共享图片'
				    ,shade: 0.6 //遮罩透明度
				    ,maxmin: true //允许全屏最小化
				    ,anim: 2 //0-6的动画形式，-1不开启
				    ,content: '../querysharepicset.do',
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
					    ,content: '../resetsharepic.do',
					  
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
	window.location.href="../updatepage.do?pagesize="+pagesize+"&pagename=图片共享表";
})

$("#pagejump").change(function(){
	var nowpage = $("#pagejump").val();
	window.location.href="../sharepiclist.do?nowPage="+nowpage;
})
</script>
