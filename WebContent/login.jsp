<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="css/supersized.css" />

	<script src="js/jquery.js"></script>
	<script src="js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init.js"></script>
	<script src="js/login.js"></script>

  </head>
  
  <body>
    <div id="admin">
			<h1>Login</h1>
			<form id="myform" name="login" action="" method="post">
				<input type="text" id="username" name="username" class="username" placeholder="Username">
				<input type="password" id="userpwd" name="password" class="password" placeholder="Password"><br />
				<span id="code" class="code">验证码</span>
				<input id="yanzhengma" type="text" style="width: 170px;" />
				<select name="usertype" id="usertype">
					<option value="普通用户">普通用户</option>
					<option value="企业用户">企业用户</option>
					<option value="管理员">管理员</option>
				</select>
				<div class="error"><span>+</span></div>
				<font class="userfont1" color="#FFFF00">
					<p id="userfont1"></p>
				</font>
			</form>
			<div><button id="userlogin">登录</button></div>
			<a href="register.jsp"><button id="register">注册</button></a>
			<div class="connect">
				<p>Or Connect With:</p>
				<p>
					<a class="twitter" href="javascript:void(0);"></a>
					<a class="facebook" href="javascript:void(0);"></a>
				</p>
			</div>
		</div>
  </body>
</html>
