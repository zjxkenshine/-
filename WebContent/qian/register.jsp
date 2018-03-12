<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>用户注册</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="js/Validform/Validform.min.js"></script>
</head>
<body>  
<!---------------------中间内容------------------------------>
<div class="login">
	<div class="left">
	<a href="index.jsp"><img src="images/logo.png" /></a>
	<img src="images/ladn.jpg"/></div>
    <div class="box">
    	<h2>用户注册</h2>
        <form action="../register.go" id="register">
        <ul>
		<li class="clearfix">
		     <div class="formControls col-xs-6">
		       用&nbsp;户&nbsp; 名：<input type="text" name="clientname" id="clientname" style="margin-left:32px;"/></div>
	     </li>
	     <li class="clearfix">
		     <div class="formControls col-xs-6">
		        密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input  type="password" name="password" id="password" style="margin-left:34px;" /></div>
		    <div class="col-4"> <span class="Validform_checktip"></span></div>
	     </li>
	     <li class="clearfix">
		     <div class="formControls col-xs-6">
		        确认密码：<input  type="password" id="password2" name="password2"/><i id="checkpasswordmessage" class="checkmessage"></i></div>
		    <div class="col-4"> <span class="Validform_checktip"></span></div>
	     </li>
	     <li class="clearfix">
		     <div class="formControls col-xs-6">
		        邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input name="email" id="email" type="text"style="margin-left:32px;" /><br  /></div>
		    <div class="col-4"> <span class="Validform_checktip"></span></div>
	     </li>
		   <li class="clearfix">   
	        <input type="submit"  value="注册" class="button" />
	       </li>
	       <li class="clearfix"> 
	      	<a href="login.jsp" style="margin-left:135px;">返回登录</a>
	       </li>
        </ul>
        </form>
    </div>
</div>
<!---------------------foot-------------------------->
<div class="footer">
	<div class="box">
    	<div class="box_class1">
        	<div class="xins">
            	<ul>
                	<a href="about.html"><li style="padding-left:5px;">关于我们</li></a>
                    <a href="wuliu.html"><li>运输服务</li></a>
                    <a href="lianxi.html"><li>联系我们</li></a>
                    <a href="ditu.html"><li style="border-right:none; padding-right:5px;">网站地图</li></a>
                </ul>
            </div>
            <div class="lianjie">
            	<span style="color:#;">友情链接 :</span>
                <a href="http://www.baidu.com/">百度</a>
            </div>
            <div class="copy">Copyright ©2017 济南市校园助手信息科技有限公司</div>
        </div>
        <div class="box_class2">
        	<p class="p1" style="margin-top:45px;">联系我们： <span> 400-000-0000</span></p>
            <p class="p1">客服热线 ：<span> 0991-584944</span></p>
            <p class="p1">地址：<span style="margin-left:30px;">0991-58945</span></p>
        </div>
        <div class="box_class3">
        <c:if test="${weixinpic!=null }">
        	<p>关注微信号：</p>
            <img src="${weixinpic }" />
        </c:if>
        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">

function isEmail(str){
    var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
    return reg.test(str);
}




$("#register").submit(function () {
	var emailValue=$("#email").val();
	var pass1=$("#password").val();
	var pass2=$("#password2").val();
	var client=$("#clientname").val();
	var a=0;
	 
	 $.ajax({
		 		async:false,
				url:"../registercheck.go",
				type:"POST",
				dataType:"json",
				data:{e_mail:emailValue},
				success:function(data){
					if(data==1){
						a++;
					}
				}
	 })

	 if (!isEmail(emailValue))
	 {
	  alert("您输入的邮箱有误,请重新核对后再输入!");
	  return false;
	 }
	 else if(client==""){
		 alert("账号不能为空");
		 return false;
	 } else if(pass1==""){
		 alert("密码不能为空");
		 return false;
	 }
	 else if(pass1!=pass2){
		 alert("两次密码输入不一样!");
		 return false;
	 }else if(a==1){
		 alert("该邮箱以已经有人使用");
		 return false;
	 }else{
		 alert("注册成功");
	 }
	 

	
})



</script>
