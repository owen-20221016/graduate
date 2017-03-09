<%@page import="cn.edu.djtu.pojo.UserInfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="外卖">
<meta name="author" content="owen">
<link rel="icon" href="img/favicon.ico">

<title>迅捷外卖订餐系统</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">

<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="dist/css/scarousel.css" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>
	<%
		request.getQueryString();
		if (session.getAttribute("takeout") == null) {
			response.sendRedirect("index.action");
		}
	%>
	<div class="navbar-wrapper">
		<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.action">迅捷外卖订餐系统</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">

					<ul class="nav navbar-nav">
						<li class="active"><a href="index.action">首页</a></li>
						<li><a href="takeout.action">外卖</a></li>
						<li><a href="car.action">购物车</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">我的 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="orders.action?mark=front">订单</a></li>
								<li><a href="jumpdirect.action?location=userinfo">设置</a></li>
								<li class="divider"></li>

								<%
									if (session.getAttribute("iscmd") != null) {
										if (session.getAttribute("iscmd").equals(1)) {
											out.print("<li><a href=\"takeout.action?mark=back\">后台</a></li>");
										}
									}
								%>


								<li><a href="logout.action">退出</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav" style="float: right">
						<%
							if (session.getAttribute("userid") != null) {
								if (session.getAttribute("userinfo") != null) {
									UserInfo userinfo = (UserInfo) session.getAttribute("userinfo");
										out.print("<li><a>欢迎：" + userinfo.getName() + "</a></li>");
								} else {
									out.print("<li><a>欢迎：新用户，请设置个人信息！</a></li>");
								}
							} else {
								out.print("<li><a href=\"jumpdirect.action?location=register\">注册</a></li>");
								out.print("<li><a href=\"login.action\">登陆</a></li>");
							}
						%>

					</ul>
				</div>
			</div>
		</nav>
	</div>


	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" style="margin-top: -20px" role="listbox">
			<div class="item active">
				<img src="${takeout[0].img}" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<p>
						<h2>${takeout[0].name}</h2>
						<h1>仅售:${takeout[0].prise}えん</h1>
						<a class="btn btn-lg btn-primary"
							href="carctrl.action?action=add&id=${takeout[0].id}"
							role="button">加入购物车</a>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="${takeout[1].img}" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h2>${takeout[1].name}</h2>
						<h1>仅售:${takeout[1].prise}えん</h1>
						<p>
							<a class="btn btn-lg btn-primary"
								href="carctrl.action?action=add&id=${takeout[1].id}"
								role="button">加入购物车</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="${takeout[2].img}" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h2>${takeout[2].name}</h2>
						<h1>仅售:${takeout[2].prise}えん</h1>
						<p>
							<a class="btn btn-lg btn-primary"
								href="carctrl.action?action=add&id=${takeout[2].id}"
								role="button">加入购物车</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->

	<hr class="featurette-divider">


	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">

		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-4">
				<img class="img-rounded" src="sysimg/5.png"
					alt="Generic placeholder image"
					style="width: 200px; height: 200px;">
				<h2>加盟信息</h2>
				<p>请联系114转10086</p>
			</div>
			<div class="col-lg-4">
				<img class="img-rounded" src="sysimg/6.png"
					alt="Generic placeholder image"
					style="width: 200px; height: 200px;">
				<h2>扫描访问</h2>
				<p>网站采用HTML5编写，在手机端也可完美显示。扫描下试试吧！</p>
			</div>
			<div class="col-lg-4">
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix"><span class="chat-img pull-left">
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<small class="pull-right text-muted label label-danger">
										<i class="icon-time"></i> <%
 	out.print(DateFormat.getDateInstance().format(new Date()));
 %>
									</small>
								</div>
								<br>
								<h4>${msg[0].message}</h4>
							</div></li>
					</ul>
				</div>
			</div>

			<!-- /.col-lg-4 -->

			<!-- /.col-lg-4 -->

		</div>



		<hr class="featurette-divider">

		<!-- /END THE FEATURETTES -->


		<!-- FOOTER -->
		<footer>
			<div align="center">
				<p>
					&copy;2017 XunJie, TakeOut. &middot;
					<!-- <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a> -->
				</p>
			</div>
		</footer>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>
	<script src="assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
