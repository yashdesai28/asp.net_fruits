<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="otp.aspx.cs" Inherits="_6semprojectfruits.otp" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="home-img/Apple-Logo-Modern-Icon.png">
  <link rel="stylesheet" href="otpstyle.css">
  <title>OTP</title>
</head>

<style>
  form {

    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;


  }

  .notic {

    width: 7rem;
    height: 2.3rem;
    background-color: #e0313156;
    border: 1px solid #e03131;
    margin-top: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    visibility: hidden;

  }

  .pronotic {
    visibility: visible;
  }

  .reotp {
    border: none;
    background-color: white;
    cursor: pointer;

  }



  .icon {
    width: 100%;
    height: 5.5rem;
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
    top: 50%;
    transform: translate(-50%, -50%)scale(1);




  }



  .errorimg {

    background-color: #e03131;
    border-top-left-radius: 13px;
    border-top-right-radius: 13px;
    width: 100%;
    height: 7.5rem;
    display: flex;
    justify-content: center;
    align-items: center;


  }

  .decerror {
    margin-bottom: 1rem;

  }

  .otpsub {
    margin-top: 1.5rem;
  }

  .maindec {
    margin-top: 1rem;
  }

  .open-blur {
    filter: blur(10px);
  }




  .popup1 {
    width: 360px;
    background-color: white;
    border-radius: 6px;

    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%)scale(1);
    display: flex;
    flex-direction: column;

    box-shadow: 2px 2px 40px rgb(0 0 0 / 19%);
    align-items: center;
    height: 23rem;
    visibility: hidden;
    transition: transform 0.4s, top 0.4s;


  }


  .open-popup {
    visibility: visible;
    top: 50%;
    transform: translate(-50%, -50%)scale(1);




  }
</style>

<body>



  <div class="container1" id="blur">




    <div class="popup" id="popup">

      <div class="flex1">
        <img src="./assets/img/mail-img/mail-removebg-preview.png" alt="">
        <h1>OTP Verification</h1>
        <div class="dec">
          <p>We've sent a Verification code to your <br> email-<asp:Label ID="sent" runat="server" Text=""></asp:Label> </p>
        </div>

        <div class="pat">

          <form id="form1" runat="server">

            

              <asp:TextBox ID="popotp" runat="server"  placeholder="Enter OTP" ></asp:TextBox>

         

              <asp:Button ID="otpsub" runat="server" Text="submit" OnClick="otpsub_Click" />


          
              <asp:Button ID="Button1" runat="server" class="reotp" Text="resend-otp" OnClick="Button1_Click" />

          </form>
        </div>




        <div class="contdown">

          <div class="btnGroup">
            <span class="Btn" id="verifiBtn">

            </span>
            <span class="timer">
              <span id="counter"></span>
            </span>
          </div>

        </div>

        <div class="notic" id="notic">
          <span id="msg"></span>
        </div>
      </div>


    </div>


  </div>


  <div class="popup1" id="popup1">

    <div class="errorimg">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    </div>

    <div class="maindec">
      <h1>warning!</h1>
    </div>

    <div class="decerror">
      <h3>please complete all fields require</h3>
    </div>


    <button type="submit" id="otpsub" onclick="closepopup()">close</a></button>
  </div>






  <div class="popup1" id="popup2">

    <div class="errorimg">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M14 10h4.764a2 2 0 011.789 2.894l-3.5 7A2 2 0 0115.263 21h-4.017c-.163 0-.326-.02-.485-.06L7 20m7-10V5a2 2 0 00-2-2h-.095c-.5 0-.905.405-.905.905 0 .714-.211 1.412-.608 2.006L7 11v9m7-10h-2M7 20H5a2 2 0 01-2-2v-6a2 2 0 012-2h2.5" />
      </svg>
    </div>

    <div class="maindec">
      <h1>Thank you</h1>
    </div>

    <div class="decerror">
      <h3>you have successfully registration</h3>
    </div>

    <form action="" method="POST">


      <button type="submit" id="otpsub" name="loginreg" onclick="closepopup()">close</button>

    </form>
  </div>


<!-- 

  <script>
    var x = "<?php echo "$allfil" ?>";

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
    var y = "<?php echo "$succsreg" ?>";

    console.log("uuuu", y);


    let popup1 = document.getElementById("popup2");

    let blurr1 = document.getElementById("blur");



    if (y == 1) {

      popup1.classList.add("open-popup");
      blurr1.classList.add("open-blur");



    }

    function closepopup1() {
      popup1.classList.remove("open-popup");
      blurr1.classList.remove("open-blur");

    }
  </script>



  <script>
    let x = "<?php echo "$inmsg" ?>";

    let promsg = document.getElementById("notic");

    console.log(x);

    if (x == 1) {

      console.log(x);

      promsg.classList.add("pronotic");

      document.getElementById("msg").innerHTML = "otp invalid";

    }
  </script>


 -->


  <script>
    function countdown() {
      var seconds = 59;

      function tick() {
        var counter = document.getElementById("counter");
        seconds--;
        counter.innerHTML =
          "0:" + (seconds < 10 ? "0" : "") + String(seconds);
        if (seconds > 0) {
          setTimeout(tick, 1000);
        } else {

          alert("faild");

          document.getElementById("counter").innerHTML = "time out";

        }
      }
      tick();
    }
    countdown();
  </script>





</body>

</html>
