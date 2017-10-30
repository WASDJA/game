<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'activate.jsp' starting page</title>
    
    <meta charset="utf-8"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/login.css" />
	
	<script type="text/javascript">
			function check() {
				var act = document.getElementById('act').value;
				if(act == "") {
					alert("激活码不能为空");
					return;
				}
				activation_form.action = "ActivationServlet";
				activation_form.submit();
			}
		</script>

  </head>
  
  <body>
    <div id="admin">
			<h1>Activative</h1>
			<p>亲爱的用户，请在下方输入您的激活码，并开始激活。</p>
			<form id="myform" name="activation_form" action="" method="post">
				<input type="text" id="act" name="activation_code" maxlength="" class="username" placeholder="激活码" style="width: 400;">
				<font class="userfont1" color=#FFFF00>
					<p id="userfont1">${error}</p>
				</font>
			</form>
			<div><button id="userlogin" onclick="check()">开始激活</button></div>
		</div>
  </body>
</html>
