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
<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
<script src="js/kindeditor/kindeditor.js"></script>
<script src="js/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
					KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#image1').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							imageUrl : K('#url1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url1').val(url);
								editor.hideDialog();
							}
						});
					});
				});
				K('#image2').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showLocal : false,
							imageUrl : K('#url2').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url2').val(url);
								editor.hideDialog();
							}
						});
					});
				});
				K('#image3').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#url3').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url3').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
		</script>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin add_administrator" id="page_style">
    <div class="add_style add_administrator_style">
    <form action="../addgoods.go" method="post" id="form-admin-add">
    <ul>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>商品名：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="" placeholder="" id="goodsname" name="goodsname" datatype="*2-16" nullmsg="货物名不能为空"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>价格：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="" placeholder="" id="price" name="price" datatype="/^-?[1-9]+(\.\d+)?$|^-?0(\.\d+)?$|^-?[1-9]+[0-9]*(\.\d+)?$/" nullmsg="价格不能为空"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
     <li class="clearfix">
      <label class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>类&nbsp;型：</label>
      <div class="formControls col-xs-6"> <span class="select-box" style="width:150px;">
				<select class="select" name="goodstype" size="1" datatype="*" nullmsg="请选择一个类型">
					<option value="">选择类型</option>
					<option value="1">男装</option>
					<option value="2">女装</option>
					<option value="3">鞋子</option>
					<option value="4">饰品</option>
					<option value="5">箱包</option>
					<option value="6">手机及配件</option>
					<option value="7">电脑及配件</option>
					<option value="8">其他电器</option>
					<option value="9">生活用品</option>
					<option value="10">运动器材</option>
					<option value="11">户外用品</option>
					<option value="12">图书</option>
					<option value="13">食品</option>
					<option value="14">医疗药物</option>
					<option value="15">乐器</option>
					<option value="16">会员卡</option>
					<option value="17">其他二手物品</option>
				</select>
				</span>
         </div>
         <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">
     <label class="label_name col-xs-2 col-lg-2"><i>*</i>地址：</label>
     <div class="formControls col-xs-6">
     <input type="text" class="input-text col-xs-12" value="" placeholder="" id="address" name="address" datatype="*" nullmsg="地址不能为空"></div>
    <div class="col-4"> <span class="Validform_checktip"></span></div>
     </li>
      <li class="clearfix">
		<label class="label_name col-xs-2 col-lg-2">上传照片：</label>
			<p><input type="text" name="goodspic" id="url1" value="" /> <input type="button" name="" id="image1" value="选择图片" />（网络图片 + 本地上传）</p>
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
	  <input class="btn button_btn bg-deep-blue " type="submit" id="Add_Administrator" value="确认添加">
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
