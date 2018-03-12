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
    <form action="../sendmessage.do" method="post" id="form-admin-add">
    <ul>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>接收人：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="tomanager" size="1">
					<c:forEach items="${managerlist }" var="manager">
						<c:if test="${msg.getToManagerId()==manager.getManagerId() }"><option value="${manager.getManagerId() }"><c:out value="${manager.getManagerName()}"></c:out></option></c:if>
					</c:forEach>
				</select>
				</span>
         </div>
         <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>发送人：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="tomanager" size="1">
					<c:forEach items="${managerlist }" var="manager">
						<c:if test="${msg.getFromManagerId()==manager.getManagerId() }"><option value="${manager.getManagerId() }"><c:out value="${manager.getManagerName()}"></c:out></option></c:if>
					</c:forEach>
				</select>
				</span>
         </div>
         <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
       <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>标题：</label>
       <div class="formControls  col-xs-6">
	<input type="text" placeholder="请输入标题" autocomplete="off" readonly="readonly" class="input-text Validform_error  col-xs-12" value="${msg.getTitle() }"  name="title">
	</div>
	  <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
			<label class="label_name col-xs-2 col-lg-2">内&nbsp;容：</label>
			<div class="formControls col-xs-6">
				<textarea name="discripe" cols="" rows="" readonly="readonly" class="textarea col-xs-12" placeholder="说点什么...250个字符以内" dragonfly="true" onkeyup="checkLength(this);"><c:out value="${msg.getDiscripe() }"></c:out></textarea>
				<span class="wordage">剩余字数：<span id="sy" style="color:Red;">250</span>字</span>
			</div>
		</li>
		 <li class="clearfix">
		<label class="label_name col-xs-2 col-lg-2">附&nbsp;件：</label>
			<input type="text" id="url" name="file" value="${msg.getFileAddress() }" />
		</li>
         <li class="clearfix">
       <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>发送时间：</label>
       <div class="formControls  col-xs-6">
		<input type="text" placeholder=""  autocomplete="off" readonly="readonly" class="input-text Validform_error  col-xs-12" value="${msg.getSendTime() }"  name="title">
		</div>
	  	<div class="col-4"> <span class="Validform_checktip"></span></div>
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
	var maxChars = 250; //
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

