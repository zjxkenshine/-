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

</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin add_administrator" id="page_style">
    <div class="add_style add_administrator_style">
    <form action="../addmanager.do" method="post" id="form-admin-add">
    <ul>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>用户名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="" placeholder="" id="managername" name="managername" datatype="*2-16" nullmsg="用户名不能为空" ajaxurl="../checkmanager.do"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>初始密码：</label>
	 <div class="formControls col-xs-6">
	 <input type="password" placeholder="密码" name="password" autocomplete="off" value="" class="input-text col-xs-12" datatype="*6-20" nullmsg="密码不能为空">
	</div>
     <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
       <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>确认密码：</label>
       <div class="formControls  col-xs-6">
	<input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error  col-xs-12" errormsg="您两次输入的密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="password" id="newpassword2" name="newpassword2">
	</div>
	  <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>邮&nbsp;箱：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" placeholder="@" name="e_mail" id="e_mail" datatype="e" nullmsg="请输入邮箱！" ajaxurl="../checkmanager.do" >
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>角&nbsp;色：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="status" size="1">
					<option value="0">分配角色</option>
					<c:if test="${user.getManagerId()==1 }">
					<c:forEach items="${statuslist }" var="status">
						<c:if test="${status.getManagerStatusId()!=1 }">
						<option value="${status.getManagerStatusId() }"><c:out value="${status.getManagerStatusName()}"></c:out></option>
						</c:if>
					</c:forEach>
					</c:if>
				</select>
				</span>
         </div>
     </li>
   
     
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>员&nbsp;工：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="workerid" size="1" datatype="*" nullmsg="请绑定一个员工">
					<option value="">绑定员工</option>
					<c:forEach items="${workerlist }" var="worker">
						<option value="${worker.getWorkId() }"><c:out value="${worker.getWorkName()}"></c:out></option>
					</c:forEach>
				</select>
				</span>
         </div>
         <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
			<label class="label_name col-xs-2 col-lg-2">简&nbsp;介：</label>
			<div class="formControls col-xs-6">
				<textarea name="discripe" cols="" rows="" class="textarea col-xs-12" placeholder="说点什么...100个字符以内" dragonfly="true" onkeyup="checkLength(this);"></textarea>
				<span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
			</div>
		</li>
         <li class="clearfix">
			<div class="col-xs-2 col-lg-2">&nbsp;</div>
			<div class="col-xs-6">
	  <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="提交注册">
      <input name="reset" type="reset" class="btn button_btn btn-gray" value="取消重置" />
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
</script>
