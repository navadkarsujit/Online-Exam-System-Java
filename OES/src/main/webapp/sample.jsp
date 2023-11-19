<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
/* String id = (String) session.getAttribute("UserId"); */
String email = request.getParameter("email");
String otp = request.getParameter("otp");
String phone= request.getParameter("phone");
String username = request.getParameter("username");
String password= request.getParameter("password");
%>



<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">

<head>

   <meta charset="utf-8">
   <title>User Login</title>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo2.png">
   <link rel="stylesheet" href="css/User-Login-Register.css">
   <link rel="stylesheet" href="css/nav.css">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" type="image/x-icon" href="img/logo2.png">
</head>

<body>
   <nav class="main-nav flex-div">
      <div class="main-nav-left flex-div">
         <i class="fa fa-bars" aria-hidden="true" id="menu-icon"></i>
         <a href="index.jsp" class="nav-logo">Online Examination System</a>
      </div>
      
   </nav>
   <div class="new">
      <div class="wrapper1">
         <img src="img/4957136_4957136.jpg" alt="User Login">
      </div>
      <div class="wrapper2">
         <div class="wrapper" style="width: 100%;">
            <div class="title-text">
               <div class="title login">
               <h5>  Please Enter OTP</h5>
               
               </div>
            </div>
            <p>We have sent you one time password to your email</p>
            <div class="form-container">
               <div class="form-inner">
                  <form action="Controller.jsp" method="post" class="login">
                     <input type="hidden" name="page" value="New1User">
                     <input type="hidden" name="username" value="<%=username %>">
                     <input type="hidden" name="email" value="<%=email %>">
                     <input type="hidden" name="phone_no" value="<%=phone %>">
                     <input type="hidden" name="password" value="<%=password %>">
                     <input type="hidden" name="otp" value="<%=otp %>">
                     <div class="field">
                        <input type="text" name="votp" class="text" placeholder="OTP" required>
                     </div>
                     
                     <!-- <div class="pass-link">
                        <a href="#">Forgot password?</a>
                     </div> -->
                     <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" value="Verify">
                     </div>
                      
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>

</html>