
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
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Test</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/nav.css">
	<script src="https://kit.fontawesome.com/908f7da306.js"	crossorigin="anonymous"></script>
	<link rel="stylesheet"	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<link rel="stylesheet" href="css/form.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="img/logo2.png">
</head>
<body>
	<!-- ---------------------nav bar-------------------------- -->
	<nav class="main-nav flex-div">
		<div class="main-nav-left flex-div">
			<a href="" class="nav-logo">Online Examination System</a>
		</div>
		<div class="main-nav-right flex-div" id="showprofilemenu">
<%
if (session.getAttribute("studStatus") != null) {
	if (session.getAttribute("studStatus").equals("1")) {
		String sid = (String) session.getAttribute("studId");
		Student sd = DAO.getStudentDetails(sid);
%>
			<p class="user-name"><%=sd.getFirstname()%></p>
			 <span class="material-symbols-outlined "> account_circle </span>

		</div>
	</nav>
<!-- ---------------------------------------------------------------Exam Page---------------------------------------->
	<%
		if (session.getAttribute("examStatus") != null) {
			if (session.getAttribute("examStatus").equals("1")) {
				/* String sid = (String) session.getAttribute("studId"); */
				String exid1 = (String) session.getAttribute("startexam");
				Exam exdetail =DAO.getexamDetails(exid1);
				/* 
				Student sd = DAO.getStudentDetails(sid); */
	%>
	<div class="exam-section">
		<div class="exam-container" >
			<form action="Controller.jsp" name="quiz" method="post" class="signup">
				<%
				ArrayList list=DAO.getQuestions(exid1);
				Question ques;
				
				%>
				<input type="hidden" name="size" value="<%=list.size()%>">
				<input type="hidden" name="totalmarks" value="<%=exdetail.getMarkright()%>">
				<input type="hidden" name="totalmarksw" value="<%=exdetail.getMarkwrong()%>">
				
				
				<%
				for (int k = 0; k < list.size(); k++) {
					ques = (Question) list.get(k);
				/* List<Question> Listques=DAO.getexamquestion(exid1); 
				for(Question ques : Listques) { */
				%>
				
				<div class="newcont">
					<div class="question1">
						<p class="ques">Q <%=k+1 %>) <%=ques.getQues() %></p>
						<p class="desc"><%=ques.getQdesc() %></p>
					</div>
					
					<div class="Answer">
						<label class="A1"><input type="radio" name="opt<%=k %>" onclick="myFunction<%=k+1 %>(this.value)" value="<%=ques.getOptn1() %>"> <%=ques.getOptn1() %></label> 
						<label class="A1"><input type="radio" name="opt<%=k %>" onclick="myFunction<%=k+1 %>(this.value)" value="<%=ques.getOptn2() %>"> <%=ques.getOptn2() %></label> 
						<label class="A1"><input type="radio" name="opt<%=k %>" onclick="myFunction<%=k+1 %>(this.value)" value="<%=ques.getOptn3() %>"> <%=ques.getOptn3() %></label> 
						<label class="A1"><input type="radio" name="opt<%=k %>" onclick="myFunction<%=k+1 %>(this.value)" value="<%=ques.getOptn4() %>"> <%=ques.getOptn4() %></label>
						<label class="A1" id="radio1"><input  checked type="radio" name="opt<%=k %>" onclick="myFunction<%=k+1 %>(this.value)" value="NOTSELECTED"> <%=ques.getOptn4() %></label>
					</div>
					<div class="answer1">
						<p>
							Selected Answer: <input type="text" name="answer" id="result<%=k+1 %>" readonly>
						</p>
					</div>
				</div>
				<input type="hidden" name="cexamid<%=k %>" value="<%= ques.getExamid()%>">
				<input type="hidden" name="question<%=k %>" value="<%=ques.getQues() %>">
				<input type="hidden" name="questionid<%=k %>" value="<%=ques.getQuesid()%>">
				<%
			
				} %>
				<%int a=list.size();
					int b=Integer.parseInt(exdetail.getMarkright());
					int c=a*b;
				%>
				<hr>
				<div class="subexam">
					<input type="hidden" name="marktot" value="<%=c%>">
					<input type="hidden" name="page" value="exams">
            		<input type="hidden" name="operation" value="submitted"> 
					<input type="Submit" value="Submit Exam">
				</div>
			</form>
		</div>
		
		
		<div class="right-container">
			<div class="time">
				<p>Time Left : <b id="quiz-time-left"> </b></p>
			</div>
			<div class="profile">
				<p>Name : <%=sd.getFirstname() %> <%=sd.getLastname() %></p>
				<p>Exam Name : <%=exdetail.getExamtitle()%></p>
				<p>Total Questions : <%=list.size()%></p>
				<p>Total Marks : <%=c%></p>
				<p>Mark for Correct : <%=exdetail.getMarkright() %></p>
				<p>Mark for Wrong : <%=exdetail.getMarkwrong() %></p>
				<p>Exam Duration : <%=exdetail.getExamduration() %> Minutes</p>
			</div>
			<div class="profile1122" id="container">
				<video autoplay="true" id="videoElement">	</video>
			</div>
		</div>
	</div>
	<!-- -------------------------------------timer-------------------------------------- -->
	<script type="text/JavaScript">
		<%int dur=Integer.parseInt(exdetail.getExamduration()); %>
    	 var total_seconds=60*<%=dur%>+5; 
    	 /* var total_seconds=60*1;  */
    	var min=parseInt(total_seconds/60);
    	var sec=parseInt(total_seconds%60);
    	function CheckTime(){
	       	document.getElementById("quiz-time-left").innerHTML=''+min+':'+sec;
	       	if(total_seconds<=0){
	           	setTimeout('document.quiz.submit()',1);
	       	}else{
	       	   	total_seconds =total_seconds-1;
	          	min=parseInt(total_seconds/60);
	           	sec=parseInt(total_seconds%60);
	           	setTimeout("CheckTime()",1000);
	       	}
	    }
    	setTimeout("CheckTime()",1000);
	</script>
	
	<!-- ------------------------------instruction------------------------------------- -->
	<div class="instuction " id="instr">
        <div class="insthead">
            <span class=" flex-div-center">Instruction</span>
        </div>
        <div class="instuction1">
           <h2>Read the instructions of this page carefully</h2>
          
          
           <h2>Exam Name</h2>
           <p>Description</p>
           <hr>
           <h2>Important instructions</h2>
            <p>&#x2022; You have to submit quiz in <b><%=exdetail.getExamduration() %> Minutes</b>.</p>
            <p>&#x2022; There are <b> <%=list.size()%> Questions </b> in this exam.</p>
            <p>&#x2022; Each Question carries <b> <%=exdetail.getMarkright() %> Mark </b>.</p>
            <p>&#x2022; Negative mark for wrong answer <b> <%=exdetail.getMarkwrong() %> marks </b>.</p>
            <p>&#x2022; All questions is of MCQ Types.</p>
            <p><i><b>Best of Luck For Your Exam</b></i></p>
            
            <div class="start">
                <a><input type="button" onclick="closeinstr()" value="Start Exam"></a>
            </div>
        </div>
    </div>
	<%
	}
	}
	}
	}
	%>
	<%
		int i=0;
		String exid1 = (String) session.getAttribute("startexam");
		List<Question> Listques=DAO.getexamquestion(exid1); 
		for(Question ques : Listques) {
	%>
	<script>
		function closeinstr() {
		  document.getElementById("instr").style.display = "none";
		}
		function showinstr() {
		  document.getElementById("instr").style.display = "block";
		}
		function myFunction<%=i+1%>(browser) {
  			document.getElementById("result<%=i+1%>").value = browser;
		}
	</script>
	<%
	i++;
	} %>
	
	<script>
    	history.forward();
    </script>
    <script>
		let video= document.querySelector('#videoElement') ;
	
		if (navigator.mediaDevices.getUserMedia) {
			navigator. mediaDevices.getUserMedia({ video: true})
			.then(function (stream) {
				video. srcObject =stream;
			})
			. catch (function (error) {
			console. log("Something went wrong!" ) ;
			})
		} else {
			console.log ("not supported ! " ) ;
		}

	</script>
	
</body>
</html>