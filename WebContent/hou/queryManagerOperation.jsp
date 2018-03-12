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
<script type="text/javascript" src="js/Validform/Validform.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin add_administrator" id="page_style">
    <div class="add_style add_administrator_style">
    <form action="../querymanageroperation.do" method="post" id="form-admin-add">
    <ul>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>管理员：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="managerid" size="1">
					<option value="">所有管理员</option>
					<c:forEach items="${managerlist }" var="manager">
						<option value="${manager.getManagerId() }"><c:out value="${manager.getManagerName() }"></c:out></option>
					</c:forEach>
				</select>
				</span>
         </div>
     </li>
   
   	<li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>操作类型</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="operationtype" size="1">
					<option value="">所有操作</option>
					<option value="登录" <c:if test="${manageroperationquery.get('operationtype') eq '登录' }">selected="selected"</c:if>>登录</option>
					<option value="清理" <c:if test="${manageroperationquery.get('operationtype') eq '清理' }">selected="selected"</c:if>>清理</option>
					<option value="添加" <c:if test="${manageroperationquery.get('operationtype') eq '添加' }">selected="selected"</c:if>>添加</option>
					<option value="删除" <c:if test="${manageroperationquery.get('operationtype') eq '删除' }">selected="selected"</c:if>>删除</option> 
					<option value="修改" <c:if test="${manageroperationquery.get('operationtype') eq '修改' }">selected="selected"</c:if>>修改</option>
				</select>
				</span>
         </div>
     </li>
     
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>操作对象表</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="operationlist" size="1">
					<option value="">所有表</option>
					<option value="无" <c:if test="${manageroperationquery.get('operationlist') eq '无' }">selected="selected"</c:if>>无</option>
					<option value="权限表" <c:if test="${manageroperationquery.get('operationlist') eq '权限表' }">selected="selected"</c:if>>权限表</option>
					<option value="职位表" <c:if test="${manageroperationquery.get('operationlist') eq '职位表' }">selected="selected"</c:if>>职位表</option>
					<option value="管理员表" <c:if test="${manageroperationquery.get('operationlist') eq '管理员表' }">selected="selected"</c:if>>管理员表</option> 
					<option value="员工表" <c:if test="${manageroperationquery.get('operationlist') eq '员工表' }">selected="selected"</c:if>>员工表</option>
					<option value="个人邮件表" <c:if test="${manageroperationquery.get('operationlist') eq '个人邮件表' }">selected="selected"</c:if>>个人邮件表</option>
					<option value="客户表" <c:if test="${manageroperationquery.get('operationlist') eq '客户表' }">selected="selected"</c:if>>客户表</option>
					<option value="共享表" <c:if test="${manageroperationquery.get('operationlist') eq '共享表' }">selected="selected"</c:if>>共享表</option>
					<option value="商品表" <c:if test="${manageroperationquery.get('operationlist') eq '商品表' }">selected="selected"</c:if>>商品表</option>
					<option value="订单表" <c:if test="${manageroperationquery.get('operationlist') eq '订单表' }">selected="selected"</c:if>>订单表</option>
					<option value="网站信息表" <c:if test="${manageroperationquery.get('operationlist') eq '网站信息表' }">selected="selected"</c:if>>网站信息表</option>
				</select>
				</span>
         </div>
     </li>
      <li class="clearfix">
		    <div class="form-group">
		         <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>操作时间：</label>
		            <input type="text" name="operationtime1" value="${manageroperationquery.get('operationtime1') }" class="form-control laydate-icon" id="operationtime1" style=" height:30px;" >到
		               <input type="text" name="operationtime2" value="${manageroperationquery.get('operationtime2') }" class="form-control laydate-icon" id="operationtime2" style=" height:30px;">
		</div>
       

    </li>

         <li class="clearfix">
			<div class="col-xs-2 col-lg-2">&nbsp;</div>
			<div class="col-xs-6">
	  <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="点击查询">
      <input id="resetquery"  type="button" class="btn button_btn btn-gray" value="重置" />
			</div>
		</li>
    </ul>
    </form>
    </div>
    <div class="split_line"></div>
    <div class="Notice_style l_f">
      
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

//laydate
 laydate( {
    elem: '#operationtime1',
    format: 'YYYY-MM-DD',
    max: laydate.now(), //设定最大日期为当前日期
    min: '2000-00-00 00:00:00', //最小日期
    istime: true,
    istoday: true,
});
 laydate({
    elem: '#operationtime2',
    format: 'YYYY-MM-DD',
    max: laydate.now(), //设定最大日期为当前日期
    min: '2000-00-00 00:00:00', //最小日期
    istime: true,
    istoday: true,
});

//表单验证提交
$("#form-admin-add").Validform({		
		 tiptype:2,
		callback:function(data){
		//form[0].submit();
		if(data.status==1){ 
                layer.msg(data.info, {icon: data.status,time: 1000}, function(){ 
                    location.reload();//刷新页面 
                    });   
            } 
            else{ 
                layer.msg(data.info, {icon: data.status,time: 3000}); 
            } 		  
			var index =parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}				
	});
//字数限制
function checkLength(which) {
	var maxChars = 100; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};

$("#resetquery").click(function(){
	layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '重置搜索'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../resetmanageroperation.do',
		  
		});
})
</script>
