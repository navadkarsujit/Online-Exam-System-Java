<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
/* String id = (String) session.getAttribute("UserId"); */
String ebatch = request.getParameter("ebatch");
String ebatchid = request.getParameter("ebatchid");
String addstud = request.getParameter("addstud");
String addstudbatchid = request.getParameter("addstudbatchid");
String sbatchid = request.getParameter("sbatchid");
String sbatch = request.getParameter("sbatch");
String estud = request.getParameter("estud");
String estudid = request.getParameter("estudid");
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
                        
                        <span>Manage Student</span>
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
<!-- ==========================================Profile Edit============================ -->
        	<jsp:include page="EditUserProfile.jsp" /> 
<!-- ===========================================Add Batch============================================ -->
			<div class="Addbatch " id="Addbatch" >
                <div>
                    <span class="stud-head-style flex-div-center">Create New Batch</span>
                </div>
                <div class="UserProfile1">
                    <form action="Controller.jsp" method="post" class="signup">
                    <input type="hidden" name="page" value="createbatch">
                    <input type="hidden" name="addedby" value="<%=id%>">
                        <hr>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="fname">Batch Name</label>
                            </div>
                            <div class="col-75 ">
                                <input type="text" name="batchname" placeholder="Batch Name">
                            </div>
                        </div>
                        <hr>        
                        <div class="row flex-div-center">
                            <input type="submit" value="Add">
                            <input type="button" value="Close" onclick="closeaddbatch()">
                        </div>
                    </form>
                </div>
            </div>       	
<!-- ===================================================================================== -->
        	 <div class="small-containers">
                <div class="student-cont container-padding ">
                    <div onclick="showbatch()">
                    	<i class="fa fa-eye" aria-hidden="true"></i>
                        <span>Show Batch</span>
                    </div>
                    <div  onclick="openaddbatch()">
                        <i class="fa fa-add" aria-hidden="true"></i>
                        <span>Create New Batch</span>
                    </div>
                </div>
                <hr>
            </div>
<!--  /*=============================Delete Student and batch========================================  */ -->
			<%
			if (request.getParameter("dbatchid")!=null) {
				String dbatchid = request.getParameter("dbatchid");
				DAO.deletebatch(dbatchid);	
				DAO.deleteallStudent(dbatchid);	
				
			} /*=============================Delete Student========================================  */
			if (request.getParameter("dstudeid")!=null) {
				String dstudeid = request.getParameter("dstudeid");
				DAO.deleteStudent(dstudeid);	
			}   
			%>
<!-- ================================================================================ -->
            <div class="small-containers batchlist" id="batchlist">
                <div class="student-containt container-padding ">
                    <div>
                    	<i class="fa fa-list" aria-hidden="true"></i>
                        <span>Batch </span>
                    </div>
                    <div onclick="closebatch()">
                    	<i class="fa fa-close" aria-hidden="true"></i>
                    </div>
                </div>
                <hr>
                <div class="student-containt-list container-padding">
                    <table>
                        <tr>
                        	<th>Sr. No.</th>
                        	<!-- <th>Batch Id</th> -->
                            <th>Batch Name</th>
                            <th>Created Date</th>
                            <th>Add Student</th>
                            <th>Edit Details</th>  
                            <th>Delete Batch</th>
                        </tr>
                        <%
                        int i=0;
						List<Batch> Listbatch = DAO.getAllBatch(id);
						for(Batch batch : Listbatch) {
						%>
                        <tr>
                        	<td><%=i+1 %></td>
                        	<%-- <td><%=batch.getBatchid() %></td>  class="bthname"--%>
                            <td ><%=batch.getBatchname() %></td>
                            <td><%=batch.getAddeddate() %></td>
                           	<td> 
                           	<!-- =========Add Student in batch================= -->
                           		<a  href="User-Page.jsp?pg=2&addstud=1&addstudbatchid=<%=batch.getBatchid()%>">
                            		<span style="font-weight:800;" class="material-symbols-outlined">add </span>
                                </a>
                            </td>
                            <td>
                            <!-- =========edit batch================= -->
                            	<a href="User-Page.jsp?pg=2&ebatch=1&ebatchid=<%=batch.getBatchid()%>">
                            		<span class="material-symbols-outlined">edit </span>
                                </a>
                            </td>
                            <td>
	                            <a href="User-Page.jsp?pg=2&dbatchid=<%=batch.getBatchid()%>">
	                                <span style="color: red;" class="material-symbols-outlined">delete_forever</span>
                                </a>
                            </td>
                        </tr> 
                        <%i++;%>
                        <%} %>   
                        <tr>
                        	<td colspan="7">------------------------</td>
                        </tr>                    
                    </table> 
                </div>
                <hr>
            </div> 
