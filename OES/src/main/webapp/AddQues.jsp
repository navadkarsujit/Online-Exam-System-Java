<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
/* String id = (String) session.getAttribute("UserId"); */
String exmid = request.getParameter("exmid");
Exam b = DAO.getexamDetails(exmid);
%>
<%if(session.getAttribute("UserStatus")!=null){
	if(session.getAttribute("UserStatus").equals("1")){ 
		String id = (String) session.getAttribute("UserId");
 		User user=DAO.getUserDetails(id);
%>
<div class="addques " id="addques">
	<div>
		<span class="stud-head-style flex-div-center">Add Question</span>
		<hr>
		<br>
	</div>
	<div class="addstudent1" ng-app="myApp" ng-controller="myCtrl">
		<form action="Controller.jsp" method="post" class="signup">
			<input type="hidden" value="addquestion" name="page"> <input
				type="hidden" value="<%=exmid%>" name="qexamid"> <input
				type="hidden" value="<%=id%>" name="addedby">
			<table>
				<tr>
					<td><label>Exam Title</label></td>
					<td><input type="text"
						value="<%=b.getExamtitle()%> <%-- <%=b.getExamid()%> --%>"
						placeholder="Exam Title" readonly required></td>
				</tr>
				<tr>
					<td><label>Question</label></td>
					<td><input type="text" placeholder="Question" class="text"
						name="ques" required></td>
				</tr>
				<tr>
					<td><label>Description</label></td>
					<td><input type="text" placeholder="Description" class="text"
						name="qdesc"></td>
				</tr>
				<tr>
					<td><label>Option 1</label></td>
					<td><input type="text" placeholder="Option 1" class="text"
						name="optn1" ng-model="optn11" required></td>
				</tr>
				<tr>
					<td><label>Option 2</label></td>
					<td><input type="text" placeholder="Option 2" class="text"
						name="optn2" ng-model="optn12" required></td>
				</tr>
				<tr>
					<td><label>Option 3</label></td>
					<td><input type="text" placeholder="Option 3" class="text"
						name="optn3" ng-model="optn13" required></td>
				</tr>
				<tr>
					<td><label>Option 4</label></td>
					<td><input type="text" placeholder="Option 4" class="text"
						name="optn4" ng-model="optn14" required></td>
				</tr>

				<tr>
					<td><label>Answer</label></td>
					<td><select name="ans" class="exam-dropdown" id="batch">
							<option value={{optn11}}>{{optn11}}</option>
							<option value={{optn12}}>{{optn12}}</option>
							<option value={{optn13}}>{{optn13}}</option>
							<option value={{optn14}}>{{optn14}}</option>

					</select></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><br>
					<hr> <input type="submit" value="Add"> <input
						onclick="addquesclose()" type="button" value="Cancel"
						style="background: #f44336;"></td>
				</tr>
			</table>
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