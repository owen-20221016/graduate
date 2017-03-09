<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.djtu.pojo.Takeout"%>
<%@page import="cn.edu.djtu.pojo.UserInfo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="img/favicon.ico">

<title>Xunjie Take Out System</title>

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
<link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<!-- NAVBAR
================================================== -->
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
					<li class="active"><a href="takeout.action">外卖</a></li>
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
	<!-- /.carousel -->




	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->


	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-1 main">
				<div class="table-responsive">
					<h4>请点餐：</h4>
					<hr class="featurette-divider">
					<table class="table table-striped " id="fenye">
						<thead>
							<tr role="row">
								<th style="width: 140px"></th>
								<th style="width: 140px"></th>
								<th style="width: 20px"></th>
							</tr>
						</thead>
						<tbody>


							<%
								List<Takeout> list = (List<Takeout>) session.getAttribute("takeouts");
								for (int a = 0; a < list.size(); a++) {
							%>
							<tr>
								<td><img alt="gaga" src="<%=list.get(a).getImg()%>"
									style="width: 140px; height: 80px;"></td>
								<td><p><%=list.get(a).getName()%></p>
									<P>
										<code>
											<%
												if (list.get(a).getSellnum() < 10) {
											%>
											<span class="glyphicon glyphicon-star-empty"></span> <span
												class="glyphicon glyphicon-star-empty"></span> <span
												class="glyphicon glyphicon-star-empty"></span> <span
												class="glyphicon glyphicon-star-empty"></span> <span
												class="glyphicon glyphicon-star"></span>
											<%
												} else if (list.get(a).getSellnum() < 50) {
											%>
											<span class="glyphicon glyphicon-star-empty"></span> <span
												class="glyphicon glyphicon-star-empty"></span> <span
												class="glyphicon glyphicon-star-empty"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
											<%
												} else if (list.get(a).getSellnum() < 100) {
											%>
											<span class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span>
											<%
												} else {
											%>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
											<%
												}
											%>
										</code>
									</P>
									<p>
										售价：<%=list.get(a).getPrise()%></p></td>
								<td><a
									href="carctrl.action?action=add&id=<%=list.get(a).getId()%>"><button
											class=" btn  btn-primary " type="button">+</button></a></td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- /END THE FEATURETTES -->

	<hr class="featurette-divider">
	<!-- FOOTER -->
	<footer>
			<!-- <p class="pull-right">
				<a href="#">Back to top</a>
			</p> -->
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
	<script>
		$(document).ready(function() {
			$('#fenye').dataTable({

				"bFilter" : true, //去掉搜索框方法三：这种方法可以
				"bLengthChange" : false, //去掉每页显示多少条数据方法
				"sPaginationType" : "full_numbers",
				"oLanguage" : {
					"sLengthMenu" : "每页显示 _MENU_ 条记录",
					"sZeroRecords" : "抱歉， 没有找到",
					"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
					"sInfoEmpty" : "没有数据",
					"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
					"sZeroRecords" : "没有检索到数据",
					"sSearch" : "名称:",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "前一页",
						"sNext" : "后一页",
						"sLast" : "尾页"
					}
				}
			});
		});
	</script>
</body>
</html>