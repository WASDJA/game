<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="/gameweb/common/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/gameweb/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_goods.jsp' starting page</title>
    
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
			<h3>�༭��Ʒ��Ϣ</h3>
			<form action="UpdateGoodServlet" method="post">
			<input type="hidden" name="goods_id" value="${good.goods_id }">
				<fieldset>
					<legend>��Ʒ������Ϣ</legend>
					<div>
						<label for="goods_id">��Ʒid��</label>
						<input type="text" name="goods_id" id="goods_id" value="${good.goods_id }" size="20" maxlength="10" /> 
						<br />
					</div>
					<div>
						<label for="business_id">��ҵid</label>
						<input type="text" name="business_id" id="business_id" value="${good.business_id }" size="20" maxlength="15" /> 
						<br />
						<br />
					</div>
					<div>
						<label for="goods_name">��Ʒ����</label>
						<input type="text" name="goods_name" id="goods_name" value="${good.goods_name }" size="30" maxlength="30" /> *(���30���ַ�)
						<br />
						<br />
					</div>
					<div>
						<label for="goods_price">��Ʒ�۸�</label>
						<input type="text" name="goods_price" id="goods_price" value="${good.goods_price }" size="30" maxlength="10" /> *( Ԫ )
						<br />
						<br />
					</div>
					<div>
						<label for="goods_pic_src">��ƷͼƬ</label>
						<input type="text" name="goods_pic_src" id="goods_pic_src" value="${good.goods_pic_src }" size="40" maxlength="60" />
						<br />
						<br />
					</div>
					<div>
						<label for="goods_introduce">��Ʒ����</label>
						<textarea rows="20" cols="100" name="goods_introduce" id="goods_introduce" maxlength="60">${good.goods_introduce }</textarea><br/>*(����30�ַ�)
						<br />
					</div>
					<div class="enter">
						<input name="submit" type="submit" class="buttom" value="�ύ" />
						<input name="reset" type="reset" class="buttom" value="����" />
						<input name="return" type="button" class="buttom" value="�����б�ҳ��" onclick="window.location = 'SearchGoodServlet'" />
					</div>
				</fieldset>
			</form>
		</div>
  </body>
</html>