<!-- ===========================================Edit Batch============================================ -->
		<%if(request.getParameter("ebatch")!=null){ %>
			<div class="editbatch " id="editbatch">
				<div>
					<span class="stud-head-style flex-div-center">Edit Batch</span>
				</div>
				<div class="UserProfile1">
					<form action="Controller.jsp" method="post" class="signup">
						<input type="hidden" name="page" value="editbatch"> 
						<hr>
						<div class="row flex-div-center">
							<div class="col-25">
								<label for="fname">Batch Name</label>
							</div>
							<div class="col-75 ">
								<%Batch batch1=DAO.getbatchDetails(ebatchid); %>
								<input type="hidden" name="batchid" value="<%=batch1.getBatchid()%>">
								<input type="text" name="batchname" value="<%=batch1.getBatchname() %>" id="bname" placeholder="Batch Name">
							</div>
						</div>
						<hr>
						<div class="row flex-div-center">
							<input type="submit" value="Update"> 
							<input type="button" value="Close" onclick="editbatchclose()">
						</div>
					</form>
				</div>
			</div>
		<%} %>
<!--====================================================Add New Student==================================================================  -->
		<%if(request.getParameter("addstud")!=null&&request.getParameter("addstudbatchid")!=null ){ 
			Batch batch1=DAO.getbatchDetails(addstudbatchid);
		%>
		 <div class="small-container flex-div-center" id="addstudent">
                <div class="addstudent ">
                    <div>
                        <span class="stud-head-style flex-div-center">Add New Student </span> 
                        <hr>
                        <br>
                    </div>
                    <div class="addstudent1">
                        <form action="Controller.jsp" method="post" class="signup">
                    		<input type="hidden" name="page" value="addStudent">
                            <table>
                                <tr>
                                    <td><label>Student Name</label></td>
                                    <td>
                                        <input type="text" placeholder="fname" class="text" name="fname"  required>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="mname" class="text" name="mname"  required>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="lname" class="text" name="lname"  required>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Student Email-Id</label></td>
                                    <td colspan="2">
                                    	<input type="email" name="emailid" class="text"  placeholder="Email-Id" required>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Address</label></td>
                                    <td colspan="2">
                                    	<input type="text" name="address" class="text" placeholder="1, xyz apartment ,city-pin" required>
                                    </td>
                                   <td></td>
                                </tr>
                                <tr>
                                    <td><label>Password</label></td>
                                    <td>
                                        <input type="password" name="password" class="text" placeholder="Password" required>
                                    </td>
                                    <td><label>Phone</label></td>
                                    <td>
                                  <!--   <input type="number" name="phoneno" class="text" placeholder="Phone No." required> -->
                                    <input type="tel" 	 name="phoneno" class="text" placeholder="Phone No." pattern="[0-9]{10}"  required id="phone">
                                    </td>
                                </tr>

                                <tr>
                                    <td><label>Roll Number</label></td>
                                    <td>
                                        <input type="number" name="rollno" class="text" placeholder="Roll No."  required>
                                    </td>
                                    <td><label>Added By</label></td>
                                    <td>
                                    	<%User user=DAO.getUserDetails(batch1.getAddedby()); %>
                                    	<input type="hidden" name="addedby" class="text" placeholder="Added By" value="<%=user.getId() %>" readonly required>
                                    	<input type="text" name="addedby1" class="text" placeholder="Added By" value="<%=user.getUsername() %>" readonly required>
                                    </td>
                                </tr>

                               
                                <tr>
                                    <td><label>Gender</label></td>
                                    <td>
                                    	<input type="radio" name="gender" class="text" value="Male" checked placeholder="Gender" required> Male &nbsp;&nbsp;
                                        <input type="radio" name="gender" class="text" value="Female" placeholder="Gender" required> Female
                                    </td>

                                    <td><label>Date Of Birth</label></td>
                                    <td>
                                    	<input type="date" name="dob" class="text" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Batch</label></td>
                                    <td>
                                        <select name="batch" class="batch-dropdown" id="batch">
                                            <option value="<%=batch1.getBatchid()%>"><%=batch1.getBatchname()%></option>
                                            
                                        </select>
                                    </td>
                                    <td><label>Status</label></td>
                                    <td>
                                        <input type="text" value="Active" name="status" class="text" readonly placeholder="Active">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;">
                                       <hr> <input type="submit" value="Add">
                                       		&nbsp; &nbsp; &nbsp; &nbsp; 
                                       		<input type="submit" value="Close" onclick="addstudclose()">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <%} %>
