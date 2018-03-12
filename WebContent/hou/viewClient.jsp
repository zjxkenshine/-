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
    <ul>
    
    	<li class="clearfix">
     		<label class="label_name col-xs-2 col-lg-2"><i>*</i>用户编号：</label>
     	<div class="formControls col-xs-6">
     		<input type="text" class="input-text col-xs-12" value="${client.getClientId()}"></div>
    	<div class="col-4"> <span class="Validform_checktip"></span></div>
     	</li>
     	
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>用户名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getClientName() }" ></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     
      <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>用户账号：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getClientCode() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>真实姓名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getRealName() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>身份证：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getIdcard() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>电话号码：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getTel() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>邮箱：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getE_mail() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>所在省：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getProvince() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>所在城市：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getCity() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>所在大学：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getSchool() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>注册时间：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getRegisterTime() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i>*</i>信誉积分：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getTruhCode() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>

         <li class="clearfix">
			<div class="col-xs-2 col-lg-2">&nbsp;</div>
			<div class="col-xs-6">
			</div>
		</li>
    </ul>
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
