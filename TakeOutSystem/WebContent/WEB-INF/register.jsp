<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>注册</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dist/css/signin.css" rel="stylesheet">

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
		if (session.getAttribute("userid") != null) {
			response.sendRedirect("index.jsp");
		}		
	%>
<body>
	<div class="navbar-wrapper">
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
					<a class="navbar-brand" href="index.action">迅捷外卖订餐系统</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.action">首页</a></li>
						<li><a href="takeout.action">外卖</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<form class="form-signin" role="form" method="post" action="register.action">
			<h2 class="form-signin-heading">请注册</h2>
			<input name="username" type="email" class="form-control" placeholder="邮箱" required
				autofocus> 
                <input name="password" type="password" placeholder="密碼" class="form-control" required
				autofocus>
                <input name="password1" type="password" placeholder="重複密碼" class="form-control" required
				autofocus>
			${regerr}
			<button class="btn text-muted text-center btn-success btn-lg btn-block" type="submit">注册</button>
			<button class="btn text-muted text-center btn-danger btn-lg btn-block" type="reset">重置</button>
		</form><div class="text-center">
        <ul class="list-inline">
            <li><a class="text-muted" href="login.action" >登陆</a></li>
        </ul>
    </div>
		
	</div>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>
	<script src="assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
	<script src="assets/js/customize.min.js"></script>
</body>
</html>