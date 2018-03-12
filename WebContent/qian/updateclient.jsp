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
    <form action="../updateclient.go" method="post" id="form-admin-add">
    <ul>
    <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>用户ID：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getClientId() }" placeholder="" id="clientid" name="clientid" readonly="readonly"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>用户名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getClientName() }" placeholder="" id="clientname" name="clientname" datatype="*2-16" nullmsg="用户名不能为空"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>邮&nbsp;箱：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" value="${client.getE_mail() }" placeholder="@" name="e_mail" id="e_mail" datatype="e" nullmsg="请输入邮箱！" readonly="readonly">
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
   
		<li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>真实姓名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${client.getRealName() }" placeholder="" id="realname" name="realname" datatype="*2-8" nullmsg="真实姓名不能为空"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>身份证号：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" name="idcard" value="${client.getIdcard() }" id="idcard" datatype="idcard" nullmsg="请输入身份证号！">
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>电话号码：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" value="${client.getTel() }" name="tel" id="tel" datatype="m" nullmsg="请输入正确的电话号码！" >
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>省&nbsp;份：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" id="province" name="province" size="1" datatype="*" nullmsg="省份不能为空！">
					<option value="">请选择省份</option>
					<c:forEach items="${lpro }" var="pro">
						<option value="${pro.getProId() }"><c:out value="${pro.getProName() }"></c:out></option>
					</c:forEach>
				</select>
				</span>
         </div>
         <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>城&nbsp;市：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" id="city" name="city" size="1" datatype="*" nullmsg="城市不能为空！">
					<option value="">请选择城市</option>
				</select>
				</span>
         </div>
         <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>学&nbsp;校：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" id="school" name="school" size="1" datatype="*" nullmsg="学校不能为空！">
					<option value="">请选择学校</option>
				</select>
				</span>
         </div>
         <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
   
     
   
     
         <li class="clearfix">
			<div class="col-xs-2 col-lg-2">&nbsp;</div>
			<div class="col-xs-6">
	  <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="确认修改">
      <input name="reset" type="reset" class="btn button_btn btn-gray" value="重置" />
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

$("#idcard").change(function(){
	var idcard=$("#idcard").val();
	if(idcard.trim().charAt(16)%2==0){
		$("#sex2").attr("checked","true");
	}else{
		$("#sex1").attr("checked","true");
	}
	$("#age").val(parseInt(laydate.now().substring(0,5))-parseInt(idcard.substring(6,10))+1);
})

$(function(){
		$("#province").change(querycity);
		$("#city").change(queryschool);
	})
	
	function querycity(){
		var pro_id=$("#province").val();
		$("#city").html("<option value=''>请选择城市</option>");
		$("#school").html("<option value=''>请选择学校</option>");
		$.ajax({
			url:"../querycity.go",
			type:"GET",
			dataType:"json",
			data:{pro_id:pro_id},
			success:function(data){
				$(data).each(function(i){
					$("#city").append("<option value="+this.CityId+">"+this.CityName+"</option>");
				})
			},
			error:function(){
				alert("出错啦");
			}
		})
	}
	
	function queryschool(){
		var city_id=$("#city").val();
		$("#school").html("<option value=''>请选择学校</option>");
		$.ajax({
			url:"../queryschool.go",
			type:"GET",
			dataType:"json",
			data:{city_id:city_id},
			success:function(data){
				$(data).each(function(i){
					$("#school").append("<option value="+this.SchoolId+">"+this.SchoolName+"</option>");
				})
			},
			error:function(){
				alert("出错啦");
			}
		})
	}
	
	
</script>
