<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.edu.djtu.pojo.UserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>Starter Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="starter-template.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
	if (session.getAttribute("userid") == null) {
		response.sendRedirect("index.jsp");
	}
%>
<body>

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
					<li><a href="index.action">首页</a></li>
					<li><a href="takeout.action">外卖</a></li>
					<li ><a href="car.action">购物车</a></li>
					<li class="active" class="dropdown"><a href="#" class="dropdown-toggle"
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

	<div class="container">
		<div class="panel-body">
			<div class="row">
				<div>
					<div class="col-lg-7">
						<form role="form" method="post" action="userinfo.action">
							<div class="form-group">
								<label>姓名</label> <input name="name" placeholder="迅捷网上订餐"
									value="${userinfo.name}" class="form-control" />
							</div>
							<div class="form-group">
								<label>性别</label> <br>
								<%
									if (session.getAttribute("userinfo") != null) {

										UserInfo userinfo = (UserInfo) session.getAttribute("userinfo");

										if (userinfo.getSex() == null) {
								%>
								<label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline1" value="1"
									checked="checked">男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline2" value="0">女
								</label>
								<%
									} else if (userinfo.getSex() == 0) {
								%>
								<label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline1" value="1">男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline2" value="0"
									checked="checked">女
								</label>
								<%
									} else {
								%>

								<label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline1" value="1"
									checked="checked">男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline2" value="0">女
								</label>
								<%
									}
									} else {
								%>

								<label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline1" value="1"
									checked="checked">男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="optionsRadiosInline2" value="0">女
								</label>
								<%
									}
								%>

							</div>
							<div class="form-group">
								<label>电话号码</label> <input class="form-control" name="telephone"
									placeholder="13300000000" value="${userinfo.telephone}">
							</div>
							<div class="form-group">
								<label>拍送地址</label>
								<textarea name="address" class="form-control" rows="3"
									placeholder="大连">${userinfo.address}</textarea>
							</div>
							${userMsg}<br>
							<button type="submit" class="btn btn-default">修改</button>
							<button type="reset" class="btn btn-default">还原</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
	<!-- GLOBAL SCRIPTS -->
	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<script src="assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>
	<script src="assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
	<script>
		
	</script>
</body>
</html>
