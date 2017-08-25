<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
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
    
    <!-- Ajax -->
    <script src="js/account.js"></script>

    
    <script>
    
        function refresh() {
            document.getElementById("authImg").src = "getAuthCodeServlet";
        }
    </script>
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
                        <li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                        <li><a href="myinformation.jsp"><span class="glyphicon glyphicon-envelope"></span> 个人信息</a></li>
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
                <div id="cart"><a class="btn btn-1" href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>CART : 0 ITEM</a></div>
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
                    <li><a href="index.jsp">Home</a></li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">PC Computers</a>
                        <div class="dropdown-menu">
                            <div class="dropdown-inner">
                                <ul class="list-unstyled">
                                    <li><a href="category.jsp">Window</a></li>
                                    <li><a href="category.jsp">MacBook</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Laptops &amp; Notebooks</a>
                        <div class="dropdown-menu">
                            <div class="dropdown-inner">
                                <ul class="list-unstyled">
                                    <li><a href="category.jsp">Dell</a></li>
                                    <li><a href="category.jsp">Asus</a></li>
                                    <li><a href="category.jsp">Samsung</a></li>
                                    <li><a href="category.jsp">Lenovo</a></li>
                                    <li><a href="category.jsp">Acer</a></li>
                                </ul>
                            </div> 
                        </div>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Mobiles &amp; Tablet</a>
                        <div class="dropdown-menu" style="margin-left: -203.625px;">
                            <div class="dropdown-inner">
                                <ul class="list-unstyled">
                                    <li><a href="category.jsp">Iphone</a></li>
                                    <li><a href="category.jsp">Samsung</a></li>
                                    <li><a href="ccategory.jsp">Nokia</a></li>
                                    <li><a href="category.jsp">Lenovo</a></li>
                                    <li><a href="category.jsp">Google</a></li>
                                </ul>
                                <ul class="list-unstyled">
                                    <li><a href="category.jsp">Nexus</a></li>
                                    <li><a href="category.jsp">Dell</a></li>
                                    <li><a href="category.jsp">Oppo</a></li>
                                    <li><a href="category.jsp">Blackberry</a></li>
                                    <li><a href="category.jsp">HTC</a></li>
                                </ul>
                                <ul class="list-unstyled">
                                    <li><a href="category.jsp">LG</a></li>
                                    <li><a href="category.jsp">Q-Mobiles</a></li>
                                    <li><a href="category.jsp">Sony</a></li>
                                    <li><a href="category.jsp">Wiko</a></li>
                                    <li><a href="category.jsp">T&T</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="category.jsp">Software</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--//////////////////////////////////////////////////-->
    <!--///////////////////Account Page///////////////////-->
    <!--//////////////////////////////////////////////////-->
    <div id="page-content" class="single-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="account.jsp">Account</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="heading"><h2>Login</h2></div>
                    <form name="form1" id="ff1" method="post" action="doLoginServlet">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username :" name="username" id="username" value="111111" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password :" name="password" id="password" value="111111" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="inputCode" placeholder="验证码 :" required>&nbsp;<img src="getAuthCodeServlet" id="authImg"/>&nbsp;<a href="#" onClick="refresh()">看不清</a>
                        </div>
                        <div class="form-group">
                            
                        </div>
                        <input type="button" value="ajax 登陆" onclick="checkUser()">
                        <button type="submit" class="btn btn-1" name="login" id="login">Login</button>
                        <a href="#">Forgot Your Password ?</a>
                    </form>
                </div>
                <div class="col-md-6">
                    <div class="heading"><h2>New User ? Create An Account.</h2></div>
                    <form name="form2" id="ff2" method="post" action="doRegisterServlet">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Name :" name="username" id="username" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email Address :" name="email" id="email" required>
                        </div>
                        <div class="form-group">
                            <input name="gender" id="gender" type="radio" value="1"> Male <input name="gender" id="gender" type="radio" value="0"> Female 
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password :" name="password" id="password" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Retype Password :" name="repassword" id="repassword" required>
                        </div>
                        <div class="form-group">
                            <input name="agree" id="agree" type="checkbox" > I agree to your website.
                        </div>
                        <button type="submit" class="btn btn-1">Create</button>
                    </form>
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
                        Copyright &copy; 2017.Company name All rights reserved.
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