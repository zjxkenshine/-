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
    <form action="../updateworker.do" method="post" id="form-admin-add">
    <ul>
    <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>员工编号：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${worker.getWorkId() }" placeholder="" id="workerid" name="workerid" readonly="readonly"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>员工姓名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${worker.getWorkName() }" placeholder="" id="workername" name="workername" datatype="*2-8" nullmsg="员工名不能为空" ajaxurl="../checkworker.do?workername=${worker.getWorkName() }"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>身份证号：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" name="idcard" value="${worker.getIdcard() }" id="idcard" datatype="idcard" nullmsg="请输入身份证号！" ajaxurl="../checkworker.do?idcard=${worker.getIdcard() }" >
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>电话号码：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" value="${worker.getTel() }" name="tel" id="tel" datatype="m" nullmsg="请输入正确的电话号码！" ajaxurl="../checkworker.do?tel=${worker.getTel() }" >
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>年龄</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" value="${worker.getAge() }" name="age" id="age" datatype="n" readonly="readonly" ajaxurl="../checkworker.do">
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>性别：</label>
		<div class="Add_content col-xs-9">
		    <label><input type="radio" name="sex" class="ace" id="sex1" value="男" onclick="return false" <c:if test="${worker.getSex() eq '男' }">checked="checked"</c:if>><span class="lbl">男</span></label>
		    <label><input type="radio" name="sex" class="ace" id="sex2" value="女" onclick="return false" <c:if test="${worker.getSex() eq '女' }">checked="checked"</c:if>><span class="lbl">女</span></label>
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>职&nbsp;位：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="workertype" size="1">
				<c:if test="${user.getStatus()==1 }">
					<option value="0">选择职位</option>
					<c:forEach items="${workertype }" var="wt">
						<c:if test="${wt.getWorkerTypeId()!=1 }">
							<option value="${wt.getWorkerTypeId() }" <c:if test="${wt.getWorkerTypeId()==worker.getWorkerType() }">selected="selected"</c:if>><c:out value="${wt.getWorkerTypeName() }"></c:out></option>
						</c:if>
					</c:forEach>
					</c:if>	
					<c:if test="${user.getStatus()!=1 }">
							<option value="${worker.getWorkerType()  }"><c:out value="${worker.getWorkerType()  }"></c:out></option>
					</c:if>				
				</select>
				</span>
         </div>
     </li>
      <li class="clearfix">
		
		    <div class="form-group">
		        <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>入职时间：</label>
		        <div class="col-sm-9">
		            <input type="text" name="times" value="${worker.getWorkTime() }" class="form-control laydate-icon" id="times" style=" height:30px;">
		        </div>
		    </div>
	
     </li>
     
     <li class="clearfix">
			<label class="label_name col-xs-2 col-lg-2">介&nbsp;绍：</label>
			<div class="formControls col-xs-6">
				<textarea name="discripe" cols="" rows="" class="textarea col-xs-12" placeholder="说点什么...100个字符以内" dragonfly="true" onkeyup="checkLength(this);"><c:out value="${worker.getDiscripe() }"></c:out></textarea>
				<span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
			</div>
		</li>
         <li class="clearfix">
			<div class="col-xs-2 col-lg-2">&nbsp;</div>
			<div class="col-xs-6">
	  <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="提交">
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

$("#idcard").change(function(){
	var idcard=$("#idcard").val();
	if(idcard.trim().charAt(16)%2==0){
		$("#sex2").attr("checked","true");
	}else{
		$("#sex1").attr("checked","true");
	}
	$("#age").val(parseInt(laydate.now().substring(0,5))-parseInt(idcard.substring(6,10))+1);
})
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
laydate({
    elem: '#times',
    format: 'YYYY-MM-DD hh:mm:ss',
    max: laydate.now(), //设定最大日期为当前日期
    min: '2000-00-00 00:00:00', //最小日期
    istime: true,
    istoday: true,
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
