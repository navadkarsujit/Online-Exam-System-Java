<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
String sid = (String) session.getAttribute("studId");
%>
<style>
	.exsta{
		font-size:24px;
		padding-left:15px;
		font-weight:600;
	}
</style>

<!-- --------------------------main body ---------------------------------------------->
<div class="main-body">
	<div class="main-containt">
		<!-- ---------------------------------------------------------------------->
		<div class="small-containers">
			<div class="dash-board container-padding">
				<div class="flex-div-center">
					<span class="material-symbols-outlined">school </span> <span> Exam</span>
				</div>
				<a href="">Today is <span id="day">day</span>, <span id="daynum">00</span>
					<span id="month">month</span> <span id="year">0000</span> <span
					class="display-time"></span>
				</a>
			</div>
			<hr>
		</div>
		<!-- --------------------------main body ---------------------------------------------->
		<br>
		<p class="exsta"> Pending Exam</p>
		<div class="small-containers">
			<div class="stud-dashboard  flex-div">
			
			<%
			Student su=DAO.getStudentDetails(sid); 
			String batchid=su.getStudentbatch();
			List<Enroll> Listenb =DAO.getenrollbatch(batchid);
			for(Enroll enr : Listenb) {	
				List<Result> reos =DAO.resdouble(sid,enr.getEnexamid());
				String status="Active";
				if(reos.size()==0){ 
			%>
				<div class="card12">
					<div class="card1">
						<%Exam ex1=DAO.getexamDetails(enr.getEnexamid()); %>
						<span>Exam Name: <%=ex1.getExamtitle() %> <br>
						</span>
						<br><span>Description : <%=ex1.getExamdesc()%> </span>
					</div>
					<div class="card2">
					<%
						ArrayList list=DAO.getQuestions(ex1.getExamid());	
						int a=list.size();
						int b=Integer.parseInt(ex1.getMarkright());
						int c=a*b;
						%>
						<a href="stud-Page.jsp?spg=11&startexam=<%=ex1.getExamid()%>">Start </a> 
						<a href="">Question : <%=list.size() %></a> 
						<a href="">Time : <%=ex1.getExamduration() %> Minute</a> 
						<a href="">Marks : <%=c%></a>
					</div>
				</div>
				<%
					}
				} 
				%>
			</div>
		</div>
		
		<!-- Pending -->
		<hr><br>
		<p class="exsta"> Completed Exam</p>
		<div class="small-containers">
			<div class="stud-dashboard  flex-div">
			<%
			for(Enroll enr : Listenb) {	
				List<Result> reos =DAO.resdouble(sid,enr.getEnexamid());
				if(reos.size()==1){ 
			%>
				<div class="card12">
					<div class="card1">
						<%Exam ex1=DAO.getexamDetails(enr.getEnexamid()); %>
						<span>Exam Name: <%=ex1.getExamtitle() %> <br></span><br> 
						<span>Description : <%=ex1.getExamdesc()%> </span>
					</div>
					<div class="card2">
					<%
						ArrayList list=DAO.getQuestions(ex1.getExamid());	
						int a=list.size();
						int b=Integer.parseInt(ex1.getMarkright());
						int c=a*b;
						%>
						<a>Competed </a> 
						<a href="">Question : <%=list.size() %></a> 
						<a href="">Time : <%=ex1.getExamduration() %> Minute</a> 
						<a href="">Marks : <%=c %></a>
					</div>
				</div>
				<%
				}
				} 
				%>
			</div>
		</div>
		<hr><br>
		<p class="exsta"> All Exam</p>
		<div class="small-containers">
			<div class="stud-dashboard  flex-div">
			<%
			for(Enroll enr : Listenb) {	
				List<Result> reos =DAO.resdouble(sid,enr.getEnexamid());
				
			%>
				<div class="card12">
					<div class="card1">
						<%Exam ex1=DAO.getexamDetails(enr.getEnexamid()); %>
						<span>Exam Name: <%=ex1.getExamtitle() %><br> </span><br>
						<span>Description : <%=ex1.getExamdesc()%> </span>
					</div>
					<div class="card2">
						<%
						ArrayList list=DAO.getQuestions(ex1.getExamid());	
						int a=list.size();
						int b=Integer.parseInt(ex1.getMarkright());
						int c=a*b;
						%>
						<a href="">Question : <%=list.size()%></a> 
						<a href="">Time : <%=ex1.getExamduration() %> Minute</a> 
						<a href="">Marks : <%=c %></a>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		
		
		<%-- <!-- ---------------------------------------------------------------------------------->
		<%
			if (request.getParameter("exam")!=null) {
				String exid1 = request.getParameter("exid1");
				%>
				<h1>----------------------------<%=exid1 %>--------------</h1>
				
				<%
			}   
			%> --%>
	</div>
</div>

	