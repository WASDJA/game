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
    
    <title>My JSP 'add_goods.jsp' starting page</title>
    
    <meta charset = "utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery.js"></script>
	
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
			<h3>编辑商品信息</h3>
			<form action="AddGoodServlet" method="post" enctype="multipart/form-data">
				<fieldset>
					<legend>商品基本信息</legend>
					<div>
						<label for="goods_id">商品id号</label>
						<!-- <input type="number" value="1"  min="0.0" step="0.1"> -->
						<input type="number" name="goods_id" id="goods_id" value="" size="20" maxlength="10" /> *(id不能为空)
						<br />
					</div>
					<div>
						<label for="business_id">企业id</label>
						<input type="number" name="business_id" id="goods_id" value="" size="20" maxlength="15" /> *(id不能为空)
						<br />
						<br />
					</div>
					<div>
						<label for="goods_name">商品名称</label>
						<input type="text" name="goods_name" id="goods_name" value="" size="30" maxlength="10" /> *(最多10个字符)
						<br />
						<br />
					</div>
					<div>
						<label for="goods_price">商品价格</label>
						<input type="number" name="goods_price" id="goods_price" value="" size="30" maxlength="9" /> *( 元 )
						<br />
						<br />
					</div>
					<div>
						<label for="goods_pic_src">商品图片</label>
						<input type="file" name="fileupload" id="inputs"/><!-- multiple -->
						<div id='dd'></div>  
						<br />
						<br />
					</div>
					<div>
						<label for="goods_introduce">商品介绍</label>
						<textarea rows="20" cols="100" name="goods_introduce" id="goods_introduce" maxlength="60"></textarea><br/>*(建议30字符)
						<br />
					</div>
					<div class="enter">
						<input name="submit" type="submit" class="buttom" value="提交" />
						<input name="reset" type="reset" class="buttom" value="重置" />
						<input name="return" type="button" class="buttom" value="返回列表页面" onclick="window.location = 'SearchGoodServlet'" />
					</div>
				</fieldset>
			</form>
		</div>
  </body>
<script>
	$(document).ready(function() {
		$("#inputs").change(function() {
			var fil = this.files;
			for (var i = 0; i < fil.length; i++) {
				reads(fil[i]);
			}
		});
	});
	function reads(fil) {
		var reader = new FileReader();
		reader.readAsDataURL(fil);
		reader.onload = function() {
			document.getElementById("dd").innerHTML += "<img style="+"margin-left:100px;width:200px;"+" src='" + reader.result + "'>";
		};
	}
</script>
</html>
