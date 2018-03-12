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
<form action="../addstatus.do" id="addmanager">
<div class="margin" id="page_style">

<div class=" add_Competence_style margin" id="add_Competence_style">
   <ul class="add_style">
    <li class="clearfix"><label class="label_name col-xs-1 col-lg-2">权限名称：</label>
    <div class="formControls col-xs-6">
    	<input type="text" class="input-text col-xs-6" value="" placeholder="" id="statusname" name="statusname" datatype="*2-8" nullmsg="用户名不能为空" ajaxurl="../checkstatusname.do">
    </div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
    </li>
    <li class="clearfix"><label class="col-xs-1 col-lg-2 label_name" for="form-field-1">权限描述：</label>
    <span class="col-xs-6"><textarea  class="form-control col-xs-10" id="discripe" name="discripe" placeholder="" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">200</span>字</span></span>
    </li>
   </ul>
</div>
<div class="Competence_list">
  <div class="title_name"><span>权限列表</span></div>
  <div class="list_cont clearfix">
   <div class="clearfix col-xs-4 col-lg-6 ">
    <dl class="Competence_name"> 
     <dt class="Columns_One"><label class="middle"><input class="ace" name="statuslei" type="checkbox" id="id-disable-check"><span class="lbl">通用管理</span></label></dt>
     <dd class="permission_list clearfix">
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="1" datatype="*" nullmsg="请选择一项权限"><span class="lbl">系统管理</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="3"><span class="lbl">界面工具</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="4"><span class="lbl">日志管理</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="5"><span class="lbl">网站反馈</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="6"><span class="lbl">群发邮件</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="11"><span class="lbl">会员信息列表</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="12"><span class="lbl">会员搜索列表</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="14"><span class="lbl">图片管理</span></label>
      <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="16"><span class="lbl">前台信息管理</span></label>
     </dd>
    </dl>
   </div>
   <div class="clearfix col-xs-4 col-lg-6">
   <dl class="Competence_name">
    <dt class="Columns_One"><label class="middle"><input class="ace" type="checkbox" id="id-disable-check"><span class="lbl">人事管理</span></label></dt>
    <dd class="permission_list clearfix">
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="2"><span class="lbl">会员管理</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="7"><span class="lbl">员工列表</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="8"><span class="lbl">管理员列表</span></label>
    </dd>
   </dl>
   </div>
   <div class="clearfix col-xs-4 col-lg-6">
   <dl class="Competence_name">
    <dt class="Columns_One"><label class="middle"><input class="ace" type="checkbox" id="id-disable-check"><span class="lbl">商城管理</span></label></dt>
    <dd class="permission_list clearfix">
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="9"><span class="lbl">商品管理</span></label>
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="10"><span class="lbl">订单管理</span></label>
        <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="15"><span class="lbl">商品销量管理</span></label>
    </dd>
   </dl>
   </div>
   <div class="clearfix col-xs-4 col-lg-6">
   <dl class="Competence_name">
    <dt class="Columns_One"><label class="middle"><input class="ace" type="checkbox" id="id-disable-check"><span class="lbl">兼职类管理</span></label></dt>
    <dd class="permission_list clearfix">
     <label class="middle"><input class="ace" type="checkbox" name="status" id="id-disable-check" value="13"><span class="lbl">兼职管理</span></label>
    </dd>
   </dl>
   </div>
   <div class="col-4"> <span class="Validform_checktip"></span></div>
  </div>
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
