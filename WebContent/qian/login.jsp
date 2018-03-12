<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>校园助手</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript" ></script>
</head>

<body>  
<!---------------------中间内容------------------------------>
<div class="login">
	<div class="left">
	<a href="index.jsp"><img src="images/logo.png" /></a>
	<img src="images/ladn.jpg"/></div>
    <div class="box">
    	<h2>欢迎登陆</h2>
        <form action="../loginset.go" method="post" id="login">
	        邮&nbsp;&nbsp;&nbsp;&nbsp;箱： <input name="e_mail" id="e_mail" type="text"/><br />
	        密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="password" id="password" type="password" style="margin-left:32px;"><br />
	        登录码：<input name="clientcode" id="clientcode" type="password" style="margin-left:32px;"><br />
       <i>(填写邮箱中得到的登录码)</i>
        <a><input type="submit"  value="登录" class="button" style=""/></a>
        </form>
        <a href="forgetPassword.jsp" style="margin-left:135px;">忘记密码/登录码</a>|<a href="register.jsp">立即注册</a>
    </div>
</div>
<!---------------------foot-------------------------->
<div class="footer">
	<div class="box">
    	<div class="box_class1">
        	<div class="xins">
            	<ul>
                	<a href=""><li style="padding-left:5px;">关于我们</li></a>
                    <a href=""><li>运输服务</li></a>
                    <a href=""><li>联系我们</li></a>
                    <a href=""><li style="border-right:none; padding-right:5px;">网站地图</li></a>
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


$("#login").submit(function () {
	var emailValue=$("#e_mail").val();
	var password=$("#password").val();
	var code=$("#clientcode").val();
	var a=0;
	if(!isEmail(emailValue)){
		  alert("您输入的邮箱有误,请重新核对后再输入!");
		  return false;
	}else if(emailValue!=""){
	 $.ajax({
		 		async:false,
				url:"../logincheck.go",
				type:"POST",
				dataType:"json",
				data:{e_mail:emailValue},
				success:function(data){
					if(data["PassWord"]!=password){
						alert("邮箱或密码错误");
						a++;
					}else if(data["ClientCode"]!=code){
						alert("邮箱或登录码错误");
						a++;
					}
				}
	 })
	}else if(emailValue==""){
		 alert("邮箱不能为空!");
		 return false;
	 }
	 if(a!=0){
		 return false;
	 }else{
		 alert("登录成功")
	 }
})

</script>
