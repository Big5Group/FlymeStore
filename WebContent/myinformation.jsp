
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    

</head>

<body>
    <!--Top-->
    <nav id="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <select class="language">
                        <option value="English" selected>English</option>
                        <option value="France">France</option>
                        <option value="Germany">Germany</option>
                    </select>
                    <select class="currency">
                        <option value="USD" selected>USD</option>
                        <option value="EUR">EUR</option>
                        <option value="DDD">DDD</option>
                    </select>
                </div>
                <div class="col-xs-6">
                    <ul class="top-link">
                        <li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                        <li><a href="MyInformation.jsp"><span class="glyphicon glyphicon-envelope"></span> My Information</a></li>
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
                                    <li><a href="category.jsp">Nokia</a></li>
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
    <!--///////////////////Contact Page///////////////////-->
    <!--//////////////////////////////////////////////////-->
    <div id="page-content" class="single-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="MyInformation.jsp">My Information</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading"><h1>MY INFORMATION</h1></div>
                </div>
                <div class="col-md-6" style="margin-bottom: 30px;">
                    <form name="form1" id="ff" method="post" action="contact.php">
                        <div class="form-group">
                            Call name:<input type="text" class="form-control" value="${name}" readonly="readonly">
                        </div>
                        <div>
                            CustomPass:<input type="text" class="form-control" value="${pass}" readonly="readonly">
                        </div>
                        <div>
                            Email:<input type="text" class="form-control" value="${mail}" readonly="readonly">
                        </div>
                        <div>
                            CustomSex:<input type="text" class="form-control" value="${sex }" readonly="readonly">
                        </div>
                        <button type="submit" class="btn btn-3">修改</button>
                        <!--<div>-->
                            <!--<a clstag="homepage|keycount|home2013|infobtn" href="javascript:void(0)"  class="btn-5" onclick="updateUserInfo()" >提交</a>-->
                        <!--</div>-->
                        <!--<div class="form-group">-->
                            <!--<input type="text" class="form-control" placeholder="Your Name *" name="name" id="name" required data-validation-required-message="Please enter your name.">-->
                        <!--</div>-->
                        <!--<div class="form-group">-->
                            <!--<input type="email" class="form-control" placeholder="Your Email *" name="email" id="email" required data-validation-required-message="Please enter your email address.">-->
                        <!--</div>-->
                        <!--<div class="form-group">-->
                            <!--<input type="tel" class="form-control" placeholder="Your Phone *" name="phone" id="phone" required data-validation-required-message="Please enter your phone number.">-->
                        <!--</div>-->
                        <!--<div class="form-group">-->
                            <!--<textarea class="form-control" placeholder="Your Message *" name="message" id="message" required data-validation-required-message="Please enter a message."></textarea>-->
                        <!--</div>-->
                        <!--<button type="submit" class="btn btn-1">Send Message</button>-->
                    </form>
                </div>
                <!--<div class="col-md-6">-->
                    <!--<p><span class="glyphicon glyphicon-home"></span> California, United States 3000009</p>-->
                    <!--<p><span class="glyphicon glyphicon-earphone"></span> +6221 888 888 90 , +6221 888 88891</p>-->
                    <!--<p><span class="glyphicon glyphicon-envelope"></span> info@yourdomain.com</p>-->
                    <!--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.289259162295!2d-120.7989351!3d37.5246781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8091042b3386acd7%3A0x3b4a4cedc60363dd!2sMain+St%2C+Denair%2C+CA+95316%2C+Hoa+K%E1%BB%B3!5e0!3m2!1svi!2s!4v1434016649434" width="95%" height="230" frameborder="0" style="border:0"></iframe>-->
                <!--</div>-->
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
        </div>
    </footer>
</body>
</html>
