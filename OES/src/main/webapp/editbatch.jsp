<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
String batchid = request.getParameter("batchid");
%>
<%Batch batch1=DAO.getbatchDetails(batchid); %>
<%if(session.getAttribute("UserStatus")!=null){
	if(session.getAttribute("UserStatus").equals("1")){ 
		String id = (String) session.getAttribute("UserId");
 		User user=DAO.getUserDetails(id);
%>
<div class="editbatch " id="editbatch">
	<div>
		<span class="stud-head-style flex-div-center">Edit Batch</span>
	</div>
	<div class="UserProfile1">
		<form action="Controller.jsp" method="post" class="signup">
			<input type="hidden" name="page" value="editbatch"> <input
				type="hidden" name="batchid" value="<%=batch1.getBatchid()%>">
			<hr>
			<div class="row flex-div-center">
				<div class="col-25">
					<label for="fname">Batch Name</label>
				</div>
				<div class="col-75 ">
					<input type="text" name="batchname"
						value="<%=batch1.getBatchname() %>" placeholder="Batch Name">
				</div>
			</div>
			<hr>
			<div class="row flex-div-center">
				<input type="submit" value="Update"> <input type="button"
					value="Close" onclick="editbatchclose()">
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