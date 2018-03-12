<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
<script src="js/kindeditor/kindeditor.js"></script>
<script src="js/kindeditor/lang/zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加收货地址</title>
</head>
<body>
<div class="margin add_administrator" id="page_style">
    <div class="add_style add_administrator_style">
    <form action="../updateaddress.go" method="post" id="form-admin-add">
    <ul>
    <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>地址编号：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${address.getAddressId() }" placeholder="" id="addressid" name="addressid" readonly="readonly"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>收货人：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${address.getName() }" placeholder="" id="name" name="name" nullmsg="收货人不能为空"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>收货地址：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="${address.getAddress() }" placeholder="" id="address" name="address" nullmsg="收货地址不能为空"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">

			<div class="col-xs-6">
			  <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="确认修改">
		      <input name="reset" type="reset" class="btn button_btn btn-gray" value="取消重置" />
			</div>
		</li>
     </ul>
     </form>
     </div>
     </div>
</body>
</html>
<script>
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
</script>