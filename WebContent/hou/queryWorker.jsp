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
    <form action="../queryworker.do" method="post" id="form-admin-add">
    <ul>
    <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>员工编号：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${workerquery.get('workerid') }" placeholder="" id="workerid" name="workerid" datatype="/^\s*$/|n"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>员工姓名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${workerquery.get('workername') }" placeholder="" id="workername" name="workername" datatype="/^\s*$/|s"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>身份证号：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" value="${workerquery.get('idcard') }" name="idcard" id="idcard" datatype="/^\s*$/|n">
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>电话号码：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" value="${workerquery.get('tel') }"  name="tel" id="tel" datatype="/^\s*$/|n" >
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>年龄：</label>
      <div class="formControls col-xs-6">
		<input type="text" class="input-text col-xs-12" value="${workerquery.get('age1') }" name="age1" id="age1" datatype="/^\s*$/|n"  >到
		<input type="text" class="input-text col-xs-12" value="${workerquery.get('age2') }" name="age2" id="age2" datatype="/^\s*$/|n" >
	   </div>
		<div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
    <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>性别：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="workertype" size="1">
					<option value="">所有性别</option>
					<option value="男" <c:if test="${workerquery.get('sex') eq '男' }">selected="selected"</c:if>>男</option>	
					<option value="女" <c:if test="${workerquery.get('sex') eq '女' }">selected="selected"</c:if>>女</option>	
				</select>
				</span>
         </div>
     </li>
     
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>状态：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="status" size="1">
					<option value="">全部</option>
					<option value="1" <c:if test="${workerquery.get('status') eq '1' }">selected="selected"</c:if>>在职</option>	
					<option value="0" <c:if test="${workerquery.get('status') eq '0' }">selected="selected"</c:if>>离职</option>	
				</select>
				</span>
         </div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>职&nbsp;位：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="workertype" size="1">
					<option value="0">选择职位</option>
					<c:if test="${user.getStatus()==1 }">
					<c:forEach items="${workertype }" var="wt">
						<c:if test="${wt.getWorkerTypeId()!=1 }">
							<option value="${wt.getWorkerTypeId() }" <c:if test="${workerquery.get('workertypeid')==wt.getWorkerTypeId() }">selected="selected"</c:if>><c:out value="${wt.getWorkerTypeName() }"></c:out></option>
						</c:if>
					</c:forEach>
					</c:if>					
				</select>
				</span>
         </div>
     </li>
    <li class="clearfix">
		    <div class="form-group">
		         <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>添加时间：</label>
		            <input type="text" name="addtime1" value="${workerquery.get('addtime1') }" class="form-control laydate-icon" id="addtime1" style=" height:30px;" >到
		               <input type="text" name="addtime2" value="${workerquery.get('addtime2') }" class="form-control laydate-icon" id="addtime2" style=" height:30px;">
		</div>
       

    </li>
    <li class="clearfix">
		    <div class="form-group">
		         <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>入职时间：</label>
		            <input type="text" name="worktime1" value="${workerquery.get('worktime1') }" class="form-control laydate-icon" id="worktime1" style=" height:30px;" >到
		               <input type="text" name="worktime2" value="${workerquery.get('worktime2') }" class="form-control laydate-icon" id="worktime2" style=" height:30px;">
		</div>
       

    </li>
         <li class="clearfix">
			<div class="col-xs-2 col-lg-2">&nbsp;</div>
			<div class="col-xs-6">
	  <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="查询">
      <input id="resetquery" type="button" class="btn button_btn btn-gray" value="重置" />
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
    elem: '#worktime2',
    format: 'YYYY-MM-DD hh:mm:ss',
    max: laydate.now(), //设定最大日期为当前日期
    min: '2000-00-00 00:00:00', //最小日期
    istime: true,
    istoday: true,
});
laydate({
    elem: '#worktime1',
    format: 'YYYY-MM-DD hh:mm:ss',
    max: laydate.now(), //设定最大日期为当前日期
    min: '2000-00-00 00:00:00', //最小日期
    istime: true,
    istoday: true,
});
laydate({
    elem: '#addtime1',
    format: 'YYYY-MM-DD hh:mm:ss',
    max: laydate.now(), //设定最大日期为当前日期
    min: '2000-00-00 00:00:00', //最小日期
    istime: true,
    istoday: true,
});
laydate({
    elem: '#addtime2',
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

$("#resetquery").click(function(){
	layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '重置搜索'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../resetworkerquery.do',
		  
		});
})
</script>
