<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>	
<%
DatabaseClass DAO = new DatabaseClass();
/* String id = (String) session.getAttribute("UserId"); */
String eexam = request.getParameter("eexam");
String eexamid = request.getParameter("eexamid");
String sexamid = request.getParameter("sexamid");
String delques = request.getParameter("delques");

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
                        
                        <span>Questions</span>
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
<!--  /*=============================Delete Exam========================================  */ -->
			<%
			if (request.getParameter("delquesid")!=null&&request.getParameter("delques")!=null) {
				String delquesid = request.getParameter("delquesid");
				DAO.deleteques(delquesid);
			}   
			%>
<!-- ==========================================Add Exam============================ -->	

  			<div class="small-containers batchlist" id="batchlist">
                 <div class="student-containt container-padding ">
                    <div><i class="fa fa-list" aria-hidden="true"></i>
                        <span>Question List</span>
                    </div>
                    <div>
                        <select name="batch-dropdown" class="batch-dropdown" id="batch" onchange="location = this.value;">
                            <option value="---">Select Exam</option>
                        <% 
                        int i=0;
						List<Exam> Listexam = DAO.getAllexam(id);
						for(Exam exam : Listexam) {
						%>
                            <option value="User-Page.jsp?pg=4&sques=1&sexamid=<%=exam.getExamid()%>">
                            	<%=exam.getExamtitle()%>
                            </option>
                         <%i++;%>
                        <%} %>      
                        </select>
                    </div>
                </div>
                <hr>
                <div class="queslist ">
                    <table >
                        <tr>
                        	<th style="width:5%">Sr. No.</th>
                        	<th style="width:10%">Exam Name</th>
                            <th>Question</th>
                            <th>Option 1</th>
                            <th>Option 2</th>
                            <th>Option 3</th>  
                            <th>Option 4</th>
                            <th>Answer</th>
                            <th style="width:7%">Delete</th>
                        </tr>
                        <% 
                        if(request.getParameter("sexamid")!=null/* &&request.getParameter("sbatch")!=null  */){  
                            int j=0;
							List<Question> Listques = DAO.getexamquestion(sexamid);
							for(Question ques : Listques) {
								Exam e=DAO.getexamDetails(ques.getExamid());
						%>
                        <tr>
                        	<td><%=j+1 %></td>
                        	<td><%=e.getExamtitle()%></td>
                            <td><%=ques.getQues()%></td>
                            <td><%=ques.getOptn1()%></td>
                            <td><%=ques.getOptn2()%></td>
                            <td ><%=ques.getOptn3()%></td>
                            <td><%=ques.getOptn4()%></td>
                            <td><%=ques.getAns()%></td>
                            <td>
	                            <a href="User-Page.jsp?pg=4&delques=1&delquesid=<%=ques.getQuesid()%>">
	                                <span style="color: red;" class="material-symbols-outlined">delete_forever</span>
                                </a>
                            </td>
                        </tr> 
                        
                        
                        <%j++;
                        	}
                        	
	                          
    					}else{%>
                        	<tr>
                        		<td colspan="9"> ----------Select Exam----------</td>
                        	</tr>
                       	<%}%>                      
                    </table> 
                </div>
                <hr>
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