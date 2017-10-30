<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'activate_success.jsp' starting page</title>
    <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/login.css" />

		<script type="text/javascript">
			var t = 5;
			setInterval("refer()", 1000); 
			function refer() {
				if(t == 0) {
					location = "http://localhost:8080/game/login.jsp";
				}
				document.getElementById('show').innerHTML = "亲爱的用户，您已经激活，将在" + t + "秒后返回登录界面！";
				t--; 
			}
		</script>

  </head>
  
  <body>
    <div id="admin">
			<h1>Activative_Success</h1>
			<span id="show"></span>
		</div>
  </body>
</html>
