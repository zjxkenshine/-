<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<title>清理数据库</title>
</head>
<style type="text/css">
 .template_prompt{ margin-top:200px; width:300px; margin-left:auto; margin-right:auto; text-align:center; font-size:16px;}
 .template_prompt h2{ color:#666; margin:20px 0px;}
</style>
<body>
<div class="margin" id="page_style">
 <div class="template_prompt">
  <h2>点击清理数据库（清理各表中没有用的数据）</h2>
    <a id="cleandata" class="btn bg-deep-blue operation_btn">点击清理</a>
 </div>
</div>
</body>

</html>
<script type="text/javascript">

$("#cleandata").click(function(){
	layer.open({
		    type: 2 //Page层类型
		   	,area: ['700px', '530px']
		    ,title: '重置搜索'
		    ,shade: 0.6 //遮罩透明度
		    ,maxmin: true //允许全屏最小化
		    ,anim: 2 //0-6的动画形式，-1不开启
		    ,content: '../cleandata.do',
		  
		});
})

</script>
