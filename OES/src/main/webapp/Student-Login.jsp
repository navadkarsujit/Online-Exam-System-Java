<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">

<head>
   <meta charset="utf-8">
   <title>Student Login</title>
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
      <div class="main-nav-right flex-div" id="showprofilemenu">
       <a href="User-Login.jsp?msg=no"><button class="stud-login-btn">User Login</button></a><br>
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
                  Student Login
               </div>
            </div>
            <div class="form-container">
               <div class="form-inner">
                  <form action="Controller.jsp" method="post" class="login">
                     <input type="hidden" name="page" value="LoginStudent">
                     <div class="field">
                        <input type="email" name="email" class="text" placeholder="Email" required>
                     </div>
                     <div class="field">
                        <input type="password" name="password" class="text" placeholder="Password" required>
                     </div>
                     <!-- <div class="pass-link">
                        <a href="#">Forgot password?</a>
                     </div> -->
                     <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" value="Login">
                     </div>
                      
                   	<%
                     
                     if(request.getParameter("msg").equals("unsuccessfully1")) { 
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
                     %>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>

</html>