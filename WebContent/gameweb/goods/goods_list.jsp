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
    
    <title>My JSP 'goods_list.jsp' starting page</title>
    
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">	
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<style type="text/css">
			<!-- body {
				margin-left: 3px;
				margin-top: 0px;
				margin-right: 3px;
				margin-bottom: 0px;
			}
			
			.STYLE1 {
				color: #e1e2e3;
				font-size: 12px;
			}
			
			.STYLE6 {
				color: #000000;
				font-size: 12;
			}
			
			.STYLE10 {
				color: #000000;
				font-size: 12px;
			}
			
			.STYLE19 {
				color: #344b50;
				font-size: 12px;
			}
			
			.STYLE21 {
				font-size: 12px;
				color: #3b6375;
			}
			
			.STYLE22 {
				font-size: 12px;
				color: #295568;
			}
			
			A:active,
			A:visited,
			A:link {
				COLOR: #0629FD;
				TEXT-DECORATION: none
			}
			
			A:hover {
				COLOR: #FF6600;
				TEXT-DECORATION: none
			}
			
			A.relatelink:active,
			A.relatelink:visited,
			A.relatelink:link {
				color: white;
				TEXT-DECORATION: none
			}
			
			A.relatelink:hover {
				COLOR: #FF6600;
				TEXT-DECORATION: none
			}
			
			td {
				font-size: 12px;
				color: #003366;
				height: 24px
			}
			
			.STYLE1 a {
				COLOR: white;
			}
			
			.STYLE1 A:active,
			.STYLE1 A:visited,
			.STYLE1 A:link {
				COLOR: white;
				TEXT-DECORATION: none
			}
			
			.STYLE1 a:hover {
				COLOR: red;
			}
			
			-->
		</style>
		<script type="text/javascript">
			function selectAll(field) {

				//根据checkbox框的名称，查询得到所有的checkbox对象
				var idCheckboxs = document.getElementsByName("id");
				for(var i = 0; i < idCheckboxs.length; i++) {
					//判断顶上那个checkbox框的选中状态
					if(field.checked) {
						idCheckboxs[i].checked = true;
					} else {
						idCheckboxs[i].checked = false;
					}
				}
			}

			function del() {
				//判断有哪些checkbox框被选中了
				var idCheckboxs = document.getElementsByName("id");
				var url = "DeleteGoodServlet";
				var checkedIds = [];
				for(var i = 0; i < idCheckboxs.length; i++) {
					if(idCheckboxs[i].checked) {
						checkedIds[checkedIds.length] = idCheckboxs[i].value;
					}
				}
				for(var i = 0; i < checkedIds.length; i++) {
					if(i == 0) {
						url = url + "?goods_id=" + checkedIds[i];
					} else {
						url = url + "&goods_id=" + checkedIds[i];
					}
				}

				//通过GET方式，向后台递交一个请求
				window.location = url;
			}

			function selectPagesize(field) {
				alert(document.getElementById("firstPage").href + "&pagesize=" + field.value);
				window.location = document.getElementById("firstPage").href + "&pagesize=" + field.value;
			}
		</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="24" bgcolor="#353c44">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="6%" height="19" valign="bottom">
														<div align="center"><img src="images/tb.gif" width="14" height="14" /></div>
													</td>
													<td width="94%" valign="bottom"><span class="STYLE1"> 商品信息列表</span></td>
												</tr>
											</table>
										</td>
										<td>
											<div align="right">
											<span class="STYLE1"> &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> <a href="goods/add_goods.jsp">添加</a> 
											<!-- &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" /> <a href="#">发布</a>  -->
											&nbsp;&nbsp; <img src="images/del.gif" width="10" height="10" /><a href="javascript:del()">删除</a> &nbsp;&nbsp; &nbsp;
											</span><span class="STYLE1"> &nbsp;</span>
										</div>
									</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<form action="SearchGoodServlet" method="get">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right">商品id：</td>
								<td width="160px"><input type="text" name="goods_id" value="${param.goods_id }"></td>
								 &nbsp;&nbsp;<td><input type="submit" name="submit" value="查询"></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
						<tr>
							<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10">
								<div align="center">
									<input type="checkbox" name="checkbox" onclick="selectAll(this)" />
								</div>
							</td>
							<td width="100" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center"><span class="STYLE10">商品id</span></div>
							</td>
							<td width="50" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center"><span class="STYLE10">商品名称</span></div>
							</td>
							<td width="50" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center"><span class="STYLE10">商品价格</span></div>
							</td>
							<td width="50" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center"><span class="STYLE10">商品图片</span></div>
							</td>
							<td width="70" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center"><span class="STYLE10">商品介绍</span></div>
							</td>
							<td width="70" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center"><span class="STYLE10">商品来源</span></div>
							</td>
						</tr>
						<c:if test="${not empty goods}">
							<c:forEach items="${goods}" var="a">
								<tr>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<input type="checkbox" name="id" value="${a.goods_id}" />
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											<a href="OpenUpdateGoodServlet?goods_id=${a.goods_id}" title="点击查看和编辑商品">${a.goods_id}</a>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">${a.goods_name }</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">${a.goods_price }</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">${a.goods_pic_src }</div>
									</td><td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">${a.goods_introduce }</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">${a.business_id }</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
										<!-- 	<a href="#" title="点击发布商品">发布</a> | -->
											<a href="DeleteGoodServlet?goods_id=${a.goods_id}" title="点击删除商品">删除</a> |
											<a href="OpenUpdateGoodServlet?goods_id=${a.goods_id}" title="点击编辑商品信息">编辑</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty goods}">
							<tr>
								<td height="20" colspan="9" bgcolor="#FFFFFF" class="STYLE19">
									<div align="center">没有商品可以显示</div>
								</td>
							</tr>
						</c:if>
					</table>
				</td>
			</tr>
			<tr>
				<td height="30">
					<pg:pager url="SearchGoodServlet" items="${total}" maxPageItems="${pagesize}" maxIndexPages="15" export="currentPageNumber=pageNumber">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="33%">
									<div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;
        共有<strong> ${total }</strong> 条记录，
        当前第<strong> ${currentPageNumber }</strong> 页，
        <pg:last>
        共 <strong>${pageNumber }</strong> 页
        </pg:last>
        </span></div>
								</td>
								<td width="67%" align=right vAlign="center" noWrap>

									<pg:param name="title" />
									<pg:first>
										<a id="firstPage" href="${pageUrl}">首页</a>
									</pg:first>
									<pg:prev>
										<a href="${pageUrl}">前页</a>
									</pg:prev>
									<pg:pages>
										<c:choose>
											<c:when test="${currentPageNumber eq pageNumber}">
												<font color="red">${pageNumber }</font>
											</c:when>
											<c:otherwise>
												<a href="${pageUrl }">${pageNumber}</a>
											</c:otherwise>
										</c:choose>
									</pg:pages>
									<pg:next>
										<a href="${pageUrl}">下页</a>
									</pg:next>
									<pg:last>
										<a href="${pageUrl}">尾页</a>
									</pg:last>

									<select name="pagesize" onchange="selectPagesize(this)">
										<c:forEach begin="5" end="50" step="5" var="i">
											<option value="${i }" <c:if test="${i eq pagesize }">selected</c:if> >${i }</option>
										</c:forEach>
									</select>

								</td>
							</tr>
						</table>
					</pg:pager>
				</td>
			</tr>
		</table>
  </body>
</html>
