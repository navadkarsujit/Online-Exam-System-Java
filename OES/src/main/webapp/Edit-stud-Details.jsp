<!-- Edit-stud-Details -->

<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
String estudid = request.getParameter("estudid");
Student std=DAO.getStudentDetails(estudid);
%>
<%if(session.getAttribute("UserStatus")!=null){
	if(session.getAttribute("UserStatus").equals("1")){ 
		String id = (String) session.getAttribute("UserId");
 		User user1=DAO.getUserDetails(id);
%>
			<div class="small-container flex-div-center" id="addstudent">
                <div class="addstudent ">
                    <div>
                        <span class="stud-head-style flex-div-center">Edit Student Details </span> 
                        <hr>
                        <br>
                    </div>
                    <div class="addstudent1">
                        <form action="Controller.jsp" method="post" class="signup">
                    		<input type="hidden" name="page" value="EditStudentDetail">
                    		<input type="hidden" name="studentid" value="<%=std.getStudentid()%>">
                            <table>
                                <tr>
                                    <td><label>Student Name</label></td>
                                    <td>
                                        <input type="text" placeholder="fname" value="<%=std.getFirstname() %>" class="text" name="fname"  required>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="mname" value="<%=std.getMiddlename() %>" class="text" name="mname"  required>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="lname" value="<%=std.getLastname() %>" class="text" name="lname"  required>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Student Email-Id</label></td>
                                    <td colspan="2">
                                    	<input type="email" name="emailid" value="<%=std.getStudentemailid()%>"  readonly class="text"  placeholder="Email-Id" required>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Address</label></td>
                                    <td colspan="2">
                                    	<input type="text" name="address" class="text" value="<%=std.getStudentaddress()%>" placeholder="1, xyz apartment ,city-pin" required>
                                    </td>
                                   <td></td>
                                </tr>
                                <tr>
                                    <td><label>Password</label></td>
                                    <td>
                                        <input type="password" name="password" value="<%=std.getStudentpassword() %>" class="text" placeholder="Password" required>
                                    </td>
                                    <td><label>Phone</label></td>
                                    <td>
                                    <input type="number" name="phoneno" class="text" readonly value="<%=std.getPhoneno() %>" placeholder="Phone No." required>
                                    </td>
                                </tr>

                                <tr>
                                    <td><label>Roll Number</label></td>
                                    <td>
                                        <input type="text" name="rollno" class="text" value="<%=std.getRollno()%>" placeholder="Roll No."   required>
                                    </td>
                                    <td><label>Added By</label></td>
                                    <td>
                                    	
                                    	<input type="hidden" name="addedby" class="text" placeholder="Added By" value="<%=std.getStudentaddedby() %>" readonly required>
                                    	<%User user=DAO.getUserDetails(std.getStudentaddedby()); %>
                                    	<input type="text" name="addedby1" class="text" placeholder="Added By" value="<%=user.getUsername() %>" readonly required>
                                    </td>
                                </tr>

                               
                                <tr>
                                    <td><label>Gender</label></td>
                                    <td>
                                    	<input type="radio" name="gender" class="text" value="Male" placeholder="Gender" required> Male &nbsp;&nbsp;
                                        <input type="radio" name="gender" class="text" value="Female" placeholder="Gender" required> Female
                                    </td>

                                    <td><label>Date Of Birth</label></td>
                                    <td>
                                    	<input type="date" name="dob" value="<%=std.getStudentdob()%>"  class="text" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Batch</label></td>
                                    <td>
                                        <select name="batch" class="batch-dropdown" id="batch">
                                        <%Batch batch1=DAO.getbatchDetails(std.getStudentbatch()); %>
                                            <option value="<%=std.getStudentbatch()%>"><%=batch1.getBatchname() %></option>
                                        </select>
                                    </td>
                                    <td><label>Status</label></td>
                                    <td>
                                     	<input type="hidden" value="<%=std.getStudentbatch()%>" name="sbatchid1" >
                                        <input type="text" value="<%=std.getStudentstatus() %>" name="status" class="text" readonly placeholder="Active">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;">
                                       <hr> <input type="submit" value="Edit">
                                       		&nbsp; &nbsp; &nbsp; &nbsp; 
                                       		<input type="submit" value="Close" onclick="addstudclose()">
                                    </td>
                                </tr>
                            </table>
                        </form>
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