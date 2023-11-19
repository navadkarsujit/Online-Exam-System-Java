<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
%>
<%if(session.getAttribute("UserStatus")!=null){
	if(session.getAttribute("UserStatus").equals("1")){ 
		String id = (String) session.getAttribute("UserId");
 		User user=DAO.getUserDetails(id);
%>
<div class="UserProfile " id="EditProfile" >
	 <div>
	     <span class="stud-head-style flex-div-center">Edit Profile</span>
	 </div>
	 <div class="UserProfile1">
	 
	     <form action="Controller.jsp" method="post" class="signup">
	      <input type="hidden" name="page" value="EditUserDetail">
	         <hr>
	         
		<input type="hidden" name="id" value="<%=user.getId()%>">
	         <div class="row flex-div-center">
	             <div class="col-25">
	                 <label for="fname">Username</label>
	             </div>
	             <div class="col-75 ">
	                 <input type="text" value="<%=user.getUsername() %>"  id="fname" name="username" placeholder="Username..">
	             </div>
	         </div>
	         <div class="row flex-div-center">
	             <div class="col-25">
	                 <label for="lname">Email-Id</label>
	             </div>
	             <div class="col-75">
	                 <input type="email" value="<%=user.getEmail() %>" readonly id="lname" name="email" placeholder="Email-Id..">
	             </div>
	         </div>
	         <div class="row flex-div-center">
	             <div class="col-25">
	                 <label for="lname">Password</label>
	             </div>
	             <div class="col-75">
	                 <input type="password" value="<%=user.getPassword() %>" id="lname" name="password" placeholder="Password..">
	             </div>
	         </div>
	         <div class="row flex-div-center">
	             <div class="col-25">
	                 <label for="lname">Phone Number</label>
	             </div>
	             <div class="col-75">
	                 <input type="text" value="<%=user.getPhone_no() %>" readonly id="lname" name="phone_no" placeholder="Phone No..">
	             </div>
	         </div>
	          
	           <hr>        
	         <div class="row flex-div-center">
	             <input type="submit" value="Update">
	             <input type="button" value="Close" onclick="closeForm()">
	            </div>
	        </form>
	       
	    </div>
	</div>
	 <%
		}else{
			response.sendRedirect("index.jsp");
		}
	}else{
		response.sendRedirect("index.jsp");
	}
	
	%>