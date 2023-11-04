﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="_6semprojectfruits.signup" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../home-img/Apple-Logo-Modern-Icon.png">
    
	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">

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

    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="signup.css">

  
    <title>Sign Up</title>
</head>

<style>
    .input1:focus {
        outline: none;
    }

    .icon {
        width: 100%;
        height: 7rem;
        color: white;
    }


    .popup1 {
        width: 360px;
        background-color: white;
        border-radius: 13px;
        border: none;

        position: absolute;
        top: 0%;
        left: 50%;
        transform: translate(-50%, -50%)scale(0.1);
        display: flex;
        flex-direction: column;

        box-shadow: 2px 2px 40px rgb(0 0 0 / 19%);
        align-items: center;
        height: 27rem;
        visibility: hidden;
        transition: transform 0.4s, top 0.4s;


    }

   .open-popup {

    visibility: visible;
    top: 100%;
    transform: translate(-50%, -50%)scale(1);
}




    .errorimg {

        background-color: #e03131;
        border-top-left-radius: 13px;
        border-top-right-radius: 13px;
        width: 100%;
        height: 8.5rem;
        display: flex;
        justify-content: center;
        align-items: center;


    }

    .decerror {
        margin-bottom: 3rem;

    }

    .otpsub {
        margin-top: 1.5rem;
    }

    .maindec {
        margin-top: 1rem;
        margin-bottom:3rem;
    }

    .input1 {
        height: 4.2rem;
        width: 16rem;
        border-radius: 5px;
        padding: 1rem;
        border: none;
        border-bottom: 2px solid black;
        margin-bottom: 2rem;
    }




    .input {

        border-bottom: 2px solid black;


    }
    .input1{
        font-size:1.4rem;
    }

    .succse {

        border-color: green;
    }

    .error {
        border-color: #e03131;
      
    }

    .notic{
        margin-bottom: 1rem;
        margin-top: -1rem;
        color: red;
        font-size: 1.3rem;
        
    }

   
    .m-b{
    margin-bottom:3.2rem ;
    border: none;
    background-color: #333;
    color: azure;
    transition: all 0.8ms;
    cursor: pointer;
}

    
</style>

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
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Organic Information</p>
						<h1>Sign up</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->



    <section class="main-login" id="blur">
        <div class="grid-containerf1">

            <div class="grid-2">
                <div class="grid-right signup-pad">

                    <form id="form1" runat="server">
                        <h2 class="reg-margin">Sign Up</h2>

                                        

                        <asp:HiddenField runat="server" ID="all" Value="" />

                         <asp:HiddenField runat="server" ID="vali" Value="" />

                            <asp:HiddenField runat="server" ID="emailuse" Value="" />
                     
        

                      

                        <div class="in-flexf">

                           
                            <asp:TextBox ID="fname" runat="server" class="input1" placeholder="First Name"   onkeyup="demo()" ></asp:TextBox>
                         

                            <asp:TextBox ID="lname" runat="server" class="input1" placeholder="Last Name"  onkeyup="lnamedemo()"></asp:TextBox>
                        </div>
                        <p class="notic" id="noticname"></p>

                        <div class="in-flex">

                          

                            <asp:TextBox ID="email" runat="server" TextMode="Email"  placeholder="email-abc@gmail.com" class="input"  onkeyup="emaildemo()"></asp:TextBox>


                        </div>
                        
                        <p class="notic" id="noticemail"></p>

                        


                        <div class="in-flex">

                           
                            <asp:TextBox ID="rpho" runat="server" TextMode="Number" placeholder="phone number" class="input" style=" height: 4.2rem;
                            width: 34.2rem;
                            border-radius: 5px;
                            padding: 1rem;
                            border: none;
                            border-bottom: 2px solid black; margin-bottom: -0.5rem;"  onkeyup="phnodemo()" ></asp:TextBox>

                        </div>
                        <p class="notic" id="noticnumber"></p>

                        <div class="in-flex">

                 

                            <asp:TextBox ID="pass1" runat="server" TextMode="Password" placeholder="password" class="input"  onkeyup="passdemo()"></asp:TextBox>



                        </div>
                        <p class="notic" id="noticpassword"></p>

                        <div class="in-flex">

                          
                            <asp:TextBox ID="pass2" runat="server"  TextMode="Password"  placeholder="confirm-password" class="input" onkeyup="passcondemo()"></asp:TextBox>


                        </div>
                        <p class="notic" id="connoticpassword"></p>

                        <div class="in-flex cheak">
                            <div class="cheak-flex">
               
                                <asp:CheckBox ID="CheckBox1" runat="server" class="cheakbox"/>
                                <p class="sub-text">I agree to The Terms and Condition.</p>
                            </div>


                        </div>



           

                        <asp:Button ID="Button1" runat="server" Text="Sign Up"  class="input m-b" style=" margin-bottom:3.2rem ;
    border: none;
    background-color: #333;
    color: azure;
    transition: all 0.8ms;
    cursor: pointer; border-radius: 5px;height: 5.1rem;" 
                            
                            OnClick="Button1_Click" CausesValidation="false" />

                    </form>
                    <div class="in-flex sign-up">
                        <p class="sub-text">Alredy have Account?</p> <a class="login-link" href="login.aspx">Log In</a>
                    </div>
                </div>
                <div class="grid-left sign-right">

                    <img src="./assets/img/loginimg/orange.jpg" class="log-img sign-img">

                </div>
            </div>
    </section>



    <div class="popup1" id="popup1">

        <div class="errorimg">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
        </div>

        <div class="maindec">
            <h2>warning!</h2>
        </div>

        <div class="decerror">
            <h3>please complete all fields require</h3>
           
        </div>


        <button type="submit" id="otpsub" onclick="closepopup()">close</a></button>
    </div>



    <div class="popup1" id="popup2">

        <div class="errorimg">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
        </div>

        <div class="maindec">
            <h2>warning!</h2>
        </div>

        <div class="decerror">
            <h3>please valid information</h3>
        </div>


        <button type="submit" id="otpsub" onclick="closepopup2()">close</a></button>
    </div>



    
    <div class="popup1" id="popup3">

        <div class="errorimg">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
        </div>

        <div class="maindec">
            <h2>warning!</h2>
        </div>

        <div class="decerror">
            <h3>Email is already use </h3>
        </div>


        <button type="submit" id="otpsub" onclick="closepopup3()">close</a></button>
    </div>






    
    
	<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-box about-widget">
						<h2 class="widget-title">About us</h2>
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
	



    
    





    <script>
        var x = document.getElementById("all").value;
        console.log(x);


        let popup = document.getElementById("popup1");

        let blurr = document.getElementById("blur");



        if (x == 1) {

            popup.classList.add("open-popup");
            blurr.classList.add("open-blur");



        }

        function closepopup() {
            popup.classList.remove("open-popup");
            blurr.classList.remove("open-blur");

        }
    </script>






    
    <script>
        var y = document.getElementById("vali").value;

        let popup1 = document.getElementById("popup2");

        let blurr1 = document.getElementById("blur");

        console.log("hbjiuhvg",y);



        if (y == 1) {

            popup1.classList.add("open-popup");
            blurr1.classList.add("open-blur");



        }

        function closepopup2() {
            popup1.classList.remove("open-popup");
            blurr1.classList.remove("open-blur");

        }
    </script>




    

    <script>
        var j = document.getElementById("emailuse").value;

        let popup3 = document.getElementById("popup3");

        let blurr3 = document.getElementById("blur");



        if (j == 1) {

            popup3.classList.add("open-popup");
            blurr3.classList.add("open-blur");



        }

        function closepopup3() {
            popup3.classList.remove("open-popup");
            blurr3.classList.remove("open-blur");

        }
    </script>



    <script>
        let fname = document.getElementById("fname");
        let lname = document.getElementById("lname");
        let email1 = document.getElementById("email");
        let phno = document.getElementById("rpho");
        let pass = document.getElementById("pass1");
        let passcon = document.getElementById("pass2");

       

        

        let mpass = 0;



        function demo() {

            let FirstName = document.getElementById("fname").value;
            var regEx = /^[A-Za-z]+$/;

            if (regEx.test(FirstName)) {
                fname.classList.remove("error");
                fname.classList.add("succse");
                document.getElementById("noticname").innerHTML = "";

            } else {
                fname.classList.remove("succse");
                fname.classList.add("error");
                document.getElementById("noticname").innerHTML = "Only Characters without whitespaces.";
                return false;
            }



        }


        function lnamedemo() {

            let LastName = document.getElementById("lname").value;
            var regEx = /^[A-Za-z]+$/;
            if (regEx.test(LastName)) {

                lname.classList.remove("error");
                lname.classList.add("succse");
                document.getElementById("noticname").innerHTML = "";

            } else {
                lname.classList.remove("succse");
                lname.classList.add("error");
                document.getElementById("noticname").innerHTML = "Only Characters without whitespaces.";
                return false;
            }



        }


        function emaildemo() {
            let email = document.getElementById("email").value;


            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (mailformat.test(email)) {
                email1.classList.remove("error");
                email1.classList.add("succse");
                document.getElementById("noticemail").innerHTML = "";


            } else {
                email1.classList.remove("succse");
                email1.classList.add("error");
                document.getElementById("noticemail").innerHTML = "Must be in valid format.";
            }



        }




        function phnodemo() {

            let phone = document.getElementById("rpho").value;
            var phoneno = /^\d{10}$/;

            if (phoneno.test(phone)) {
                phno.classList.remove("error");
                phno.classList.add("succse");
                document.getElementById("noticnumber").innerHTML = "";
            } else {
                phno.classList.remove("succse");
                phno.classList.add("error");
                document.getElementById("noticnumber").innerHTML = "Contact Number Must be numbers and could start with 6,7,8,9 only.";
            }



        }




        function passdemo() {


            // password between 7 to 15 characters which contain at least one numeric digit and a special character
            let pass1 = document.getElementById("pass1").value;
            console.log(pass1);

            mpass = pass1;

            var paswd = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-zA-Z!#$%&? "])[a-zA-Z0-9!#$%&?]{8,20}$/;
            if (paswd.test(pass1)) {

                pass.classList.remove("error");
                pass.classList.add("succse");
                document.getElementById("noticpassword").innerHTML = "";

            } else {
                pass.classList.remove("succse");
                pass.classList.add("error");
                document.getElementById("noticpassword").innerHTML = "password between 8 to 15 characters which contain at least one numeric digit and a special character";
            }



        }



        function passcondemo() {


            // password between 7 to 15 characters which contain at least one numeric digit and a special character
            let pass2 = document.getElementById("pass2").value;


            if (pass2 == mpass) {

                passcon.classList.remove("error");
                passcon.classList.add("succse");
                document.getElementById("connoticpassword").innerHTML = "";

            } else {
                passcon.classList.remove("succse");
                passcon.classList.add("error");
                document.getElementById("connoticpassword").innerHTML = "password between 7 to 15 characters which contain at least one numeric digit and a special character";
            }



        }

        
    </script>

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
