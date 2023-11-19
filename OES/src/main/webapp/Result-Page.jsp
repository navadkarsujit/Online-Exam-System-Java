<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>	
<%
DatabaseClass DAO = new DatabaseClass();
/* String id = (String) session.getAttribute("UserId"); */
String gexamid = request.getParameter("gexamid");
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
                        <span>Result</span>
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
			if (request.getParameter("delresid")!=null) {
				String delresid = request.getParameter("delresid");
				String delans = request.getParameter("delans");
				String delexm = request.getParameter("delexm");
				DAO.delresult(delresid);
				DAO.delans(delans, delexm); 
				
			}   
			%>
			<%
			if (request.getParameter("sendresultid")!=null) {
				String sendresultid = request.getParameter("sendresultid");
				String sendstudid = request.getParameter("sendstudid");
				Student s=DAO.getStudentDetails(sendstudid);
				Result r=DAO.resultdetail(sendresultid);
				GEmailSender gEmailSender = new GEmailSender();
			    String from = "systemonlineexamination@gmail.com";
			    String subject = "Exam Student";
			    String emailid=s.getStudentemailid();
			    Exam e=DAO.getexamDetails(r.getExamid());
			    int x=Integer.parseInt(r.getTotalmarks());
            	int y=Integer.parseInt(r.getMarks());
            	int z=y*100/x;
            	if(z>35){
					String text = " Dear "+s.getFirstname()+","+
							"\n \n Your Exam Result : "+
            				"\n Exam Title : "+e.getExamtitle()+
            				"\n Total Marks : "+r.getTotalmarks()+
            				"\n Gained Marks : "+r.getMarks()+
							"\n Percentage : "+z+"% ."+
							"\n Status : Pass" ;
					 boolean b = gEmailSender.sendEmail(emailid, from, subject, text);
            	}else{
            		String text = " Dear "+s.getFirstname()+","+
            				"\n \n Your Exam Result : "+
            				"\n Exam Title : "+e.getExamtitle()+
            				"\n Total Marks : "+r.getTotalmarks()+
            				"\n Gained Marks : "+r.getMarks()+
							"\n Percentage : "+z+"% ."+
							"\n Status : Fail" ;
					 boolean b = gEmailSender.sendEmail(emailid, from, subject, text);
            	}
			}   
			%>
<!-- ==========================================Add Exam============================ -->	
  			<div class="small-containers batchlist" id="batchlist">
                 <div class="student-containt container-padding ">
                    <div><i class="fa fa-list" aria-hidden="true"></i>
                        <span>Result List</span>
                    </div>
                    <div>
                        <select name="batch-dropdown" class="batch-dropdown" id="batch" onchange="location = this.value;">
                            <option value="---">Select Exam</option>
                        <% 
                        int i=0;
						List<Exam> Listexam = DAO.getAllexam(id);
						for(Exam exam : Listexam) {
							/* List<Result> Listres = DAO.getresultid(exam.getExamid());
							for(Result resu :Listres){
								Exam e=DAO.getexamDetails(resu.getExamid()); */
						%>
                            <option value="User-Page.jsp?pg=6&gexamid=<%=exam.getExamid()%>">
                            	<%=exam.getExamtitle()%>
                            </option>
                         <%i++;%>
                        <%}
					/* 	} */ %>      
                        </select>
                    </div>
                </div>
                <hr>
                <div class="queslist ">
                    <table >
                        <tr>
                        	<th style="width:7%">Sr. No.</th>
                        	<th>Student Name</th>
                            <th>Exam Name</th>
                            <th>Total Marks</th>
                            <th>Obtained Marks</th>
                            <th>Status</th> 
                            <th>Percentage</th>  
                            <th style="width:7%">Send</th>
                            <th style="width:7%">Delete</th>
                        </tr>
                        <% 
                        if(request.getParameter("gexamid")!=null/* &&request.getParameter("sbatch")!=null  */){  
                            int j=0;
                            List<Result> Listres = DAO.getresultid(gexamid);
                            for(Result resu :Listres){
                            	Student s1=DAO.getStudentDetails(resu.getStudid());
                            	Exam e=DAO.getexamDetails(resu.getExamid());
                            	int x=Integer.parseInt(resu.getTotalmarks());
                            	int y=Integer.parseInt(resu.getMarks());
                            	int z=y*100/x;
						%>
                        <tr>
                        	<td><%=j+1 %></td>
                        	<td><%=s1.getFirstname()%> <%=s1.getLastname() %></td>
                            <td><%=e.getExamtitle() %></td>
                            <td><%=resu.getTotalmarks()%></td>
                            <td><%=resu.getMarks()%></td>
                            <%if(z>35){%>
                            <td>Pass</td>
                            <%}else{ %>
                            <td>Fail</td>
                            <%} %>
                            <td><%=z %> %</td>
                            <td>
	                            <a href="User-Page.jsp?pg=6&sendresultid=<%=resu.getResultid()%>&sendstudid=<%=resu.getStudid()%>">
	                                <span  class="material-symbols-outlined">send</span>
                                </a>
                            </td>
                            <td>
	                            <a href="User-Page.jsp?pg=6&delresid=<%=resu.getResultid()%>&delans=<%=resu.getStudid()%>&delexm=<%=resu.getExamid()%>">
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