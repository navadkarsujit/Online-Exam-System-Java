
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
<!-- --------------------------main body ---------------------------------------------->
		<div class="main-body">
			<div class="main-containt">
				<div class="small-containers">
					<div class="dash-board container-padding">
						<div class="flex-div-center">
							<span class="material-symbols-outlined">dashboard</span> <span>Dashboard</span>
						</div>
						<a href="">Today is <span id="day">day</span>, <span id="daynum">00</span>
							<span id="month">month</span> <span id="year">0000</span> <span
							class="display-time"></span>
						</a>
					</div>
					<hr>
				</div>
				<%
					int p=0;
					Student su=DAO.getStudentDetails(sid); 
					String batchid=su.getStudentbatch();
					List<Enroll> Listenb =DAO.getenrollbatch(batchid);
					for(Enroll enr : Listenb) {	
						List<Result> reos =DAO.resdouble(sid,enr.getEnexamid());
						String status="Active";
						if(reos.size()==0){ 
							p++;
						}
					}
					int c=0;
					for(Enroll enr : Listenb) {	
						List<Result> reos =DAO.resdouble(sid,enr.getEnexamid());
						if(reos.size()==1){ 
							c++;
						}
					}
					int t=0;
					for(Enroll enr : Listenb) {	
						List<Result> reos =DAO.resdouble(sid,enr.getEnexamid());
						t++;
					}
				%>
				<div class="small-container ">
					<div class="dashboard  flex-div">
						<div class="card ">
							<div class="flex-div">
								<div class="card-1">
									<span class="material-symbols-outlined"> receipt_long </span><br>
									<span>&nbsp; </span>
								</div>
								<div class="card-2">
									<span>Total Exams</span><br>
									<br> <span><%=t %></span>
								</div>
							</div>
		
						</div>
						<div class="card ">
							<div class="flex-div">
								<div class="card-1">
									<span class="material-symbols-outlined"> receipt_long </span><br>
									<span>&nbsp; </span>
								</div>
								<div class="card-2">
									<span>Completed Exams</span><br>
									<br> <span><%=c %></span>
								</div>
							</div>
		
						</div>
						<div class="card ">
							<div class="flex-div">
								<div class="card-1">
									<span class="material-symbols-outlined"> receipt_long </span><br>
									<span>&nbsp; </span>
								</div>
								<div class="card-2">
									<span>Pending Exams</span><br>
									<br> <span><%=p %></span>
								</div>
							</div>
		
						</div>
						<div class="card">
							<div class="flex-div">
								<div class="card-1">
									<span class="material-symbols-outlined">
										notification_important </span> <br> <span>&nbsp;&nbsp;&nbsp;&nbsp;
										Notice </span>
								</div>
								<div class="card-2">
									<span>Notices</span><br>
									<%
										List<Notice> Liste = DAO.getnotice(sd.getStudentaddedby());
									%>
									<br> <span><%=Liste.size() %></span>
								</div>
							</div>
		
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%		
    	}else 
    		response.sendRedirect("Student-Login.jsp?msg=1"); 
   	}else 
   		response.sendRedirect("Student-Login.jsp?msg=1"); 
    
    %>