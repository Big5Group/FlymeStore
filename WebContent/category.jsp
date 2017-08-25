<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.flyme.entity.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
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
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
						<li><a href="contact.jsp"><span class="glyphicon glyphicon-envelope"></span> 个人信息</a></li>
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
                <div id="cart"><a class="btn btn-1" href="
                    <%  if(session.getAttribute("customer")!=null) {
                    	   out.print("AddCartServlet");
                        } else {
                        	  out.print("account.jsp");
                        } %>">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        CART : 
                    <% if(session.getAttribute("cart")!=null) {
                    	out.print(((HashMap)request.getSession().getAttribute("cart")).size());
                        } else {
                        	out.print("0");
                        } 
                    %>  ITEM</a>
                </div>
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
					<!--<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">PC Computers</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.html">Window</a></li>
									<li><a href="category.html">MacBook</a></li>
								</ul>
							</div>
						</div>
					</li>-->
					<!--<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Laptops &amp; Notebooks</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.html">Dell</a></li>
									<li><a href="category.html">Asus</a></li>
									<li><a href="category.html">Samsung</a></li>
									<li><a href="category.html">Lenovo</a></li>
									<li><a href="category.html">Acer</a></li>
								</ul>
							</div> 
						</div>
					</li>-->
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
					</li>
<!--					<li><a href="category.html">Software</a></li>-->
				</ul>
			</div>
		</div>
	</nav>
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="category.html">Category : Mobile</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-8">
				<%
                    if(request.getSession().getAttribute("categoryProduct")==null){
                        response.sendRedirect("CategoryServlet?page=1");
                    }else{
                        ArrayList<Product> list =(ArrayList<Product>) request.getSession().getAttribute("categoryProduct"); 
                        int pagesize = (Integer)request.getSession().getAttribute("pagesize");
                        int num2 = (Integer)request.getSession().getAttribute("num2");
                        int nowpage = (Integer)request.getSession().getAttribute("nowpage");
                        String str = "";
                        for(int i=0;i<num2;i++){
                            if(i%3==0){str+="<div class='row'><div class='col-md-12'><div class='products'>";}      
                            str+="<div class='col-lg-4 col-md-4 col-xs-12'><div class='product'><div class='image'><a href='ProductDetailServlet?ProductID="+list.get(i).getProductID() + "'><img src='phoneimg/240x240/"+list.get(i).getProductID()+ list.get(i).getProductColor() +"@240x240.jpg' /></a></div><div class='buttons'><a class='btn cart' href='ProductDetailServlet?ProductID="+list.get(i).getProductID() + "'><span class='glyphicon glyphicon-shopping-cart'>查看详情</span></a></div><div class='caption'><div class='name'><h3><a href='ProductDetailServlet?ProductID="+list.get(i).getProductID() +"'>" + list.get(i).getProductName()+" " +list.get(i).getProductColor()+ "</a></h3></div><div class='price'>￥"+list.get(i).getProductPrice()+"<span>￥"+ (list.get(i).getProductPrice()+ 1000) +"</span></div><div class='rating'><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'></span></div></div></div></div>";
                            if((i+1)%3==0||i==(num2-1)){
                                str+="</div></div></div>";
                            }
                                    
                        }
                        str+="<div class='row text-center'><ul class='pagination'>";
                        for(int i=0;i<pagesize;i++){
                            if((i+1)!=nowpage){
                                str+="<li class=''><a href='CategoryServlet?page="+(i+1)+"'>"+(i+1)+"</a></li>";
                            }else{
                                str+="<li class='active'><a href='CategoryServlet?page="+(i+1)+"'>"+(i+1)+"</a></li>";
                            }
                            
                        }
                        str+="</ul></div>";
                        
                        
                        
                        out.print(str);
                    }           
                %>
				</div>
				<div id="sidebar" class="col-md-4">
					<div class="widget wid-categories">
						<div class="heading"><h4>CATEGORIES</h4></div>
						<div class="content">
							<ul>
								<li><a href="#">PC Computers</a></li>
								<li><a href="#">Laptops & Notebooks</a></li>
								<li><a href="#">Mobiles & Tablet</a></li>
								<li><a href="#">Software</a></li>
							</ul>
						</div>
					</div>
					<div class="widget wid-type">
						<div class="heading"><h4>TYPE</h4></div>
						<div class="content">
							<select>
								<option value="EL" selected>Electronics</option>
								<option value="MT">Mice and Trackballs</option>
								<option value="WC">Web Cameras</option>
								<option value="TA">Tablates</option>
								<option value="AP">Audio Parts</option>
							</select>
						</div>
					</div>
					<div class="widget wid-discouts">
						<div class="heading"><h4>DISCOUNTS</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="discount" checked="">Upto - 10% (20)</label>
							<label class="checkbox"><input type="checkbox" name="discount">40% - 50% (5)</label>
							<label class="checkbox"><input type="checkbox" name="discount">30% - 20% (7)</label>
							<label class="checkbox"><input type="checkbox" name="discount">10% - 5% (2)</label>
							<label class="checkbox"><input type="checkbox" name="discount">Other(50)</label>
						</div>
					</div>
					<div class="widget wid-brand">
						<div class="heading"><h4>BRAND</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="brand">Nokia</label>
							<label class="checkbox"><input type="checkbox" name="brand">Samsung</label>
							<label class="checkbox"><input type="checkbox" name="brand">Iphone</label>
							<label class="checkbox"><input type="checkbox" name="brand">HTC</label>
							<label class="checkbox"><input type="checkbox" name="brand">Oppo</label>
							<label class="checkbox"><input type="checkbox" name="brand">Kings</label>
							<label class="checkbox"><input type="checkbox" name="brand">Zumba</label>	
						</div>
					</div>
					<div class="widget wid-product">
						<div class="heading"><h4>LATEST</h4></div>
						<div class="content">
							<div class="product">
								<a href="#"><img src="images/galaxy-note.jpg" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="images/galaxy-s4.jpg" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="images/Z1.png" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
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
