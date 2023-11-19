<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>	
<%
DatabaseClass DAO = new DatabaseClass();
String id = (String) session.getAttribute("UserId"); 
%>
<%if(session.getAttribute("UserStatus")!=null){
	if(session.getAttribute("UserStatus").equals("1")){ 
		/* String id = (String) session.getAttribute("UserId"); */
 		User user1=DAO.getUserDetails(id);
%>
    <!-- --------------------------main body ---------------------------------------------->
    <div class="main-body">
        <div class="main-containt">
            <div class="small-containers">
                <div class="dash-board container-padding">
                    <div class="flex-div-center">
                        
                        <span>Dashboard</span>
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
        
          <!--   <div class="UserProfile " id="EditProfile" >
                <div>
                    <span class="stud-head-style flex-div-center">Edit Profile</span>
                </div>
                <div class="UserProfile1">
                    <form action="">
                        <hr>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="fname">Username</label>
                            </div>
                            <div class="col-75 ">
                                <input type="text" value="Sujit" readonly id="fname" name="firstname" placeholder="Username..">
                            </div>
                        </div>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="lname">Email-Id</label>
                            </div>
                            <div class="col-75">
                                <input type="email" value="
                                sujitnavadkar11@gmail.com" readonly id="lname" name="lastname" placeholder="Email-Id..">
                            </div>
                        </div>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="lname">Password</label>
                            </div>
                            <div class="col-75">
                                <input type="password" value="1122212" id="lname" name="lastname" placeholder="Password..">
                            </div>
                        </div>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="lname">Phone Number</label>
                            </div>
                            <div class="col-75">
                                <input type="text" value="9958746809" id="lname" name="lastname" placeholder="Phone No..">
                            </div>
                        </div>
                          <hr>        
                        <div class="row flex-div-center">
                            <input type="submit" value="Update">
                            <input type="button" value="Close" onclick="closeForm()">
                        </div>
                    </form>
                </div>
            </div> -->
<!-- ================================================================================ -->
            <div class="small-container ">
                <div class="dashboard  flex-div">
                    <div class="card ">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    person
                                </span><br>
                                <span>
                                    Student List
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Total Students</span><br><br>
                                <%List<Student> set=DAO.getstudentcount(id);%>
                                <span><%=set.size()%></span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            <span>
                                Add
                            </span>
                            <a href="User-Page.jsp?pg=2">
                            <span class="material-symbols-outlined">
                                add
                            </span>
							</a>
                        </div>
                    </div>
                    <div class="card ">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    receipt_long
                                </span><br>
                                <span>&nbsp;
                                    Exam List
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Total Exams</span><br><br>
                                <%List<Exam> Listexam = DAO.getAllexam(id); %>
                                <span><%=Listexam.size() %></span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                Add
                            </span>
                            <a href="User-Page.jsp?pg=3">
                            <span class="material-symbols-outlined">
                                add
                            </span>
                            </a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    quiz
                                </span><br>
                                <span>
                                    Question List
                                </span>
                            </div>
                            <div class="card-2 ">
                                <span>Total Questions</span><br><br>
                                <%List<Question> ques = DAO.getAllquestion(id); %>
                                <span><%=ques.size() %></span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                Add
                            </span>
                            <a href="User-Page.jsp?pg=4">
                            <span class="material-symbols-outlined">
                                add
                            </span>
                            </a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    list_alt
                                </span><br>
                                <span>&nbsp;
                                    Result List
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Results</span><br><br>
                                <span></span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                Show
                            </span>
                            <a href="User-Page.jsp?pg=6">
                            <span class="material-symbols-outlined">
                                search
                            </span>
                            </a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    notification_important
                                </span>
                                <br>
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    Notice
                                </span>
                            </div>
                            <%
										List<Notice> Liste = DAO.getnotice(id);
							%>
                            <div class="card-2">
                                <span>Notices</span><br><br>
                                <span><%=Liste.size() %></span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                add
                            </span>
                            <a href="User-Page.jsp?pg=7">
                            <span class="material-symbols-outlined">
                                add
                            </span>
                            </a>
                        </div>
                    </div>
                </div>
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