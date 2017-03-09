<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.edu.djtu.pojo.UserInfo"%>
<%@page import="cn.edu.djtu.pojo.ShopCar"%>
<%@page import="cn.edu.djtu.bean.CarListBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=0.69, minimum-scale=0.69, maximum-scale=1.0, user-scalable=yes" />
<link rel="icon" href="img/favicon.ico">

<title>Xunjie Take Out System</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<%
	if (session.getAttribute("userid") == null) {
		response.sendRedirect("index.action");
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
					<li class="active"><a href="car.action">购物车</a></li>
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
	<!-- /.carousel -->




	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->


	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-1 main">
				<div class="table-responsive">
					<h4>购物车</h4>
					<table class="table table-striped ">

						<%
							if (request.getAttribute("carlist") != null) {
								List<CarListBean> catBeans = (List<CarListBean>) request.getAttribute("carlist");
								for (int b = 0; b < catBeans.size(); b++) {
						%>
						<tr>
							<td><img alt="gaga" src="<%=catBeans.get(b).getImg()%>"
								style="width: 140px; height: 80px;"></td>
							<td><p><%=catBeans.get(b).getName()%></p>
								<p>
									单价：<%=catBeans.get(b).getPrise()%></p></td>
							<td>数量：</td>
							<td><input style="width: 35px" class="form-control"
								value="<%=catBeans.get(b).getNum()%>" readonly="readonly"></input></td>
							<td></td>
							<td><a
								href="delete.action?action=car&id=<%=catBeans.get(b).getTakeoutId()%>">删除</a></td>
						</tr>
						<%
							}
							}
						%>
						<%-- 	 --%>
					</table>
					<form action="submitorders.action" method="post">
						<input name="submitPrise" style="display: none;"
							value="${sumPrise}" />
						<table class="table">
							<tr style="float: right">
								<td>共计:${sumPrise} &nbsp;</td>
								<td><button class=" btn  btn-primary " type="submit">提交订单</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- /END THE FEATURETTES -->

	<hr class="featurette-divider">
	<!-- FOOTER -->
	<footer> 
	<div align="center">
			<p >
				&copy;2017 XunJie, TakeOut. &middot;
				<!-- <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a> -->
			</p>
			</div>
	</footer>

	<!-- /.container -->

	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="dist/js/bootstrap.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->
	<!-- PAGE LEVEL SCRIPTS -->
</body>
</html>
