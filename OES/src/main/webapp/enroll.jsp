<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>	
<%
DatabaseClass DAO = new DatabaseClass();
/* String id = (String) session.getAttribute("UserId"); */
String eexam = request.getParameter("eexam");
String eexamid = request.getParameter("eexamid");


%>
<%if(session.getAttribute("UserStatus")!=null){
	if(session.getAttribute("UserStatus").equals("1")){ 
		String id = (String) session.getAttribute("UserId");
 		User user=DAO.getUserDetails(id);
%>
	 <!-- --------------------------main body ---------------------------------------------->
	<div class="main-body">
		<div class="main-containt">
			<div class="small-containers">
                <div class="dash-board container-padding">
                    <div class="flex-div-center">
                       
                        <span>Enroll Exam</span>
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
       	<%
			if (request.getParameter("delen")!=null&&request.getParameter("denid")!=null) {
				String denid = request.getParameter("denid");
				DAO.deleteenrol(denid);
			}   
			%>
<!-- ======================================================================================== -->
			<div class="small-containers">
                <div class="student-cont container-padding ">
                    <div onclick="showen()">
                    	<i class="fa fa-add" aria-hidden="true"></i>
                        <span>Enroll New</span>
                    </div>
                </div>
                <hr>
            </div>
            
<!--  /*====================================enroll==============================================  */ -->
			<div class="addexam3" id="enroll">
                <div class="addexam ">
                    <div>
                        <span class="stud-head-style flex-div-center">Enroll Exam</span>
                        <hr>
                        <br>
                    </div>
                    <div class="addstudent1">
                         <form action="Controller.jsp" method="post" class="signup">
                          	<input type="hidden" name="page" value="enroll">
                    		<input type="hidden" name="addedby" value="<%=id%>">
                            <table>
                                <tr>
                                    <td><label>Select Exam</label></td>
                                    <td>
                                        <select  name="enexamid"  class="exam-dropdown" id="batch" required>
                                        	<% 	List<Exam> Listexam = DAO.getAllexam(id);
    											for(Exam exa : Listexam) {	
											%>
                                            	<option value="<%=exa.getExamid()%>"><%=exa.getExamtitle()%></option>
                                            <%} %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Select Student Batch</label></td>
                                    <td>
                                        <select  name="enbatchid" class="exam-dropdown" id="batch" required>
                                            <%List<Batch> Listbatch = DAO.getAllBatch(id);
                    						for(Batch batch : Listbatch) { %>
                                            	<option value="<%=batch.getBatchid()%>"><%=batch.getBatchname()%></option>
                                            <%} %>
                                        </select>
                                    </td>
                                </tr>
                                
                                <tr>
            
                                    <td colspan="2" style="text-align: center;">
                                       <br><hr> <input type="submit" value="Save">
                                       <input onclick="closeen()" type="button" value="Cancel" style="background: #f44336;">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
<!--  /*==================================Table ================================================  */ -->
			<div class="small-containers ">
                <div class="student-containt container-padding ">
                    <div >
                    	<i class="fa fa-list" aria-hidden="true"></i>
                        <span>Exam List</span>
                    </div>
                </div>
                <hr>
                <div class="student-containt-list container-padding">
                    <table>
                        <tr>
                        	<th>Sr no.</th>
                            <th style="width:30%">Batch Name</th>
                            <th style="width:30%">Exam Name</th>
                            <th>Delete</th>
                        </tr>
                        <%  int j=0;
    						List<Enroll> Liste =DAO.getenroll(id);
    						for(Enroll enrol : Liste) {	
    							Exam ex=DAO.getexamDetails(enrol.getEnexamid());
    							Batch bt=DAO.getbatchDetails(enrol.getEnbatchid());
						%>
                        <tr>
                            <td><%=j+1 %></td>
                            <td><%=bt.getBatchname()%></td>
                            <td><%=ex.getExamtitle() %></td>
                           	<td>
                                <a  href="User-Page.jsp?pg=5&delen=1&denid=<%=enrol.getEnrollid()%>">
	                                <span style="color: red;" class="material-symbols-outlined">delete_forever</span>
                                </a>
                            </td>
                        </tr>
                        <%
                        j++;
	                       
    					}%>
                        	<tr>
                        		<td colspan="11"> ----------------------------------------------</td>
                        	</tr>
                       
                    </table>
                </div>
                <hr>
            </div> 


<!--  /*==================================================================================  */ -->
		
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