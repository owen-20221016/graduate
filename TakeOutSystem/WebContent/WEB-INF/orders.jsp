<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="cn.edu.djtu.pojo.UserInfo"%>
<%@page import="cn.edu.djtu.bean.OrderBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=0.8, minimum-scale=0.8, maximum-scale=1.0, user-scalable=yes" />


<link rel="icon" href="img/favicon.ico">

<title>Xunjie Take Out System</title>
<link charset="utf-8" rel="stylesheet" href="dist/css/style_tb.css" />
<link rel="stylesheet" href="dist/css/global-min.css">
<link rel="stylesheet" href="dist/css/base.css" />
<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="dist/css/scarousel.css" rel="stylesheet">
<link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<script type="text/javascript">
	function init() {
		var divs = $('.weiwancheng');
		for (var a = 0; a < divs.length; a++) {
			divs[a].style.display = "";
		}
		var divs1 = $('.wancheng');
		for (var a = 0; a < divs1.length; a++) {
			divs1[a].style.display = "none";
		}
	}
	function showorders() {
		var selectOption = document.getElementById("sele1").value;
		if (selectOption == 1) {
			var divs = $('.weiwancheng');
			for (var a = 0; a < divs.length; a++) {
				divs[a].style.display = "";
			}
			var divs1 = $('.wancheng');
			for (var a = 0; a < divs1.length; a++) {
				divs1[a].style.display = "none";
			}

		} else if (selectOption == 2) {
			var divs1 = $('.wancheng');
			for (var a = 0; a < divs1.length; a++) {
				divs1[a].style.display = "";
			}
			var divs = $('.weiwancheng');
			for (var a = 0; a < divs.length; a++) {
				divs[a].style.display = "none";
			}
		} else {
			var divs1 = $('.wancheng');
			for (var a = 0; a < divs1.length; a++) {
				divs1[a].style.display = "";
			}
			var divs = $('.weiwancheng');
			for (var a = 0; a < divs.length; a++) {
				divs[a].style.display = "";
			}
		}
	}
