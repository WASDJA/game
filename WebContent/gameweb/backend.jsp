<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/gameweb/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'backend.jsp' starting page</title>
    
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />

	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/tendina.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>

  </head>
  
  <body>
    <!--顶部-->
		<div class="top">
			<div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #fff">WEB STITE管理中心</h1></span></div>
			<div id="ad_setting" class="ad_setting">
				<a class="ad_setting_a" href="javascript:; ">${LOGIN_ADMIN }</a>
				<ul class="dropdown-menu-uu" style="display: block" id="ad_setting_ul">
					<li class="ad_setting_ul_li">
						<a href="javascript:;"><i class="icon-user glyph-icon"></i>个人中心</a>
					</li>
					<li class="ad_setting_ul_li">
						<a href="javascript:;"><i class="icon-cog glyph-icon"></i>设置</a>
					</li>
					<li class="ad_setting_ul_li">
						<a href="LogoutServlet"><i class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span> </a>
					</li>
				</ul>
				<img class="use_xl" src="backend_img/right_menu.png">
			</div>
		</div>
		<!--顶部结束-->
		<!--菜单-->
		<div class="left-menu">
			<ul id="menu">
				<li class="menu-list">
					<a style="cursor:pointer" class="firsta"><i class="glyph-icon xlcd"></i>用户信息管理<s class="sz"></s></a>
					<ul>
						<li>
							<a href="SearchUserServlet" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>查询用户信息</a>
						</li>
						<li>
							<a href="users/add_user.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>添加用户</a>
						</li>
						<li>
							<a href="" target="menuFrame"><i class="glyph-icon icon-chevron-right3"></i>用户留言</a>
						</li>
					</ul>
				</li>
				<li class="menu-list">
					<a style="cursor:pointer" class="firsta"><i class="glyph-icon xlcd"></i>商家信息管理<s class="sz"></s></a>
					<ul>
						<li>
							<a href="" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>查询伤害信息</a>
						</li>
						<li>
							<a href="" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>添加企业</a>
						</li>
						<li>
							<a href="" target="menuFrame"><i class="glyph-icon icon-chevron-right3"></i>商家留言</a>
						</li>
					</ul>
				</li>
				<li class="menu-list">
					<a style="cursor:pointer" class="firsta"><i class="glyph-icon xlcd"></i>商品信息管理<s class="sz"></s></a>
					<ul>
						<li>
							<a href="SearchGoodServlet" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>查询商品信息</a>
						</li>
						<li>
							<a href="goods/add_goods.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>添加商品</a>
						</li>
						<li>
							<a href="" target="menuFrame"><i class="glyph-icon icon-chevron-right3"></i>买家留言</a>
						</li>
					</ul>
				</li>
				<li class="menu-list">
					<a style="cursor:pointer" class="firsta"><i class="glyph-icon xlcd"></i>订单信息管理<s class="sz"></s></a>
					<ul>
						<li>
							<a href="SearchOrderServlet" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>查询订单</a>
						</li>
						<li>
							<a href="" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>添加订单</a>
						</li>
						<li>
							<a href="other.html" target="menuFrame"><i class="glyph-icon icon-chevron-right3"></i>订单杂项</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>

		<!--菜单右边的iframe页面-->
		<div id="right-content" class="right-content">
			<div class="content">
				<div id="page_content">
					<iframe id="menuFrame" name="menuFrame" src="gameweb.jsp" style="overflow:visible;" scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
				</div>
			</div>
		</div>
  </body>
</html>
