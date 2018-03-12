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
 <script src="js/laydate/laydate.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/json2.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<title>个人信息</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin" id="page_style">
   <div class="personal_info">
   <div class="add_style clearfix border_style">
   <form id="user_info" action="json/test_user.json" method="post">
    <div class="clearfix">
    
        <div class="form-group clearfix col-xs-3">
        <label class="col-xs-3 label_name" for="form-field-1">用户id：</label>
         <div class="col-xs-9 line_height1"><input type="text" value="${user.getManagerId() }" name="userid" data-name="用户id" id="userid"  class="col-xs-7 text_info" disabled="disabled"></div>         
          </div>
              <div class="form-group clearfix col-xs-3">
              <label class="col-xs-3 label_name" for="form-field-1">用户名：</label>
         <div class="col-xs-9 line_height1"><input type="text" value="${user.getManagerName() }" name="username" data-name="用户名" id="username"  class="col-xs-7 text_info" disabled="disabled"></div>         
          </div>
              <div class="form-group clearfix col-xs-3">
        <label class="col-xs-3 label_name" for="form-field-1">真实姓名：</label>
         <div class="col-xs-9 line_height1"><input type="text" value="${worker.getWorkName() }" name="surname" data-name="真实姓名" id="surname"  class="col-xs-7 text_info" disabled="disabled"></div>         
          </div>
          <div class="form-group clearfix col-xs-3"><label class="col-xs-3 label_name" for="form-field-1">性别： </label>
          <div class="col-xs-9 line_height1">
          <span class="sex"><c:out value="${worker.getSex() }"></c:out></span>
           </div>
          </div>
          <div class="form-group clearfix col-xs-3"><label class="col-xs-3 label_name" for="form-field-1">年龄： </label>
          <div class="col-xs-9 line_height1"><input type="text" name="age" data-name="年龄" id="age" value="${worker.getAge() }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group clearfix col-xs-3"><label class="col-xs-3 label_name" for="form-field-1">移动电话： </label>
          <div class="col-xs-9 line_height1"><input type="text" name="phone" data-name="移动电话" id="phone" value="${worker.getTel() }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group clearfix col-xs-3"><label class="col-xs-3 label_name" for="form-field-1">电子邮箱： </label>
          <div class="col-xs-9 line_height1"><input type="text" name="mailbox"  data-name="电子邮箱" id="mailbox" value="${user.getE_mail() }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
           <div class="form-group clearfix col-xs-3"><label class="col-xs-3 label_name" for="form-field-1">职位： </label>
          <div class="col-xs-9 line_height1"> <span><c:out value="${workertype.get(worker.getWorkerType()) }"></c:out></span></div>
          </div>
          <div class="form-group clearfix col-xs-3"><label class="col-xs-3 label_name" for="form-field-1">角色： </label>
          <div class="col-xs-9 line_height1"> <span><c:out value="${status.get(user.getStatus()) }"></c:out></span></div>
          </div>
           <div class="form-group clearfix col-xs-3"><label class="col-xs-3 label_name" for="form-field-1">入职时间： </label>
          <div class="col-xs-9 line_height1"> <span><c:out value="${worker.getWorkTime() }"></c:out></span></div>
          </div>
          </div>
        
           <div class="Button_operation clearfix"> 
                <input type="button" id="updateselfmessage" class="btn btn-danger operation_btn"  value="修改信息"/>
                <input type="button" id="updateselfpassword" class="btn btn-danger operation_btn"  value="修改密码"/>
                <input type="button"  id="uploadmnagerpic" class="btn btn-danger operation_btn"  value="修改头像"/>			     
			</div>
            </form>
   </div>
 <!--修改密码样式-->
         
</body>
</html>
<script>
/****修改密码****/

/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
	/*时间*/
	

$(function(){
	$("#sample_table tbody>tr:odd").addClass("odd");
	$("#sample_table tbody>tr:even").addClass("even");
	$("#sample_table tbody>tr").click(function(){	
	$(this).addClass("selected").siblings().removeClass("selected").end()
	})
	
		
		$("#updateselfpassword").click(function(){
				layer.open({
					    type: 2 //Page层类型
					   	,area: ['700px', '530px']
					    ,title: '更新密码'
					    ,shade: 0.6 //遮罩透明度
					    ,maxmin: true //允许全屏最小化
					    ,anim: 2 //0-6的动画形式，-1不开启
					    ,content: 'updateSelfPassword.jsp',
					  
					});
		})
		
		
		
		$("#uploadmnagerpic").click(function(){
			var userid=$("#userid").val();
			layer.open({
				    type: 2 //Page层类型
				   	,area: ['700px', '530px']
				    ,title: '更新头像'
				    ,shade: 0.6 //遮罩透明度
				    ,maxmin: true //允许全屏最小化
				    ,anim: 2 //0-6的动画形式，-1不开启
				    ,content: '../uploadmanagerpicset.do?managerid='+userid,
				  
				});
	})
		
		$("#updateselfmessage").click(function(){
				layer.open({
					    type: 2 //Page层类型
					   	,area: ['700px', '530px']
					    ,title: '更新个人信息'
					    ,shade: 0.6 //遮罩透明度
					    ,maxmin: true //允许全屏最小化
					    ,anim: 2 //0-6的动画形式，-1不开启
					    ,content: '../updateselfset.do',
					  
					});
		})
})
</script>