<!-- ===================================== All Student List=========================================== -->
			<div class="small-containers ">
                <div class="student-containt container-padding ">
                    <div><i class="fa fa-list" aria-hidden="true"></i>
                        <span>Student List</span>
                    </div>
                    <div>
                        <select name="batch-dropdown" class="batch-dropdown" id="batch" onchange="location = this.value;">
                            <option value="---">Select Batch</option>
                        <% 
						for(Batch batch : Listbatch) {
						%>
                            <option value="User-Page.jsp?pg=2&sbatch=1&sbatchid=<%=batch.getBatchid()%>">
                            	<%=batch.getBatchname()%>
                            </option>
                         <%i++;%>
                        <%} %>      
                        </select>
                    </div>
                </div>
                <hr>
                <div class="student-containt-list container-padding">
                    <table>
                        <tr>
                         	<th>Sr No.</th>
                            <th>Roll No.</th>
                            <th>Name</th>
                            <th>Email-Id</th>
                            <th>Phone No.</th>
                            
                            <th>Date of Birth</th>
                            <th>Gender</th>
                            <th>Batch</th>
							<th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        <% if(request.getParameter("sbatchid")!=null/* &&request.getParameter("sbatch")!=null  */){  
                            int j=0;
    						List<Student> Liststud = DAO.getAllstudent(sbatchid);
    						for(Student stud : Liststud) {	
						%>
                        <tr>
                            <td><%=j+1 %></td>
                            <td><%=stud.getRollno() %></td>
                            <td><%=stud.getFirstname() %> <%=stud.getMiddlename() %> <%=stud.getLastname() %> </td>
                            <td><%=stud.getStudentemailid() %></td>
                            <td><%=stud.getPhoneno() %></td>
                            <%Batch batch1=DAO.getbatchDetails(stud.getStudentbatch());
                            User user12=DAO.getUserDetails(batch1.getAddedby());
                            %>
                           <%--  <td><%=stud.getStudentbatch() %></td> --%>
                            <%-- <td><%=batch1.getBatchname() %></td> --%>
                           
                            <td><%=stud.getStudentdob()%></td>
                            <td><%=stud.getStudentgender()%></td>
                           	<td><%=batch1.getBatchname() %></td>
                            <td>
                            	<a href="User-Page.jsp?pg=2&estud=1&sbatchid=<%=stud.getStudentbatch()%>&estudid=<%=stud.getStudentid()%>">
                            		<span class="material-symbols-outlined">edit </span>
                                </a>
                             </td>
                             <td> 
                             	 <a href="User-Page.jsp?pg=2&dstude=1&dstudeid=<%=stud.getStudentid()%>">
	                                <span style="color: red;" class="material-symbols-outlined">delete_forever</span>
                                </a>
                            </td>
                        </tr>
	                         <%j++;
	                         } 
    					}else{%>
                        	<tr>
                        		<td colspan="11"> ----------Select Batch----------</td>
                        	</tr>
                       	<%}%>
                    </table>
                </div>
                <hr>
            </div> 

<!-- ========================================Edit Student ============================================================== -->
			<%if(request.getParameter("estud")!=null&&request.getParameter("estudid")!=null ){ 
				Student std=DAO.getStudentDetails(estudid);
			%>
				<jsp:include page="Edit-stud-Details.jsp" /> 
				<%-- <h1><%=std.getStudentid() %></h1>
				<h1><%=std.getStudentemailid() %></h1> --%>
		  <%} %>
<!-- =========================================================================================================================== -->
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