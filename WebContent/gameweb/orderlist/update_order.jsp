<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/gameweb/common/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_order.jsp' starting page</title>
    
    <meta charset = "utf-8" />
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
			<h3>编辑订单信息</h3>
			<form action="UpdateGoodServlet" method="post">
			<input type="hidden" name="goods_id" value="${order.goods_id }">
				<fieldset>
					<legend>订单基本信息</legend>
					<div>
						<label for="username">用户名</label>
						<input type="text" name="username" id="username" value="${order.username }" size="20" maxlength="10" /> 
						<br />
					</div>
					<div>
						<label for="phone">联系方式</label>
						<input type="text" name="phone" id="phone" value="${order.phone }" size="20" maxlength="15" /> 
						<br />
						<br />
					</div>
					<div>
						<label for="goods_id">商品id号</label>
						<input type="text" name="goods_id" id="goods_id" value="${order.goods_id }" size="20" maxlength="10" /> 
						<br />
					</div>
					<div>
						<label for="goods_name">商品名称</label>
						<input type="text" name="goods_name" id="goods_name" value="${order.goods_name }" size="30" maxlength="15" /> *(最多15个字符)
						<br />
						<br />
					</div>
					<div>
						<label for="goods_price">商品价格</label>
						<input type="text" name="goods_price" id="goods_price" value="${order.goods_price }" size="15" maxlength="10" /> *( 元 )
						<br />
					</div>
					<div>
						<label for="goods_qua">购买数量</label>
						<input type="text" name="goods_qua" id="goods_qua" value="${order.goods_qua }" size="20" maxlength="10" />
						<br />
						<br />
					</div>
					<div>
						<label for="business_id">企业id</label>
						<input type="text" name="business_id" id="business_id" value="${order.business_id }" size="20" maxlength="15" /> *(工商号)
						<br />
					</div>
					<div>
						<label for="business_name">商家名称</label>
						<input type="text" name="business_name" id="business_name" value="${order.business_name }" size="20" maxlength="20" /> 
						<br />
						<br />
					</div><div>
						<label for="business_phone">商家电话</label>
						<input type="text" name="business_phone" id="business_phone" value="${order.business_phone }" size="20" maxlength="15" /> 
						<br />
					</div>
					<div>
						<label for="business_hone">商家地址</label>
						<input type="text" name="business_home" id="business_home" value="${order.business_home }" size="30" maxlength="30" />
						<br />
					</div>
					<div class="enter">
						<input name="submit" type="submit" class="buttom" value="提交" />
						<input name="reset" type="reset" class="buttom" value="重置" />
						<input name="return" type="button" class="buttom" value="返回列表页面" onclick="window.location = 'SearchOrderServlet'" />
					</div>
				</fieldset>
			</form>
		</div>
  </body>
  </body>
</html>
