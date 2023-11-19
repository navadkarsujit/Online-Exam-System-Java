<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
String sid = (String) session.getAttribute("studId");
Student sd=DAO.getStudentDetails(sid);
%>
<%if(session.getAttribute("studStatus")!=null){
            	if(session.getAttribute("studStatus").equals("1")){ 
            		/* String sid = (String) session.getAttribute("studId");
                	Student sd=DAO.getStudentDetails(sid); */
             %>
<div class="main-body">
	<div class="main-containt">
		<div class="small-containers">
			<div class="dash-board container-padding">
				<div class="flex-div-center">
				 <span> Notice</span>
				</div>
				<a href="">Today is <span id="day">day</span>, <span id="daynum">00</span>
					<span id="month">month</span> <span id="year">0000</span> <span
					class="display-time"></span>
				</a>
			</div>
			<hr>
		</div>
		<div class="small-container  container-padding">
			<%
			List<Notice> Liste = DAO.getnotice(sd.getStudentaddedby());
			for (Notice no : Liste) {
			%>
			<div class="inst">
				<h2>
					Topic :
					<%=no.getNoticetitle()%></h2>
				<p>
					Description :
					<%=no.getDescription()%></p>
			</div>
			<%
			}
			%>
		</div>
	</div>
</div>

		<%		
    	}else 
    		response.sendRedirect("Student-Login.jsp?msg=1"); 
   	}else 
   		response.sendRedirect("Student-Login.jsp?msg=1"); 
    
    %>