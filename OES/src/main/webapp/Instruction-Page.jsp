<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>	
<%
DatabaseClass DAO = new DatabaseClass();
/* String id = (String) session.getAttribute("UserId");  */
%>
<%if(session.getAttribute("UserStatus")!=null){
	if(session.getAttribute("UserStatus").equals("1")){ 
		String id = (String) session.getAttribute("UserId");
 		User user1=DAO.getUserDetails(id);
%>
    <!-- --------------------------main body ---------------------------------------------->
    <div class="main-body">
        <div class="main-containt">
            <div class="small-containers">
                <div class="dash-board container-padding">
                    <div class="flex-div-center">
                        
                        <span>Notice</span>
                    </div>
                    <a href="">Today is
                        <span id="day">day</span>,
                        <span id="daynum">00</span>
                        <span id="month">month</span>
                        <span id="year">0000</span>
                        <span class="display-time"></span>
                    </a>
                </div>
                <hr>
            </div>
            <%
			if (request.getParameter("dnotiid")!=null) {
				String dnotiid = request.getParameter("dnotiid");
				DAO.delnotice(dnotiid);
			}   
			%>
<!-- ==========================================Profile Edit============================ -->
        	<jsp:include page="EditUserProfile.jsp" />
        	<div class="small-containers">
                <div class="student-cont container-padding ">
                    <div onclick="showen()">
                    	<i class="fa fa-add" aria-hidden="true"></i>
                        <span>Add New Notice</span>
                    </div>
                </div>
                <hr>
            </div>
            
            <div class="addexam3" id="enroll">
                <div class="addexam ">
                    <div>
                        <span class="stud-head-style flex-div-center">Enroll Exam</span>
                        <hr>
                        <br>
                    </div>
                    <div class="addstudent1 abcs">
                         <form action="Controller.jsp" method="post" class="signup">
                          	<input type="hidden" name="page" value="instrct">
                    		<input type="hidden" name="addedby" value="<%=id%>">
                            <table>
                                <tr>
                                    <td><label>Topic</label></td>
                                    <td>
                                        <input type="text" name="topic" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Description</label></td>
                                    <td>
                                        <textarea required placeholder="" class="text" name="description" required></textarea>
                                   
                                    </td>
                                </tr>
                                
                                <tr>
            
                                    <td colspan="2" style="text-align: center;">
                                       <br><hr> <input type="submit" value="Add ">
                                       <input onclick="closeen()" type="button" value="Cancel" style="background: #f44336;">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
<!-- ================================================================================ -->
			<div class="small-container  container-padding">
			<%
			List<Notice> Liste =DAO.getnotice(id);
			for(Notice no : Liste) {	 %>
               <div class="inst">
               		<h2>Topic : <%=no.getNoticetitle() %></h2>
               		<p>Description : <%=no.getDescription() %></p>
               		<a href="User-Page.jsp?pg=7&dnotiid=<%=no.getNoticeid()%>">Delete</a>
               </div>
            <%} %>
            </div> 
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