</script>
<!-- NAVBAR
================================================== -->
<body onload="init()">
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
					<li><a href="car.action">购物车</a></li>
					<li class="active" class="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown">我的 <span
							class="caret"></span></a>
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
					<h4>我的订单：</h4>
					<table
						class="bought-table-mod__table___1L6n7 table-head-mod__table___3CnjL">
						<colgroup>
							<col class="bought-table-mod__col1___tEI2t">
							<col class="bought-table-mod__col2___2WR2j">
							<col class="bought-table-mod__col3___3VZXx">
							<col class="bought-table-mod__col4___1owRn">
							<col class="bought-table-mod__col5___RKtIJ">
							<col class="bought-table-mod__col6___jS-bm">
							<col class="bought-table-mod__col7___1i7Bw">
						</colgroup>
						<tbody>
							<tr>
								<th>&nbsp;&nbsp;&nbsp;&nbsp;外卖</th>
								<th></th>
								<th></th>
								<th></th>
								<th>&nbsp;总价</th>
								<th>&nbsp;<select id="sele1" onchange="showorders()"><option
											value="1">未完成</option>
										<option value="2">已完成</option>
										<option value="3">全部订单</option>
								</select></th>
								<th>&nbsp;交易操作</th>
							</tr>
						</tbody>
					</table>

					<%
						List<OrderBean> orderBeans = (List<OrderBean>) request.getAttribute("ordersListF");
						for (int a = 0; a < orderBeans.size(); a++) {
							if (orderBeans.get(a).getFinishmark().equals("1")) {
					%>

					<div class="index-mod__order-container___1ur4- wancheng"
						style="display: none">
						<div
							class="bought-wrapper-mod__trade-order___1imfF bought-wrapper-mod__closed___1z_cT">
							<table
								class="bought-table-mod__table___1L6n7 bought-wrapper-mod__table___1EWPf">
								<colgroup>
									<col class="bought-table-mod__col1___tEI2t">
									<col class="bought-table-mod__col2___2WR2j">
									<col class="bought-table-mod__col3___3VZXx">
									<col class="bought-table-mod__col4___1owRn">
									<col class="bought-table-mod__col5___RKtIJ">
									<col class="bought-table-mod__col6___jS-bm">
									<col class="bought-table-mod__col7___1i7Bw">
								</colgroup>
								<tbody class="bought-wrapper-mod__head___1bWa2">
									<tr>
										<td class="bought-wrapper-mod__head-info-cell___3TQit"><label
											class="bought-wrapper-mod__checkbox-label___3WXD2"><span
												class="bought-wrapper-mod__create-time___2uGTe"><%=orderBeans.get(a).getStarttime()%></span></label><span><span>订单号</span><span>:
											</span><span><%=orderBeans.get(a).getOrderNumber()%></span></span></td>
										<td colspan="2"
											class="bought-wrapper-mod__seller-container___CZux2"><span></span></td>
										<td><span id="webww1"></span></td>
										<td colspan="3"
											class="bought-wrapper-mod__thead-operations-container___3cYGt"></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td class="sol-mod__no-br___3hxdf"><%=orderBeans.get(a).getTakeout()%>
											等</td>
										<td class="sol-mod__no-br___3hxdf"><div
												class="price-mod__price___109Qt">
												<p></p>
											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div></div></td>
										<td><div>
												<p style="margin-bottom: 3px;"></p>
											</div></td>
										<td class=""><div>
												<div class="price-mod__price___109Qt">
													<p>
														<strong><span>￥</span><span><%=orderBeans.get(a).getSumPrise()%></span></strong>
													</p>
												</div>
												<div style="font-family: verdana;">
													<div></div>
												</div>
											</div></td>
										<td class=""><div>
												<p style="margin-bottom: 3px;">
													<span class="text-mod__link___2QaZ1"><a
														class="btn btn-success btn-sm">已收货</a></span>
												</p>
												<div>
													<p style="margin-bottom: 3px;"></p>
													<p style="margin-bottom: 3px;"></p>
												</div>
											</div></td>
										<td class=""><div>
												<p style="margin-bottom: 3px;">
													<a class="btn btn-default btn-sm">确认收货</a>
												</p>
											</div></td>
									</tr>
									<tr>
										<td class="sol-mod__no-br___3hxdf"><div
												class="ml-mod__container___13ib5 production-mod__production___3Nifw suborder-mod__production___3WebF">
												<div class="ml-mod__media___3eEG4" style="width: 0;"></div>
												<div style="margin-left: 0;">
													<p>
														<span>地址：</span><span><%=orderBeans.get(a).getAddress()%></span>
													</p>
												</div>
											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div
												class="price-mod__price___109Qt">
												<p><%=orderBeans.get(a).getName()%></p>

											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div></div></td>
										<td><div>
												<span><%=orderBeans.get(a).getTelephone()%></span>
											</div></td>
										<td class="sol-mod__no-bt___3KjSb"></td>
										<td class="sol-mod__no-bt___3KjSb"></td>
										<td class="sol-mod__no-bt___3KjSb"><a href="delete.action?action=orders&id=<%=session.getAttribute("userid")%>&location=front&orderid=<%=orderBeans.get(a).getOrderNumber()%>">删除</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<%
						} else if (orderBeans.get(a).getFinishmark().equals("2")) {
					%>
					<div class="index-mod__order-container___1ur4- weiwancheng"
						style="display: none">
						<div
							class="bought-wrapper-mod__trade-order___1imfF bought-wrapper-mod__closed___1z_cT">
							<table
								class="bought-table-mod__table___1L6n7 bought-wrapper-mod__table___1EWPf">
								<colgroup>
									<col class="bought-table-mod__col1___tEI2t">
									<col class="bought-table-mod__col2___2WR2j">
									<col class="bought-table-mod__col3___3VZXx">
									<col class="bought-table-mod__col4___1owRn">
									<col class="bought-table-mod__col5___RKtIJ">
									<col class="bought-table-mod__col6___jS-bm">
									<col class="bought-table-mod__col7___1i7Bw">
								</colgroup>
								<tbody class="bought-wrapper-mod__head___1bWa2">
									<tr>
										<td class="bought-wrapper-mod__head-info-cell___3TQit"><label
											class="bought-wrapper-mod__checkbox-label___3WXD2"><span
												class="bought-wrapper-mod__create-time___2uGTe"><%=orderBeans.get(a).getStarttime()%></span></label><span><span>订单号</span><span>:
											</span><span><%=orderBeans.get(a).getOrderNumber()%></span></span></td>
										<td colspan="2"
											class="bought-wrapper-mod__seller-container___CZux2"><span></span></td>
										<td><span id="webww1"></span></td>
										<td colspan="3"
											class="bought-wrapper-mod__thead-operations-container___3cYGt"></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td class="sol-mod__no-br___3hxdf"><%=orderBeans.get(a).getTakeout()%>
											等</td>
										<td class="sol-mod__no-br___3hxdf"><div
												class="price-mod__price___109Qt">
												<p></p>
											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div></div></td>
										<td><div>
												<p style="margin-bottom: 3px;"></p>
											</div></td>
										<td class=""><div>
												<div class="price-mod__price___109Qt">
													<p>
														<strong><span>￥</span><span><%=orderBeans.get(a).getSumPrise()%></span></strong>
													</p>
												</div>
												<div style="font-family: verdana;">
													<div></div>
												</div>
											</div></td>
										<td class=""><div>
												<p style="margin-bottom: 3px;">
													<span class="text-mod__link___2QaZ1"><a
														class="btn btn-warning btn-sm">已发货</a></span>
												</p>
												<div>
													<p style="margin-bottom: 3px;"></p>
													<p style="margin-bottom: 3px;"></p>
												</div>
											</div></td>
										<td class=""><div>
												<p style="margin-bottom: 3px;">
													<a class="btn btn-success btn-sm" href="orderctrl.action?userid=<%=session.getAttribute("userid")%>&orderNumber=<%=orderBeans.get(a).getOrderNumber()%>&mark=1&location=front">确认收货</a>
												</p>
											</div></td>
									</tr>
									<tr>
										<td class="sol-mod__no-br___3hxdf"><div
												class="ml-mod__container___13ib5 production-mod__production___3Nifw suborder-mod__production___3WebF">
												<div class="ml-mod__media___3eEG4" style="width: 0;"></div>
												<div style="margin-left: 0;">
													<p>
														<span>地址：</span><span><%=orderBeans.get(a).getAddress()%></span>
													</p>
												</div>
											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div
												class="price-mod__price___109Qt">
												<p><%=orderBeans.get(a).getName()%></p>

											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div></div></td>
										<td><div>
												<span><%=orderBeans.get(a).getTelephone()%></span>
											</div></td>
										<td class="sol-mod__no-bt___3KjSb"></td>
										<td class="sol-mod__no-bt___3KjSb"></td>
										<td class="sol-mod__no-bt___3KjSb"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<%
						} else {
					%>
					<div class="index-mod__order-container___1ur4- weiwancheng"
						style="display: none">
						<div
							class="bought-wrapper-mod__trade-order___1imfF bought-wrapper-mod__closed___1z_cT">
							<table
								class="bought-table-mod__table___1L6n7 bought-wrapper-mod__table___1EWPf">
								<colgroup>
									<col class="bought-table-mod__col1___tEI2t">
									<col class="bought-table-mod__col2___2WR2j">
									<col class="bought-table-mod__col3___3VZXx">
									<col class="bought-table-mod__col4___1owRn">
									<col class="bought-table-mod__col5___RKtIJ">
									<col class="bought-table-mod__col6___jS-bm">
									<col class="bought-table-mod__col7___1i7Bw">
								</colgroup>
								<tbody class="bought-wrapper-mod__head___1bWa2">
									<tr>
										<td class="bought-wrapper-mod__head-info-cell___3TQit"><label
											class="bought-wrapper-mod__checkbox-label___3WXD2"><span
												class="bought-wrapper-mod__create-time___2uGTe"><%=orderBeans.get(a).getStarttime()%></span></label><span><span>订单号</span><span>:
											</span><span><%=orderBeans.get(a).getOrderNumber()%></span></span></td>
										<td colspan="2"
											class="bought-wrapper-mod__seller-container___CZux2"><span></span></td>
										<td><span id="webww1"></span></td>
										<td colspan="3"
											class="bought-wrapper-mod__thead-operations-container___3cYGt"></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td class="sol-mod__no-br___3hxdf"><%=orderBeans.get(a).getTakeout()%>
											等</td>
										<td class="sol-mod__no-br___3hxdf"><div
												class="price-mod__price___109Qt">
												<p></p>
											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div></div></td>
										<td><div>
												<p style="margin-bottom: 3px;"></p>
											</div></td>
										<td class=""><div>
												<div class="price-mod__price___109Qt">
													<p>
														<strong><span>￥</span><span><%=orderBeans.get(a).getSumPrise()%></span></strong>
													</p>
												</div>
												<div style="font-family: verdana;">
													<div></div>
												</div>
											</div></td>
										<td class=""><div>
												<p style="margin-bottom: 3px;">
													<span class="text-mod__link___2QaZ1"><a
														class="btn btn-danger btn-sm">未发货</a></span>
												</p>
												<div>
													<p style="margin-bottom: 3px;"></p>
													<p style="margin-bottom: 3px;"></p>
												</div>
											</div></td>
										<td class=""><div>
												<p style="margin-bottom: 3px;">
													<a class="btn btn-default btn-sm">点击发货</a>
												</p>
											</div></td>
									</tr>
									<tr>
										<td class="sol-mod__no-br___3hxdf"><div
												class="ml-mod__container___13ib5 production-mod__production___3Nifw suborder-mod__production___3WebF">
												<div class="ml-mod__media___3eEG4" style="width: 0;"></div>
												<div style="margin-left: 0;">
													<p>
														<span>地址：</span><span><%=orderBeans.get(a).getAddress()%></span>
													</p>
												</div>
											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div
												class="price-mod__price___109Qt">
												<p><%=orderBeans.get(a).getName()%></p>

											</div></td>
										<td class="sol-mod__no-br___3hxdf"><div></div></td>
										<td><div>
												<span><%=orderBeans.get(a).getTelephone()%></span>
											</div></td>
										<td class="sol-mod__no-bt___3KjSb"></td>
										<td class="sol-mod__no-bt___3KjSb"></td>
										<td class="sol-mod__no-bt___3KjSb"><a href="delete.action?action=orders&id=<%=session.getAttribute("userid")%>&location=front&orderid=<%=orderBeans.get(a).getOrderNumber()%>">删除</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<%
						}
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<!-- /END THE FEATURETTES -->

	<hr class="featurette-divider">
	<!-- FOOTER -->
	<footer> <!-- <p class="pull-right">
				<a href="#">Back to top</a>
			</p> -->
	<div align="center">
		<p>
			&copy;2017 XunJie, TakeOut. &middot;
			<!-- <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a> -->
		</p>
	</div>
	</footer>

	<!-- /.container -->

	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="dist/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="dist/js/bootstrap.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->
	<!-- PAGE LEVEL SCRIPTS -->
	<script src="assets/datatable/jquery.dataTables.min.js"></script>
	<script src="assets/js/dataTables.bootstrap.js"></script>
</body>
</html>
