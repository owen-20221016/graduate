<%@page import="cn.edu.djtu.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.edu.djtu.bean.UserViewBean"%>
<%@ page import="cn.edu.djtu.pojo.User"%>

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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
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
	if (session.getAttribute("userid") == null) {
		response.sendRedirect("index.action");
	} else if (session.getAttribute("iscmd").equals(0)) {
		response.sendRedirect("index.action");
	}/*  else if (request.getAttribute("backuserid") != null) {
		String url = "backuseredit.action?location=backuserpass&action=display&backuserid="
				+ request.getAttribute("backuserid");
		response.sendRedirect(url);
	} */
%>

<body>

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
					<li class="active"><a href="userlist.action">用户浏览</a></li>
					<li><a href="orders.action?mark=back">订单管理</a></li><li><a href="messagedisplay.action">消息编辑</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="table-responsive">
					<%
						User user = (User) request.getAttribute("backuserinfo");
						int id = user.getId();
					%>
					<div class="container">
						<div class="panel-body">
							<div class="row">
								<div>
									<div class="col-lg-7">
										<form role="form" method="post"
											action="backuseredit.action?backuserid=<%=id%>">
											<div class="form-group">
												<label>邮箱</label> <input readonly="readonly" class="form-control"
													value="<%=user.getUsername()%>">
											</div>
											<div class="form-group">
												<%
													if (user.getIscmd() == 1) {
												%>
												<label>管理员</label> <br> <label class="radio-inline">
													<input type="radio" name="iscmd" id="optionsRadiosInline1"
													value="1" checked="checked">是
												</label> <label class="radio-inline"> <input type="radio"
													name="iscmd" id="optionsRadiosInline2" value="0">否
												</label>
												<%
													} else {
												%>
												<label>管理员</label> <br> <label class="radio-inline">
													<input type="radio" name="iscmd" id="optionsRadiosInline1"
													value="1">是
												</label> <label class="radio-inline"> <input type="radio"
													name="iscmd" id="optionsRadiosInline2" value="0"
													checked="checked">否
												</label>
												<%
													}
												%>
											</div>
											<div class="form-group">
												<label>用户密码</label> <input name="password1" type="password"
													class="form-control" placeholder="" value=""> <label>重复密码</label>
												<input name="password2" type="password" class="form-control"
													placeholder="" value="">
											</div>
											<P>${backusermsg}</P>
											<button type="submit" class="btn btn-default">修改</button>
											<button type="reset" class="btn btn-default">還原</button>
										</form>
									</div>
								</div>
							</div>
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
		<script src="assets/js/jquery.dataTables2.js"></script>
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
