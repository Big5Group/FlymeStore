<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.flyme.entity.*,java.util.HashMap, java.util.Map"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
</html><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>Mobile Shop</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="fonts/font-slider.css" type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="js/jquery-2.1.1.js"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="js/bootstrap.min.js"></script>
	
	<!-- 导入CheckSignIn判断是否已经登录 -->
    <script src="js/CheackSignIn.jsp"></script>
    
	<!-- 用户信息表格 CSS  -->
    <style type="text/css">
    	.account-div{
    		float:float;
    	}
    
    	table{
    		text-align:center;
    	}
    	
	    .account-table{  
			width:600px;  
			border-collapse:collapse;  
		 }  
		 .account-th{
		 	width:20px
		 	text-align=center;
		 }
		 .account-th-name,.account-th-phone,.account-th-address,.account-td{
			border:#000000 1px solid  
		 } 
		 
		 select{
		 	text-align:center;
		 }
		 
		 .account-submit{
		 	margin-top:10px;
		 	margin-left:20%;
		 }
		 
		 .account-th-name{
		 	width:120px;
		 }
		 
		 .account-th-phone{
		 	width:150px;
		 }
		 
	 </style>
	 
	 
	 
	 
</head>
<body>
	<%
		if(request.getSession().getAttribute("customer")==null){
			request.getRequestDispatcher("account.jsp").forward(request,response);
		}
	%>>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-6">
				</div>
				<div class="col-xs-6">
					<ul class="top-link">
						<%
							if(session.getAttribute("customer")!=null){
								out.print("<li class='dropdown'><a href='#' class='dropdown-toggle' data-toggle='dropdown'><span class='glyphicon glyphicon-user'></span>"+ ((Customer) request.getSession().getAttribute("customer")).getCallName() + 
							"</a><div class='dropdown-menu' style='center'><div class='dropdown-inner'><ul class='list-unstyled'><li><a href='QuitServlet'>&nbsp;&nbsp;quit</li></ul></div></div></li>");
							} else {
								out.print("<li><a href='account.jsp'><span class='glyphicon glyphicon-user'></span>My Account</a></li>");
							}
						%>
						<li><a href="contact.html"><span class="glyphicon glyphicon-envelope"></span> 个人信息</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-4">
				<div id="logo"><img src="images/logo.png" /></div>
			</div>
			<div class="col-md-4">
				<form class="form-search">  
					<input type="text" class="input-medium search-query">  
					<button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>  
				</form>
			</div>
			<div class="col-md-4">
				<div id="cart"><a class="btn btn-1" href="<%if(session.getAttribute("customer")!=null){out.print("cart.jsp");}else{out.print("account.jsp");} %>"><span class="glyphicon glyphicon-shopping-cart"></span>CART : <% if(session.getAttribute("cart")!=null){out.print(((HashMap)request.getSession().getAttribute("cart")).size());}else{out.print("0");} %>  ITEM</a></div>
			</div>
		</div>
	</header>
	<!--Navigation-->
    <nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header"><span id="heading" class="visible-xs">Categories</span>
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">首页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">手机型号</a>
						<div class="dropdown-menu" style="margin-left: -203.625px;">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">Meizu</a></li>
									<li><a href="#">Samsung(无货)</a></li>
									<li><a href="#">Nokia(无货)</a></li>
									<li><a href="#">Lenovo(无货)</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="#">Oppo(无货)</a></li>
									<li><a href="#">HTC(无货)</a></li>
									<li><a href="#">Iphone(无货)</a></li>
								</ul>
							</div>
						</div>
				</ul>
			</div>
		</div>
	</nav>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Cart Page//////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="cart.jsp">Cart</a></li>
					</ul>
				</div>
			</div>
			
			<%
				if(session.getAttribute("cart")!=null){
				Map<Integer,CartItem> map=(Map<Integer,CartItem>)session.getAttribute("cart");
			    double count=0;//显示出总价格
 			    for(Map.Entry<Integer,CartItem> entry : map.entrySet()){
		         //计算出每一样的书籍一共花了多少钱
            		double price=entry.getValue().getProduct().getProductPrice()*entry.getValue().getNum();    
			        //计算出一共花了多少钱
			        count=count+price;
			%>
			<div class="row">
				<div class="product well">
					<div class="col-md-3">
						<div class="image">
							<img src="<%="phoneimg/680x680/"+entry.getValue().getProduct().getProductID()+ entry.getValue().getProduct().getProductColor() +"@680x680.jpg" %>" />
						</div>
					</div>
					<div class="col-md-9">
						<div class="caption">
							<div class="name"><h3><a href="product.html"><%=entry.getValue().getProduct().getProductName() %></a></h3></div>
							<div class="info">	
								<ul>
									<li><%=entry.getValue().getProduct().getProductName()+" "+entry.getValue().getProduct().getProductColor() %></li>
									<li><%=entry.getValue().getProduct().getProductID() %></li>
								</ul>
							</div>
							<span><label>￥: </label> <%=entry.getValue().getProduct().getProductPrice() %></span>
							<hr> 
							<form action="UpdateCartServlet">
								<input type="hidden" name="pID" value=<%=entry.getValue().getProduct().getProductID() %>>
								<label>数量: </label> 
								<input class="form-inline quantity" name="pNum" type="text" value=<%=entry.getValue().getNum() %>>
								<input type="submit" value="Update">
							</form>
							
							<hr>
						
							<a href="RemoveCartItem?productID=<%=entry.getValue().getProduct().getProductID()%>" class="btn btn-default pull-right">REMOVE</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>
			<div class="account-div">
				<form class="account-form" action="#" method="post">
					<table class = "account-table">
						<tr class="account-tr" >
							<th class="account-th-name" >&#12288;&#12288;&#12288;名字</th>
							<th class="account-th-phone" >&#12288;&#12288;&#12288;&nbsp;&nbsp;&nbsp;手机</th>
							<th class="account-th-address" >&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;地址</th>						
						</tr>
						<tr class="account-tr" >
							<td class="account-td" ><% out.print(((ArrayList<Address>)request.getSession().getAttribute("CustomerAddress")).get(0).getCustomerName()); %></td>
							<td class="account-td" ><% out.print(((ArrayList<Address>)request.getSession().getAttribute("CustomerAddress")).get(0).getPhoneNum()); %></td>
							<td class="account-td" >
								<select>
									<%
										ArrayList<Address> list = ((ArrayList<Address>)request.getSession().getAttribute("CustomerAddress"));
										int size = ((ArrayList<Address>)request.getSession().getAttribute("CustomerAddress")).size();
										String str = "<option class ='address' value ='请选择地址' selected='selected' >请选择地址";
										for(int i=0;i<size;i++){
											str+="<option class = 'address' value ='" + list.get(i).getProvince() + list.get(i).getCity() + list.get(i).getCountry() + list.get(i).getDetailAddress() +"'>" + list.get(i).getProvince() + list.get(i).getCity() + list.get(i).getCustomerID() + list.get(i).getDetailAddress() + "</option>";
										}
										out.print(str);	
									%>
								</select>
							</td>
						</tr>
					</table>
					<input class="account-submit" id="submit" type="submit" value ="提交订单" >
				</form>
			</div>
		<%} %>
			<div class="row">
				<div class="col-md-4 col-md-offset-8 ">
					<center><a href="category.jsp" class="btn btn-1">Continue To Shopping</a></center>
				</div>
			</div>
			<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>Price Details</h6>
							<tr>
								<td>Total</td>
								<td><%=count %><%}%></td>
							</tr>
						</table>
						<center><a href="#" class="btn btn-1">Checkout</a></center>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<footer>
		<div class="container">
			<div class="wrap-footer">
				<div class="row">
					<div class="col-md-3 col-footer footer-1">
						<img src="images/logofooter.png" />
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
					</div>
					<div class="col-md-3 col-footer footer-2">
						<div class="heading"><h4>Customer Service</h4></div>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Delivery Information</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms & Conditions</a></li>
							<li><a href="#">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-3">
						<div class="heading"><h4>My Account</h4></div>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Brands</a></li>
							<li><a href="#">Gift Vouchers</a></li>
							<li><a href="#">Specials</a></li>
							<li><a href="#">Site Map</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-4">
						<div class="heading"><h4>Contact Us</h4></div>
						<ul>
							<li><span class="glyphicon glyphicon-home"></span>California, United States 3000009</li>
							<li><span class="glyphicon glyphicon-earphone"></span>+91 8866888111</li>
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
						Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
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
