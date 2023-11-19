<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">

<head>
   <meta charset="utf-8">
   <title>User Login</title>
   <link rel="stylesheet" href="css/User-Login-Register.css">
   <link rel="stylesheet" href="css/nav.css">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" type="image/x-icon" href="img/logo2.png">
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    
</head>

<body>
   <nav class="main-nav flex-div">
      <div class="main-nav-left flex-div">
         <i class="fa fa-bars" aria-hidden="true" id="menu-icon"></i>
         <a href="index.jsp" class="nav-logo">Online Examination System</a>
      </div>
      <div class="main-nav-right flex-div" id="showprofilemenu">
         <a href="Student-Login.jsp?msg=1"><button class="stud-login-btn">Student Login</button></a>
      </div>
   </nav>
   <div class="new" >
      <div class="wrapper1">
         <img src="img/20824344_6343825.jpg" alt="User Login">
      </div>
      <div class="wrapper2">


         <div class="wrapper">
            <div class="title-text">
               <div class="title login">
                  User Login
               </div>
               <div class="title signup">
                  Sign up
               </div>
            </div>
            <div class="form-container">
               <div class="slide-controls">
                  <input type="radio" name="slide" id="login" checked>
                  <input type="radio" name="slide" id="signup">
                  <label for="login" class="slide login">Login</label>
                  <label for="signup" class="slide signup">Sign up</label>
                  <div class="slider-tab"></div>
               </div>
               <div class="form-inner">
                  <form action="Controller.jsp" method="post" class="login">
                     <input type="hidden" name="page" value="LoginUser">
                     <div class="field">
                        <input type="email" name="email" class="text" placeholder="Email" required>
                     </div>
                     <div class="field">
                        <input type="password" name="password" class="text" placeholder="Password" required>
                     </div>
                     <div class="pass-link">
                        <!-- <a href="#">Forgot password?</a> -->
                     </div>
                     <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" value="Login">
                     </div>
                     <div class="signup-link">
                        Not a member? <a>Signup now</a>
                     </div>
                     <%
                     if(request.getParameter("msg").equals("successfully")) { 
                   	%>
                   	<div class="signup-link-1">
                        successfully register
                     </div>
                   	<%
                     }
                    if(request.getParameter("msg").equals("unsuccessfully")) { 
                  	%>
                   	<div class="signup-link-1">
                        Something went wrong Retry
                     </div>
                   	<%
                     }
                     if(request.getParameter("msg").equals("unsuccessfully1")) { 
                   	%>
                   	<div class="signup-link-2">
                        Email or Password wrong
                     </div>
                   	<%
                     }
                     if(request.getParameter("msg").equals("no")) { 
                   	%>
                   	<div>
                     </div>
                   	<%
                     }
                     if(request.getParameter("msg").equals("OTPisincorrect")) { 
                     %>
                     
                      <div class="signup-link-2">
                      	OTP is incorrect
                     </div>
                    
                   	<%
                     }
                     if(request.getParameter("msg").equals("Already")) { 
                     %>
                     
                        <div class="signup-link-1">
                      		Already Registered
                     	</div>
                   
                   	<%
                     }
                     %>
                 
                  </form>
                  <form action="Controller.jsp" method="post" class="signup">
                     <input type="hidden" name="page" value="NewUser">
                     <div class="field">
                        <input type="text" name="username" class="text" placeholder="User Name" required>
                     </div>
                     <div class="field">
                        <input type="email" name="email" class="text" placeholder="Email" required>
                     </div>
                     <div class="field">
                        <input type="password" name="password" class="text" placeholder="Password" required 	>
                     </div>
                     <div class="field">
                   <!-- <input type="text" name="phone_no" class="text" placeholder="Contact No" required> -->
                        <input type="tel"  name="phone_no" class="text" placeholder="Contact No" required pattern="[0-9]{10}" >
                     </div>
                     
                     <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" value="Sign up">
                     </div>
                     <%
                     if(request.getParameter("msg").equals("successfully")) { 
                   	%>
                   	<div class="signup-link-1">
                        successfully register
                     </div>
                   	<%
                     }
                     if(request.getParameter("msg").equals("unsuccessfully")) { 
                   	%>
                   	<div class="signup-link-2">
                        Something went wrong Retry
                     </div>
                   	<%
                     }
                     if(request.getParameter("msg").equals("no")) { 
                   	%>
                   	<div>
                        
                     </div>
                   	<%
                     }
                     if(request.getParameter("msg").equals("OTPisincorrect")) { 
                     %>
                     <div class="signup-link-2">
                   	 	OTP is incorrect
                   	</div>
                   	<%
                     }
                     if(request.getParameter("msg").equals("Already")) { 
                     %>
                     <div class="signup-link-1">
                       	Already Registered
                     </div>
                   	<%
                     }
                     %>
                  </form>
               </div>
            </div>
         </div>
      </div>
   <%--     <%
   	if(request.getParameter("msg").equals("otpsend")) { 
   	%>
    	{{optn11}}	
    <%
    }
   	else{
   	%>
   		<div></div>
   	<%
   	}
    %> --%>
   </div>
   
   
   <script>
      const loginText = document.querySelector(".title-text .login");
      const loginForm = document.querySelector("form.login");
      const loginBtn = document.querySelector("label.login");
      const signupBtn = document.querySelector("label.signup");
      const signupLink = document.querySelector("form .signup-link a");
      signupBtn.onclick = (() => {
         loginForm.style.marginLeft = "-50%";
         loginText.style.marginLeft = "-50%";
      });
      loginBtn.onclick = (() => {
         loginForm.style.marginLeft = "0%";
         loginText.style.marginLeft = "0%";
      });
      signupLink.onclick = (() => {
         signupBtn.click();
         return false;
      });
   </script>
</body>

</html>