﻿<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="_6semprojectfruits.WebForm3" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Shop</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="assets/css/responsive.css">
	<link rel="stylesheet" href="admin.css">

	



	<style>
       
		

		.hide {
            display: none;
        }

        .show {
            display: block;
            animation: show .5s ease;
        }

		.frute{
			height: 0%;
		}

		.disabled,
        .disabled{
	border-color: gray;
	color:gray;
	pointer-events: none;
}
		</style>

</head>
	
	<body>


    
	<!-- header -->
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo">
							<a href="index.html">
								<img src="assets/img/logo.png" alt="">
							</a>
						</div>
						<!-- logo -->

						<!-- menu start -->
						<nav class="main-menu">
							<ul>
								<li class="current-list-item"><a href="#">Home</a>
									<ul class="sub-menu">
										
										<li><a href="index_2.html">Slider Home</a></li>
									</ul>
								</li>
								<li><a href="about.html">About</a></li>
								<li><a href="cart.html">Cart</a></li>
									
								
								<li><a href="news.html">News</a>
									<ul class="sub-menu">
										<li><a href="news.html">News</a></li>
										<li><a href="single-news.html">Single News</a></li>
									</ul>
								</li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="shop.html">Shop</a>
									<ul class="sub-menu">
										<li><a href="shop.html">Shop</a></li>
										<li><a href="checkout.html">Check Out</a></li>
										<li><a href="single-product.html">Single Product</a></li>
										<li><a href="cart.html">Cart</a></li>
									</ul>
								</li>
								<li>
									<div class="header-icons">
										<a class="shopping-cart" href="whishlist.html"><i class="fa fa-heart"></i></a>
										<a class="shopping-cart" href="whishlist.html"><i class="fa fa-user"></i></a>
										<a class="shopping-cart" href="cart.html"><i class="fas fa-shopping-cart"></i></a>
										<a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
									</div>
								</li>
							</ul>
						</nav>
						<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->

    <!-- breadcrumb-section -->
<div class="breadcrumb-section breadcrumb-bg" style="padding: 6rem;">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						
						<h1>PROFILE</h1>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- end breadcrumb section -->




	<form id="p1" runat="server">

    <section class="utsav"style="margin: 8rem auto;"  >
        <div class="main">
            <div class="left">
               
                    <div class="btn">
                        <img src="" class="img">
                    <asp:FileUpload ID="FileUpload1" runat="server" class="inputf"/>
                   <asp:Button ID="Button1" runat="server" Text="UPLOAD" class="btnin" style="margin-top: 1.4rem;" />
                </div>
              
            </div>
            <div class="right">
               
                    <div class="f">
                        <label>full name</label>
							<asp:TextBox ID="fullname" class="in" runat="server"></asp:TextBox>
                    </div>
                    <div class="f">
                        <label>email</label>
                       <asp:TextBox class="in" TextMode="Email" ID="email" runat="server" placeholder="abc@gmail.com"></asp:TextBox>
                    </div>
                    <div class="f">
                        <label>phone</label>
                        <asp:TextBox TextMode="Number" ID="number" runat="server" class="in"  placeholder="+91" MaxLength="9999999" style="width: 16rem;" ></asp:TextBox>
                    </div>
                    <div class="f">
                        <label>gender</label>
                        <div class="inn">
							
                            <asp:RadioButton ID="male" Text="male" runat="server" GroupName="gender" />
                            
							<asp:RadioButton ID="female" Text="female"  runat="server" GroupName="gender" />
							
                            
                        </div>
                        
                    </div>

                    <div class="f">
                        <label>pincode</label>
                        <div class="inner">
                           <asp:TextBox TextMode="Number" class="in" ID="TextBox1" runat="server" placeholder="395004"  style="width: 16rem;"></asp:TextBox>
                            <asp:Button ID="Button2"  runat="server" Text="Get Details"  class="in"/>
                        </div>
                    </div>

                    <div class="m1">
                       <div class="fle">
                        <label class="mar">city</label>
                        <asp:TextBox ID="city"  class="in" runat="server" placeholder="surat"></asp:TextBox>
                       </div>

                       <div class="fle">
                        <label class="mar">state</label>
                        <asp:TextBox ID="state" runat="server" class="in" placeholder="gujrat"></asp:TextBox>
                       </div>

                       <div class="fle">
                        <label class="mar">country</label>
                        <asp:TextBox ID="country" runat="server" class="in" placeholder="india"></asp:TextBox>
                       </div>
                    </div>

                    <div class="fle">
                        <label class="mar">Addre
                       <asp:TextBox ID="TextBox2" TextMode="MultiLine"  runat="server" class="texta" style="width: 55.2rem;" ></asp:TextBox>
                    </div>
					<asp:Button ID="Button3" runat="server" Text="submit" OnClick="Button3_Click" />
            
            </div>
			
        </div>
    </section>


		</form>
	

    
	<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-box about-widget">
						<h2 class="widget-title">About us">About us</h2>
						<p>Ut enim ad minim veniam perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box get-in-touch">
						<h2 class="widget-title">Get in Touch</h2>
						<ul>
							<li>34/8, East Hukupara, Gifirtok, Sadan.</li>
							<li>support@fruitkha.com</li>
							<li>+00 111 222 3333</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box pages">
						<h2 class="widget-title">Pages</h2>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="services.html">Shop</a></li>
							<li><a href="news.html">News</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box subscribe">
						<h2 class="widget-title">Subscribe</h2>
						<p>Subscribe to our mailing list to get the latest updates.</p>
						<form action="index.html">
							<input type="email" placeholder="Email">
							<button type="submit"><i class="fas fa-paper-plane"></i></button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end footer -->
	
	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<div class="row">
				
				<div class="col-lg-6 text-right col-md-12">
					<div class="social-icons">
						<ul>
							<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end copyright -->




    <!-- jquery -->
	<script src="assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>





</body>
</html>
</asp:Content>
