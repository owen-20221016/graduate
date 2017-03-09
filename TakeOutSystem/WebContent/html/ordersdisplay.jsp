<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.djtu.pojo.Takeout"%>
<%@page import="cn.edu.djtu.pojo.UserInfo"%>
<%@page import="cn.edu.djtu.bean.OrderBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link charset="utf-8" rel="stylesheet" href="dist/css/style_tb.css" />
<link rel="stylesheet" href="dist/css/global-min.css">
<link rel="stylesheet" href="dist/css/base.css" />

<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css" />
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="dist/css/dashboard.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
	/* if (session.getAttribute("userid") == null) {
		response.sendRedirect("index.action");
	} else if (session.getAttribute("iscmd").equals(0)) {
		response.sendRedirect("index.action");
	} else if (session.getAttribute("takeouts") == null) {
		response.sendRedirect("takeout.action?mark=back");
	} */
%>
<script type="text/javascript">

function init() {
	var divs = $('.weiwancheng');
	for (var a = 0; a < divs.length;a++) {
		divs[a].style.display="";
	}
	var divs1 = $('.wancheng');
	for (var a = 0; a < divs1.length;a++) {
		divs1[a].style.display="none";
	}
}
function showorders() {
	var selectOption = document.getElementById("sele1").value;
	if (selectOption == 1) {
		var divs = $('.weiwancheng');
		for (var a = 0; a < divs.length;a++) {
			divs[a].style.display="";
		}
		var divs1 = $('.wancheng');
		for (var a = 0; a < divs1.length;a++) {
			divs1[a].style.display="none";
		}
	
	} else if(selectOption == 2){
		var divs1 = $('.wancheng');
		for (var a = 0; a < divs1.length;a++) {
			divs1[a].style.display="";
		}
		var divs = $('.weiwancheng');
		for (var a = 0; a < divs.length;a++) {
			divs[a].style.display="none";
		}
	} else {
		var divs1 = $('.wancheng');
		for (var a = 0; a < divs1.length;a++) {
			divs1[a].style.display="";
		}
		var divs = $('.weiwancheng');
		for (var a = 0; a < divs.length;a++) {
			divs[a].style.display="";
		}
	}
}


