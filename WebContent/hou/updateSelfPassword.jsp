<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<script type="text/javascript" src="js/Validform/Validform.min.js"></script>
<title>权限设置</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<form action="../updateselfpassword.do" id="addmanager">
<div class="margin" id="page_style">

<div class=" add_Competence_style margin" id="add_Competence_style">
   <ul class="add_style">
    <li class="clearfix"><label class="label_name col-xs-1 col-lg-2">原密码：</label>
    <div class="formControls col-xs-6">
    	<input type="oldpassword" placeholder="密码" name="oldpassword" autocomplete="off" value="" class="input-text col-xs-12" datatype="*6-20" nullmsg="原密码不能为空"  ajaxurl="../checkpassword.do">
    </div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
    </li>
    <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>新密码：</label>
	 <div class="formControls col-xs-6">
	 <input type="password" placeholder="密码" name="password" autocomplete="off" value="" class="input-text col-xs-12" datatype="*6-20" nullmsg="新密码不能为空">
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
    
   </ul>
</div>
<!--按钮操作-->
<div class="Button_operation btn_width">
    <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="确认添加">
    <input name="reset" type="reset" class="btn button_btn btn-gray" value="取消重置" />
 </div>
</div>
</form>
</body>
</html>
<script type="text/javascript">
/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});

$("#addmanager").Validform({		
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
/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您出入的字数超多限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //200 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
/*按钮复选框选择*/
$(function(){
	$(".Competence_name dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission_list input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".Competence_name").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}			
		}		
	});
});
</script>
