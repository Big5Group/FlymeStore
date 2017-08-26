<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<
<html>
<title>后台管理</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.5.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.5.2/themes/icon.css">
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom CSS -->

<!-- Custom Fonts -->
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="fonts/font-slider.css" type="text/css">

<!-- Core JavaScript Files -->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!--Header-->
	<header class="container">
	<div class="row">
		<div class="col-md-4">
			<div id="logo">
				<img src="images/logo.png" />
			</div>
		</div>
		<div class="col-md-8">
			<h1 class="text-left ">
				<strong>MobileShop商城后台登录</strong>
			</h1>
		</div>
	</div>
	</header>

	<form action="ManagerLoginServlet" method="post">
		<div class="mycenter">
			<div class="mysign">
				<div class="col-lg-11 text-center text-info">
					<h2>请登录</h2>
				</div>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="username"
						placeholder="请输入账户名" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10">
					<input type="password" class="form-control" name="password"
						placeholder="请输入密码" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10 mycheckbox checkbox"></div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10">
					<button type="submit" class="btn btn-success col-lg-12">登录</button>
				</div>
			</div>
		</div>
	</form>

</body>
</html>