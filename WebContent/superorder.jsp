<%@page import="com.flyme.dao.SuperOrderDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*" import="com.flyme.entity.SuperOrder"%>

</html>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">

<title>SUPER ORDER</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">


<!-- Custom Fonts -->
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="fonts/font-slider.css" type="text/css">

<!-- jQuery and Modernizr-->
<script src="js/jquery-2.1.1.js"></script>

<!-- Core JavaScript Files -->
<script src="js/bootstrap.min.js"></script>


</head>
<body>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-6">
					<select class="language">
						<option value="English" selected>English</option>
						<!--<option value="France">France</option>-->
						<!--<option value="Germany">Germany</option>-->
					</select> <select class="currency">
						<option value="USD" selected>USD</option>
						<!--<option value="EUR">EUR</option>-->
						<!--<option value="DDD">DDD</option>-->
					</select>
				</div>
				<div class="col-xs-6">
					<ul class="top-link">
						<li><a href="myinformation.jsp"><span
								class="glyphicon glyphicon-envelope"></span> 个人信息</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-4">
				<div id="logo">
					<img src="images/logo.png" />
				</div>
			</div>
			<div class="col-md-4">
				<form class="form-search">
					<input type="text" class="input-medium search-query">
					<button type="submit" class="btn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
			</div>
			<div class="col-md-4">
				<div id="cart">
					<a class="btn btn-1" href="cart.jsp"><span
						class="glyphicon glyphicon-shopping-cart"></span>CART : 0 ITEM</a>
				</div>
			</div>
		</div>
	</header>



	<table border="1" width=900px>
		<%
			List<SuperOrder> userList = new SuperOrderDao().getAllSuperOrder();
			if (userList != null) {
				for (SuperOrder list : userList) {
		%>
		<tr>
			<td>用户昵称</td>
			<%
				String a1 = list.getCallName();
			%>
			<td><%=a1%></td>
			<td>订单id</td>
			<td><%=list.getOrderID()%></td>
			<td>产品名称</td>
			<td><%=list.getProductName()%></td>
			<td>购买数量</td>
			<td><%=list.getProductNum()%></td>
		</tr>

		<tr>
			<td>地址id</td>
			<td><%=list.getAddressID()%></td>
			<td>产品价格</td>
			<td><%=list.getProductPrice()%></td>
			<td>总价</td>
			<td><%=list.getTotalPrice()%></td>
			<td>用户id</td>
			<td><%=list.getCustomerID()%></td>
		</tr>
		<tr>
			<td>省地址</td>
			<td><%=list.getProvince()%></td>
			<td>城市地址</td>
			<td><%=list.getCity()%></td>
			<td>街道地址</td>
			<td><%=list.getCountry()%></td>
			<td>详细地址</td>
			<td><%=list.getDetailAddress()%></td>
		</tr>
		<tr>
			<td>收货人</td>
			<td><%=list.getCustomerName()%></td>
			<td>电话号码</td>
			<td><%=list.getPhoneNum()%></td>
			<td>发票号码</td>
			<td><%=list.getPostCode()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>


	<footer>
		<div class="container">
			<div class="wrap-footer">
				<div class="row">
					<div class="col-md-3 col-footer footer-1">
						<img src="images/logofooter.png" />
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Lorem Ipsum is simply dummy text of the
							printing and typesetting industry.</p>
					</div>
					<div class="col-md-3 col-footer footer-2">
						<div class="heading">
							<h4>Customer Service</h4>
						</div>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Delivery Information</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms & Conditions</a></li>
							<li><a href="#">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-3">
						<div class="heading">
							<h4>My Account</h4>
						</div>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Brands</a></li>
							<li><a href="#">Gift Vouchers</a></li>
							<li><a href="#">Specials</a></li>
							<li><a href="#">Site Map</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-4">
						<div class="heading">
							<h4>Contact Us</h4>
						</div>
						<ul>
							<li><span class="glyphicon glyphicon-home"></span>California,
								United States 3000009</li>
							<li><span class="glyphicon glyphicon-earphone"></span>+91
								8866888111</li>
							<li><span class="glyphicon glyphicon-envelope"></span>infor@yoursite.com</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						Copyright &copy; 2015.Company name All rights reserved.<a
							target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
					</div>
					<div class="col-md-6">
						<div class="pull-right">
							<ul>
								<li><img src="images/visa-curved-32px.png" /></li>
								<li><img src="images/paypal-curved-32px.png" /></li>
								<li><img src="images/discover-curved-32px.png" /></li>
								<li><img src="images/maestro-curved-32px.png" /></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>