</script>
<style>
</style>
<body onload="init()">


	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a class="navbar-brand"
					href="takeout.action?mark=back">迅捷外卖订餐系统后台</a></li>
				<li><a href="index.action">首页</a></li>
				<li><a href="takeout.action">外卖</a></li>
			</ul>
			<ul class="nav navbar-nav" style="float: right">
				<li><a href="logout.action">退出</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="takeout.action?mark=back">菜品浏览<span
							class="sr-only">(current)</span></a></li>
					<li><a href=userlist.action>用户浏览</a></li>
					<li class="active"><a href="orders.action?mark=back">订单管理</a></li>
					<li><a href="messagedisplay.action">消息编辑</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
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
							<th>&nbsp;<select id="sele1" onchange="showorders()"><option value="1">未完成</option>
							<option value="2">已完成</option>
							<option value="3">全部订单</option>
							</select></th>
							<th>&nbsp;交易操作</th>
						</tr>
					</tbody>
				</table>
				
				<div class="index-mod__order-container___1ur4- weiwancheng" style="display: none">					<div class="bought-wrapper-mod__trade-order___1imfF bought-wrapper-mod__closed___1z_cT">
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
											class="bought-wrapper-mod__create-time___2uGTe">2016-11-26 11:23:23</span></label><span><span>订单号</span><span>:
										</span><span>2353178186251648</span></span></td>
									<td colspan="2"
										class="bought-wrapper-mod__seller-container___CZux2"><span></span></td>
									<td><span id="webww1"></span></td>
									<td colspan="3"
										class="bought-wrapper-mod__thead-operations-container___3cYGt"></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td class="sol-mod__no-br___3hxdf">
											海鲜烧烤 等
										</td>
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
													<strong><span>￥</span><span>15.50</span></strong>
												</p>
											</div>
											<div style="font-family: verdana;">
												<div></div>
											</div>
										</div></td>
									<td class=""><div>
											<p style="margin-bottom: 3px;">
												<span class="text-mod__link___2QaZ1"><a class="btn btn-danger btn-sm" href="#">未发货</a></span>
											</p>
											<div>
												<p style="margin-bottom: 3px;"></p>
												<p style="margin-bottom: 3px;"></p>
											</div>
										</div></td>
									<td class=""><div>
											<p style="margin-bottom: 3px;"><a class="btn btn-warning btn-sm" href="#">进行发货</a></p>
										</div></td>
								</tr>
								<tr>
									<td class="sol-mod__no-br___3hxdf"><div
											class="ml-mod__container___13ib5 production-mod__production___3Nifw suborder-mod__production___3WebF">
											<div class="ml-mod__media___3eEG4" style="width: 0;"></div>
											<div style="margin-left: 0;">
												<p>
													<span>地址：</span><span>辽宁省大连市甘井子区兴发路216号大连交通大学</span>
												</p>
											</div>
										</div></td>
									<td class="sol-mod__no-br___3hxdf"><div
											class="price-mod__price___109Qt">
											<p>明强</p>
											
										</div></td>
									<td class="sol-mod__no-br___3hxdf"><div></div></td>
									<td><div><span>13130000212</span></div></td>
									<td class="sol-mod__no-bt___3KjSb"></td>
									<td class="sol-mod__no-bt___3KjSb"></td>
									<td class="sol-mod__no-bt___3KjSb"><a href="#">删除</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
             <div class="index-mod__order-container___1ur4- weiwancheng" style="display: none">
					<div class="bought-wrapper-mod__trade-order___1imfF bought-wrapper-mod__closed___1z_cT">
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
											class="bought-wrapper-mod__create-time___2uGTe">2016-11-26 11:23:23</span></label><span><span>订单号</span><span>:
										</span><span>2353178186251648</span></span></td>
									<td colspan="2"
										class="bought-wrapper-mod__seller-container___CZux2"><span></span></td>
									<td><span id="webww1"></span></td>
									<td colspan="3"
										class="bought-wrapper-mod__thead-operations-container___3cYGt"></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td class="sol-mod__no-br___3hxdf">
											海鲜烧烤 等
										</td>
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
													<strong><span>￥</span><span>15.50</span></strong>
												</p>
											</div>
											<div style="font-family: verdana;">
												<div></div>
											</div>
										</div></td>
									<td class=""><div>
											<p style="margin-bottom: 3px;">
												<span class="text-mod__link___2QaZ1"><a class="btn btn-warning btn-sm" href="#">已发货</a></span>
											</p>
											<div>
												<p style="margin-bottom: 3px;"></p>
												<p style="margin-bottom: 3px;"></p>
											</div>
										</div></td>
									<td class=""><div>
											<p style="margin-bottom: 3px;"><a class="btn btn-success btn-sm" href="#">确认收货</a></p>
										</div></td>
								</tr>
								<tr>
									<td class="sol-mod__no-br___3hxdf"><div
											class="ml-mod__container___13ib5 production-mod__production___3Nifw suborder-mod__production___3WebF">
											<div class="ml-mod__media___3eEG4" style="width: 0;"></div>
											<div style="margin-left: 0;">
												<p>
													<span>地址：</span><span>辽宁省大连市甘井子区兴发路216号大连交通大学</span>
												</p>
											</div>
										</div></td>
									<td class="sol-mod__no-br___3hxdf"><div
											class="price-mod__price___109Qt">
											<p>明强</p>
											
										</div></td>
									<td class="sol-mod__no-br___3hxdf"><div></div></td>
									<td><div><span>13130000212</span></div></td>
									<td class="sol-mod__no-bt___3KjSb"></td>
									<td class="sol-mod__no-bt___3KjSb"></td>
									<td class="sol-mod__no-bt___3KjSb"><a href="#">删除</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					<div class="index-mod__order-container___1ur4- wancheng"  style="display: none">
					<div class="bought-wrapper-mod__trade-order___1imfF bought-wrapper-mod__closed___1z_cT">
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
											class="bought-wrapper-mod__create-time___2uGTe">2016-11-26 11:23:23</span></label><span><span>订单号</span><span>:
										</span><span>2353178186251648</span></span></td>
									<td colspan="2"
										class="bought-wrapper-mod__seller-container___CZux2"><span></span></td>
									<td><span id="webww1"></span></td>
									<td colspan="3"
										class="bought-wrapper-mod__thead-operations-container___3cYGt"></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td class="sol-mod__no-br___3hxdf">
											海鲜烧烤 等
										</td>
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
													<strong><span>￥</span><span>15.50</span></strong>
												</p>
											</div>
											<div style="font-family: verdana;">
												<div></div>
											</div>
										</div></td>
									<td class=""><div>
											<p style="margin-bottom: 3px;">
												<span class="text-mod__link___2QaZ1"><a class="btn btn-success btn-sm" href="#">已收货</a></span>
											</p>
											<div>
												<p style="margin-bottom: 3px;"></p>
												<p style="margin-bottom: 3px;"></p>
											</div>
										</div></td>
									<td class=""><div>
											<p style="margin-bottom: 3px;"><a class="btn btn-default btn-sm" >确认收货</a></p>
										</div></td>
								</tr>
								<tr>
									<td class="sol-mod__no-br___3hxdf"><div
											class="ml-mod__container___13ib5 production-mod__production___3Nifw suborder-mod__production___3WebF">
											<div class="ml-mod__media___3eEG4" style="width: 0;"></div>
											<div style="margin-left: 0;">
												<p>
													<span>地址：</span><span>辽宁省大连市甘井子区兴发路216号大连交通大学</span>
												</p>
											</div>
										</div></td>
									<td class="sol-mod__no-br___3hxdf"><div
											class="price-mod__price___109Qt">
											<p>明强</p>
											
										</div></td>
									<td class="sol-mod__no-br___3hxdf"><div></div></td>
									<td><div><span>13130000212</span></div></td>
									<td class="sol-mod__no-bt___3KjSb"></td>
									<td class="sol-mod__no-bt___3KjSb"></td>
									<td class="sol-mod__no-bt___3KjSb"><a href="#">删除</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
	</div>
</div>
			</div>
			<!-- Bootstrap core JavaScript
    ================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->
			<script src="dist/js/jquery-3.1.1.min.js"></script>
			<script src="dist/js/bootstrap.min.js"></script>
			<script src="assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
			<script>
				window.jQuery
						|| document
								.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')
			</script>
			<script src="dist/js/bootstrap.min.js"></script>
			<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
			<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
			<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
			<script src="dist/js/bootstrap.min.js"></script>
			<script src="assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
			<!-- END GLOBAL SCRIPTS -->
			<!-- PAGE LEVEL SCRIPTS -->
			<script src="assets/js/jquery.dataTables.js"></script>
			<script src="assets/js/dataTables.bootstrap.js"></script>
			<script>
			
			
			
			
			
				$(document).ready(function() {
					$('#fenye').dataTable({
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

