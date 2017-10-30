<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/gameweb/common/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/gameweb/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_goods_success.jsp' starting page</title>
    
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
			<!-- body {
				font-family: Arial, Helvetica, sans-serif;
				font-size: 12px;
				color: #666666;
				background: #fff;
				text-align: center;
			}
			
			* {
				margin: 0;
				padding: 0;
			}
			
			a {
				color: #1E7ACE;
				text-decoration: none;
			}
			
			a:hover {
				color: #000;
				text-decoration: underline;
			}
			
			h3 {
				font-size: 14px;
				font-weight: bold;
			}
			
			pre,
			p {
				color: #1E7ACE;
				margin: 4px;
			}
			
			input,
			select,
			textarea {
				padding: 1px;
				margin: 2px;
				font-size: 12px;
			}
			
			.buttom {
				padding: 1px 10px;
				font-size: 12px;
				border: 1px #1E7ACE solid;
				background: #D0F0FF;
			}
			
			#formwrapper {
				width: 95%;
				margin: 15px auto;
				padding: 20px;
				text-align: left;
			}
			
			fieldset {
				padding: 10px;
				margin-top: 5px;
				border: 1px solid #1E7ACE;
				background: #fff;
			}
			
			fieldset legend {
				color: #1E7ACE;
				font-weight: bold;
				background: #fff;
			}
			
			fieldset label {
				float: left;
				width: 120px;
				text-align: right;
				padding: 4px;
				margin: 1px;
			}
			
			fieldset div {
				clear: left;
				margin-bottom: 2px;
			}
			
			.enter {
				text-align: center;
			}
			
			.clear {
				clear: both;
			}
			-->
		</style>
  </head>
  
  <body>
    <div id="formwrapper">
			<h3>更新商品信息成功</h3>
			<div class="enter">
				<input name="return" type="button" class="buttom" value="返回列表页面" onclick="window.location = 'SearchGoodServlet'" />
			</div>
		</div>
  </body>
</html>
