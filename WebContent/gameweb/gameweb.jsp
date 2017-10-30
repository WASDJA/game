<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/gameweb/common/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/gameweb/";
%>
<%-- <jsp:include page="MainGoodServlet" flush="true" />  --%>
<%-- <jsp:forward page="MainGoodServlet" /> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
  <title>My JSP 'gameweb.jsp' starting page</title>
    
  <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">-
	<meta http-equiv="description" content="This is my page">
	
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	<link href="css/stylee.css" rel="stylesheet">
		
	<script src="js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/jquery.fly.min.js"></script>    
    <script src="js/minicart.js"></script>
    <script src="js/main.js"></script>
    
</head>
  
  <body>
  
  <!-- header -->
		<header class="header">
			
			<!-- header top -->
			<div class="header-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-3">
							<ul class="list-inline">
								<li>
									<div class="dropdown">
										<a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img  src="images/is.png" alt="" />仲恺农业工程学院<i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0);">历史</a></li>
											<li><a href="javascript:void(0);">成就</a></li>
											<li><a href="javascript:void(0);">录取</a></li>
										</ul>
									</div>
								</li>
								<li>
									<div class="dropdown">
										<a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">信科院<i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0);">物联网</a></li>
											<li><a href="javascript:void(0);">电子</a></li>
											<li><a href="javascript:void(0);">通信</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
						<div class="col-sm-4">
							<ul class="list-inline">
								<li><a href="javascript:void(0);" ><i class="fa fa-mobile"></i> +13560373081</a></li>
								<li><a href="javascript:void(0);" ><i class="fa fa-envelope-o"></i> gzzkdianzi@163.com</a></li>
							</ul>	
						</div>
						<div class="col-sm-5">
							<ul class="list-inline pull-right">
								<li>
								<div class="dropdown">
								        <a href="javascript:void(0);" ><i class="fa fa-user"></i></a>
										<a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${LOGIN_ADMIN }<i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
										<li><a href="LogoutServlet">退出账户</a></li>
										</ul>
									</div>
								</li>
								<li><a href="#" ><i class="fa fa-heart-o"></i> Favourite (0)</a></li>
								<li><a href="#" ><i class="fa fa-file-o"></i> Compare (0)</a></li>
							</ul>	
						</div>	
					</div>	
				</div>
			</div>
			
			<!-- logo and adds -->
			<div class="logo-add">
				<div class="container">
					<div class="row">
						<div class="col-sm-4">
							<div class="logo"><i class="fa fa-diamond"></i>电子大队</div>
						</div>
						<div class="col-sm-8">
							<h3 class="add bb-year-end-ribbon hidden-xs"><img src="images/red-tablet.png" width="40px;" alt="" /> 
							<span><span>GAME</span> WEBSITE</span> <button class="btn btn-default"> Go Playing </button></h3>
						</div>
					</div>
				</div>
			</div>
			
			<!-- header bottom -->
			<div class="header-bottom">
				<div class="row">
					<div class="col-sm-12">
						<nav class="navbar navbar-default">
							<div class="container">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-bottom" aria-expanded="false">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse" id="header-bottom">
									<ul class="nav navbar-nav">
										<li class="active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">HOME GAME</a>
											<ul class="dropdown-menu">
												<li><a href="javascript:void(0);">Home Game</a></li>
												<li><a href="javascript:void(0);">Home Game 2</a></li>
												<li><a href="javascript:void(0);">Home Game 3</a></li>
												<li><a href="javascript:void(0);">Home Game 4</a></li>
											</ul>	
										</li>
										<li><a href="product-detail.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">XBOX</a><span class="label label-danger text-center hidden-xs">New <i class="fa fa-caret-right"></i></span>
											<ul class="dropdown-menu">
												<li><a href="product.html">Products</a></li>
												<li><a href="product-detail.html">Product Details</a></li>
												<li><a href="new-product.html">New Products</a></li>
											</ul>	
										</li>
										<li><a href="PC.html">PC</a></li>
										<li><a href="MOBILE.html">MOBILE</a></li>
										<li><a href="ARPG.html">ARPG</a></li>
										<li><a href="PLAYSTATION.html">PLAY STATION</a> <span class="label label-info text-center hidden-xs">New <i class="fa fa-caret-right"></i></span></li>
										<li><a href="SB.html">SB</a></li>
									</ul>
									<form class="navbar-form navbar-right" role="search">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Search...">
											<span class="nav-search"><a href="javascript:void(0);"><i class="fa fa-search"></i></a></span>
										</div>	
									</form>
								</div>
							</div>
						</nav>
					</div>	
				</div>	
			</div>	
		</header>	
		
		<!-- home -->
		<section class="home" style="width: 1314;">
			<div class="intro">
				<div id="home" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#home" data-slide-to="0" class="active"></li>
						<li data-target="#home" data-slide-to="1"></li>
						<li data-target="#home" data-slide-to="2"></li>
						<li data-target="#home" data-slide-to="3"></li>
						<li data-target="#home" data-slide-to="4"></li>
						<li data-target="#home" data-slide-to="5"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">																							
							<img class="img-responsive" src="imagesback/0.jpg" width="1349" alt="" />	
						</div>
						<div class="item">						
							<img class="img-responsive" src="imagesback/1.jpg" width="1349" alt="" />
						</div>
						<div class="item">							
							<img class="img-responsive" src="imagesback/2.jpg" width="1349" alt="" />
						</div>
						<div class="item">							
							<img class="img-responsive" src="imagesback/3.jpg" width="1349" alt="" />
						</div>
						<div class="item">
							<img class="img-responsive" src="imagesback/4.jpg" width="1349" alt="" />
						</div>
						<div class="item">
						    <img class="img-responsive" src="imagesback/5.jpg" width="1349" alt="" />
					    </div>
					<!-- Controls -->
					<a class="left carousel-control" href="#home" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a>
					<a class="right carousel-control" href="#home" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a>
				</div>
			</div>
		</div>
		</section>	
		
		<!-- service -->
		<section class="service">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 text-center">
						<div class="service-detail">
							<span class=" fa diamond"> <i class="fa fa-android"></i></span>
							<h3>第一人称射击</h3>
							<p>FPS(First-person Shooter)游戏顾名思义就是以玩家的主观视角来进行射击游戏. </p>
						</div>
					</div>
					<div class="col-sm-3 text-center">
						<div class="service-detail">
							<span class=" fa diamond"> <i class="fa fa-apple"></i></span>
							<h3>动作游戏</h3>
							<p>（Action Game）一般比较有刺激性，情节紧张，声光效果丰富，操作简单。. </p>
						</div>
					</div>
					<div class="col-sm-3 text-center">
						<div class="service-detail">
							<span class=" fa diamond"> <i class="fa fa-html5"></i></span>
							<h3>竞速游戏</h3>
							<p>（CAR）竟速游戏95％都说的是赛车游戏，还有5％是其他类型的竟速游戏. </p>
						</div>
					</div>
					<div class="col-sm-3 text-center">
						<div class="service-detail">
							<span class=" fa diamond"> <i class="fa fa-css3"></i></span>
							<!--span><i class="fa fa-folder-o s-icon"></i></span-->
							<h3>模拟游戏</h3>
							<p>（Simulation Game）试图去复制各种“现实”生活的各种形式，达到“训练”玩家的目的. </p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- featured product -->
		<section class="featured-product">
			<div class="container">
			
				<div class="row">
					<div class="col-sm-12">
						<div class="">
							<h1><span class="t-color-1">特色</span> Products
								<small class="btn-group hidden-xs">
									<a class=" btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" 
									   aria-expanded="false">所有 类别 <i class="fa fa-bars"></i></a>All Categries
									<ul class="dropdown-menu">
										<li><a href="#">Option 1</a></li>
										<li><a href="#">Option 2</a></li>
									</ul>
								</small>
							</h1>
							<div class="heading-border b-color-1"></div>
						</div>
					</div>
				</div> 
					
				<!-- section title -->
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"><i class="fa fa-angle-left"></i></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"><i class="fa fa-angle-right"></i></li>
					</ol>
					
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div class="row">
							
							<c:if test="${not empty maingoods}">
							<c:forEach items="${maingoods}" var="a">
							
								<div class="col-sm-3">
									<div class="thumbnail">
										<!--span class="e-label"><div>Sale</div></span-->
										<span class="service-link text-center">
											<img class="img-responsive" src="${a.goods_pic_src }" alt="">
											<div class="list-inline">
												<a href="javascript:void(0);"><i class="fa fa-eye"></i></a>
												<a href="javascript:void(0);"><i class="fa fa-link"></i></a>
											</div>
										</span>
										<div class="caption">
											<div class="category"> ${a.goods_name }
												<div class="pull-right">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
											</div>
											<h3 style="font-size: 14px;">${a.goods_introduce }</h3>
											<strong>￥${a.goods_price }</strong>
											<div>
												<a href="Javascript: void(0)" class="btn btn-default" role="button" data-price="${a.goods_price }" data-proid="${a.goods_id }" data-proname="${a.goods_name }" data-proimg="${a.goods_pic_src }">
												Add to Cart
												</a><span class="pull-right"><i class="fa fa-heart-o"></i> Add to Favourite</span>
											</div>
										</div>
									</div>
								</div>
								
							</c:forEach>
						</c:if>
							</div>
						</div>
						
						<div class="item">
							<div class="row">
							
								<div class="col-sm-3">
									<div class="thumbnail">
										<!--span class="e-label"><div>Sale</div></span-->
										<span class="service-link text-center">
											<img class="img-responsive" src="goods_img/5.jpg" alt="">
											<div class="list-inline">
												<a href="javascript:void(0);"><i class="fa fa-eye"></i></a>
												<a href="javascript:void(0);"><i class="fa fa-link"></i></a>
											</div>
										</span>
										<div class="caption">
											<div class="category"> 英雄联盟LOL
												<div class="pull-right">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
											</div>
											<h3 style="font-size: 14px;">《英雄联盟》(简称LOL)是由美国拳头游戏(Riot Games)开发、中国大陆地区腾讯游戏代理运营的英雄对战MOBA竞技网游。</h3>
											<strong>￥36.00</strong>
											<div><a href="Javascript: void(0)" class="btn btn-default" role="button" data-price="36.00" data-proid="105" data-proname="英雄联盟LOL" data-proimg="goods_img/5.jpg">
											Add to Cart</a><span class="pull-right"><i class="fa fa-heart-o"></i> Add to Favourite</span></div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumbnail">
										<span class="service-link text-center">
											<img class="img-responsive" src="goods_img/6.jpg" alt="">
											<div class="list-inline">
												<a href="javascript:void(0);"><i class="fa fa-eye"></i></a>
												<a href="javascript:void(0);"><i class="fa fa-link"></i></a>
											</div>
										</span>
										<div class="caption">
											<div class="category"> 战地3
												<div class="pull-right">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
											</div>
											<h3 style="font-size: 14px;">游戏采用了寒霜引擎，展现了更强大的3D细节效果，把动画、环境破坏、光照、地图和音效提升到一个新的高度。</h3>
											<strong>￥88.00</strong>
											<div><a href="Javascript: void(0)" class="btn btn-default" role="button" data-price="88.00" data-proid="106" data-proname="战地3" data-proimg="goods_img/6.jpg">
											Add to Cart</a><span class="pull-right"><i class="fa fa-heart-o"></i> Add to Favourite</span></div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumbnail">
										<span class="service-link text-center">
											<img class="img-responsive" src="goods_img/7.jpg" alt="">
											<div class="list-inline">
												<a href="javascript:void(0);"><i class="fa fa-eye"></i></a>
												<a href="javascript:void(0);"><i class="fa fa-link"></i></a>
											</div>
										</span>
										<div class="caption">
											<div class="category"> 刺客信条4：黑旗
												<div class="pull-right">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
											</div>
											<h3 style="font-size: 14px;">游戏中将出现如黑胡子、查理斯·范恩等多位历史上着名的海盗王，带领玩家探索西印度群岛的众多岛屿和广大海域，重现那海盗的黄金年代。</h3>
											<strong>￥67.00</strong>
											<div><a href="Javascript: void(0)" class="btn btn-default" role="button" data-price="67.00" data-proid="107" data-proname="刺客信条4：黑旗" data-proimg="goods_img/7.jpg">
											Add to Cart</a><span class="pull-right"><i class="fa fa-heart-o"></i> Add to Favourite</span></div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumbnail">
										<span class="service-link text-center">
											<img class="img-responsive" src="goods_img/8.jpg" alt="">
											<div class="list-inline">
												<a href="javascript:void(0);"><i class="fa fa-eye"></i></a>
												<a href="javascript:void(0);"><i class="fa fa-link"></i></a>
											</div>
										</span>
										<div class="caption">
											<div class="category"> 最终幻想15
												<div class="pull-right">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
											</div>
											<h3 style="font-size: 14px;">《最终幻想XV》（Final Fantasy XV，简称：FFXV、FF15）是由史克威尔艾尼克斯开发制作的动作角色扮演类游戏。</h3>
											<strong>￥9.00</strong>
											<div>
												<a href="Javascript: void(0)" class="btn btn-default" role="button" data-price="9.00" data-proid="108" data-proname="最终幻想15" data-proimg="goods_img/8.jpg">
												Add to Cart</a><span class="pull-right"><i class="fa fa-heart-o"></i> Add to Favourite</span></div>
										</div>
									</div>
								</div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>		
		
		<div class="m-sidebar">
			<div class="cd-cart-container empty">
			<a href="#0" class="cd-cart-trigger">
				购物车
				<ul class="count">
					<!-- cart items count -->
					<li>0</li>
					<li>0</li>
				</ul>
				<!-- .count -->
			</a>

			<div class="cd-cart">
				<div class="wrapper">
					<header>
						<h2>购物车</h2>
						<span class="undo">已删除 <a href="#0">恢复</a></span>
					</header>

					<div class="body">
						<ul>
							<!-- products added to the cart will be inserted here using JavaScript -->
						</ul>
					</div>

					<footer>
						<a href="" class="checkout"><em>结算 - ￥<span>0</span></em></a>
					</footer>
				</div>
			</div>
			<!-- .cd-cart -->
		</div>
			<div class="cart">
				<i id="end"></i>
				<span>购物车</span>
			</div>
		</div>
		<div id="msg">已成功加入购物车！</div>
		
		<!-- special price -->
		<section class="special-price">
			<div class="price-intro">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="pull-left">
							<blockquote>
								<h1> 使命召唤</h1>
								<p>If anyone says a pen is sharper than a gun, he must have never encountered a fully automatic weapon. </p>
							</blockquote>
							</div>
							<div class="pull-right"><a class="btn btn-default btn-lg"> Call Of Duty</a>
							</div> 
						</div>
					</div>
				</div>
			</div>
		</section>	
		
		<!-- sponsor -->
		<section class="sponsor">
			<div class="container">			
				<div id="sponsor" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div class="row">	
								<div class="col-sm-12">
									<ul class="list-inline text-center">
										<li><img class="" src="images/1.gif" /></li>
										<li><img class="" src="images/2.png" /></li>
										<li><img class="" src="images/3.png" /></li>
										<li><img class="" src="images/4.png" /></li>
										<li><img class="" src="images/5.png" /></li>
										<li><img class="" src="images/6.png" /></li>
										<li><img class="" src="images/7.png" /></li>
										<li><img class="" src="images/8.png" /></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">	
								<div class="col-sm-12">
									<ul class="list-inline text-center">
										<li><img class="" src="images/1.gif" /></li>
										<li><img class="" src="images/2.png" /></li>
										<li><img class="" src="images/3.png" /></li>
										<li><img class="" src="images/4.png" /></li>
										<li><img class="" src="images/5.png" /></li>
										<li><img class="" src="images/6.png" /></li>
										<li><img class="" src="images/7.png" /></li>
										<li><img class="" src="images/8.png" /></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					 <!--Controls--> 
				<a class="control-left" href="#sponsor" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a>
				<a class="control-right" href="#sponsor" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a>
				</div>			
			</div>
		</section>
		
		<!-- social icons -->
		<section class="social-icons">
			<div class="container">			
				<div class="row">	
					<div class="col-sm-12">
						<ul class="list-inline text-center">
							<li><a href="javascript:void(0);" ><i class="fa fa-facebook"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-spotify"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-tumblr"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-share-alt"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-linkedin"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-delicious"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-instagram"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-dropbox"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-soundcloud"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-pinterest"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-google-plus"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-github-alt"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-skype"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-stumbleupon"></i></a></li>
							<li><a href="javascript:void(0);" ><i class="fa fa-youtube"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>	
				
  </body>
</html>
