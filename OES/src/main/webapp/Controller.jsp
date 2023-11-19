<%@page import="java.sql.Date"%>
<%@page import="java.sql.Time"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<!-- DAO class calling -->
<%
DatabaseClass DAO = new DatabaseClass();
/* ======================Add New User in database========================= */
if (request.getParameter("page").toString().equals("NewUser")) {
	/* String id = RandomIdGenerator.generateRandomString(); */
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String phone_no = request.getParameter("phone_no");
	String password = request.getParameter("password");

    GEmailSender gEmailSender = new GEmailSender();
    String from = "systemonlineexamination@gmail.com";
    String subject = "OTP Verification";
    if (DAO.UserValidate(email)) {
	    OTP otp=new OTP();
		String otpmessage=otp.generateOTP(6);
		String text = " Your One Time Password is " +otpmessage +
						"\n \n Verify your account using this otp";
	    boolean b = gEmailSender.sendEmail(email, from, subject, text);
		if (b) {
			response.sendRedirect("sample.jsp?email="+email+"&otp="+otpmessage+"&username="+username+"&password="+password+"&phone="+phone_no);
	
		} else {
			response.sendRedirect("sample.jsp?msg=unsuccessfully");
		}
    }
    else{
    	response.sendRedirect("User-Login.jsp?msg=Already");
    }
}
/* ======================Add New User in database========================= */
else if (request.getParameter("page").toString().equals("New1User")) {
	String id = RandomIdGenerator.generateRandomString();
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String phone_no = request.getParameter("phone_no");
	String password = request.getParameter("password");
	String otp = request.getParameter("otp");
	String votp = request.getParameter("votp");
	if(otp.equals(votp)){
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone_no(phone_no);
		user.setCreated_Date(DateFormat.getCurrentDate());
		if (DAO.saveUser(user)) {
			response.sendRedirect("User-Login.jsp?msg=successfully");
	
		} else {
			response.sendRedirect("User-Login.jsp?msg=unsuccessfully");
		}
	}
	else{
		response.sendRedirect("User-Login.jsp?msg=OTPisincorrect");
	}
}
/* ===========================User Login======================================= */
else if (request.getParameter("page").toString().equals("LoginUser")) {
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	if (DAO.UserLoginValidate(email, password)) {
		session.setAttribute("UserStatus", "1");
		session.setAttribute("UserId", DAO.getUserId(email, password));
		RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=1");
		rd.forward(request, response);
	} else {
		RequestDispatcher rd = request.getRequestDispatcher("User-Login.jsp?msg=unsuccessfully1");
		rd.include(request, response);
	}
}
/*=============================EditUserDetailr========================================  */
else if (request.getParameter("page").toString().equals("EditUserDetail")) {
	String id = request.getParameter("id");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String phone_no = request.getParameter("phone_no");
	String password = request.getParameter("password");
	DAO.updateUserDetails(id, username, email, password, phone_no);
	RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=1");
	rd.include(request, response);
}
/*=============================createbatch========================================  */
else if (request.getParameter("page").toString().equals("createbatch")) {
	String addedby = request.getParameter("addedby");
	String batchid = RandomIdGenerator.generateRandomString();
	String batchname = request.getParameter("batchname");
	Batch batch=new Batch();
	batch.setBatchid(batchid);
	batch.setAddedby(addedby);
	batch.setBatchname(batchname);
	batch.setAddeddate(DateFormat.getCurrentDate());
	if (DAO.addBatch(batch)) {
		response.sendRedirect("User-Page.jsp?pg=2");

	} else {
		response.sendRedirect("User-Page.jsp?pg=2");
	}
}/*=============================editbatch========================================  */
else if (request.getParameter("page").toString().equals("editbatch")) {
	String batchid = request.getParameter("batchid");
	String batchname = request.getParameter("batchname");
	DAO.updatebatchDetails(batchid, batchname);
	response.sendRedirect("User-Page.jsp?pg=2");
}/*==============================Add Student ==========================================  */
else if (request.getParameter("page").toString().equals("addStudent")) {
	String studentid = RandomIdGenerator.generateRandomString();
	String fname = request.getParameter("fname");
	String mname = request.getParameter("mname");
	String lname = request.getParameter("lname");
	String emailid = request.getParameter("emailid");
	String address = request.getParameter("address");
	String password = request.getParameter("password");
	String phoneno = request.getParameter("phoneno");
	String rollno = request.getParameter("rollno");
	String addedby = request.getParameter("addedby");
	String gender = request.getParameter("gender");
	String student_dob_raw = request.getParameter("dob");
	java.sql.Date student_dob = DateFormat.getsqlDate(student_dob_raw);
	String batch = request.getParameter("batch");
	String status = request.getParameter("status");

	Student student = new Student();

	student.setStudentid(studentid);
	student.setFirstname(fname);
	student.setMiddlename(mname);
	student.setLastname(lname);
	student.setStudentemailid(emailid);
	student.setStudentaddress(address);
	student.setStudentpassword(password);
	student.setPhoneno(phoneno);
	student.setRollno(rollno);
	student.setStudentaddedby(addedby);
	student.setStudentgender(gender);
	student.setStudentdob(student_dob);
	student.setStudentbatch(batch);
	student.setStudentstatus(status);
	student.setStudentaddedon(DateFormat.getCurrentDate()); 
	if (DAO.saveStudent(student)) {
		GEmailSender gEmailSender = new GEmailSender();
		User u=DAO.getUserDetails(addedby);
	    String from = "systemonlineexamination@gmail.com";
	    String subject = "Register Student";
	    String text = " Dear "+fname+","+
	    		"\n \n You have enrolled in the Online Examination System by "+u.getUsername()+
	    		"\n \n Login Details :"+
	    		"\n Email-id : "+emailid+
	    		"\n Password : "+password+
	    		"\n \n Please use this for login.";
	    boolean b = gEmailSender.sendEmail(emailid, from, subject, text);
		RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=2");
		rd.include(request, response);
	} else {
		RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=1");
		rd.include(request, response);
	} 	
	//List < Student > listUser =DAO.getAllUser();
	//request.setAttribute("listUser", listUser);
	/* if (DAO.saveStudent(student)) {
		//String msg="sucess";
		session.setAttribute("msg", "sucess");
		RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=2");
		rd.include(request, response);
		//response.sendRedirect("User-Page.jsp");

	} else {
		session.setAttribute("msg", "unsucess");
		RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=2");
		rd.include(request, response);
		//response.sendRedirect("User-Login.jsp");
	} */
	//RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=2");
	//rd.include(request, response);
}/*=============================EditStudentDetail========================================  */
else if (request.getParameter("page").toString().equals("EditStudentDetail")) {
	String studentid = request.getParameter("studentid");
	String fname = request.getParameter("fname");
	String emailid = request.getParameter("emailid");
	String mname = request.getParameter("mname");
	String lname = request.getParameter("lname");
	String address = request.getParameter("address");
	String password = request.getParameter("password");
	String rollno = request.getParameter("rollno");
	String gender = request.getParameter("gender");
	String student_dob_raw = request.getParameter("dob");
	java.sql.Date student_dob = DateFormat.getsqlDate(student_dob_raw);
	String status = request.getParameter("status");
	String sbatchid1 = request.getParameter("sbatchid1");
	
	DAO.updateStudentDetails(studentid, fname, mname, lname, address, password, rollno, gender, student_dob, status);
	GEmailSender gEmailSender = new GEmailSender();
    String from = "systemonlineexamination@gmail.com";
    String subject = "Update Student Details";
	String text = " Dear "+fname+","+
    		"\n \n Your email address and password have been changed."+
    		"\n \n Lodin Details :"+
			"\n Email-id : "+emailid+
			"\n Password : "+password+
			"\n \n Please use this for login.";
    boolean b = gEmailSender.sendEmail(emailid, from, subject, text);	
	RequestDispatcher rd = request.getRequestDispatcher("User-Page.jsp?pg=2&sbatchid="+sbatchid1+"");
	rd.include(request, response); 
}/*=============================createexam========================================  */
else if (request.getParameter("page").toString().equals("createexam")) {
	String examid = RandomIdGenerator.generateRandomString();
	String addedby = request.getParameter("addedby");
	String examtitle = request.getParameter("examtitle");
	String examdesc = request.getParameter("examdesc");
	String examduration = request.getParameter("examduration");  
	String totalQues ="100";  
	String markright = request.getParameter("markright");  
	String markwrong = request.getParameter("markwrong");  
	
	Exam exam=new Exam();
	
	exam.setExamid(examid);
	exam.setAddedby(addedby);
	exam.setExamtitle(examtitle);
	exam.setExamdesc(examdesc);
	exam.setExamduration(examduration);
	exam.setTotalQues(totalQues);
	exam.setMarkright(markright);
	exam.setMarkwrong(markwrong);
	
	if (DAO.addexam(exam)) {
		response.sendRedirect("User-Page.jsp?pg=3");

	} else {
		response.sendRedirect("User-Page.jsp?pg=1");
	}
	
}
/*=============================editexam========================================  */
else if (request.getParameter("page").toString().equals("editexam")) {
	String examid = request.getParameter("examid");
	String examtitle = request.getParameter("examtitle");
	String examduration = request.getParameter("examduration");  
	String totalQues ="100";  
	String markright = request.getParameter("markright");  
	String markwrong = request.getParameter("markwrong");  
	String examdesc = request.getParameter("examdesc");
	
	DAO.updateExamDetails(examid, examtitle, examduration, totalQues, markright, markwrong, examdesc);
	response.sendRedirect("User-Page.jsp?pg=3");
	
}/*=============================add question========================================  */
else if (request.getParameter("page").toString().equals("addquestion")) {
	String quesid = RandomIdGenerator.generateRandomString();
	String qexamid = request.getParameter("qexamid");
	String addedby = request.getParameter("addedby");
	String ques = request.getParameter("ques");
	String qdesc = request.getParameter("qdesc");
	String optn1=request.getParameter("optn1");
	String optn2 = request.getParameter("optn2");  
	String optn3 =request.getParameter("optn3");  
	String optn4 = request.getParameter("optn4");  
	String ans = request.getParameter("ans");  
	
	Question q=new Question();
	q.setAns(ans);
	q.setQuesid(quesid);
	q.setAddedby(addedby);
	q.setQues(ques);
	q.setQdesc(qdesc);
	q.setOptn1(optn1);
	q.setOptn2(optn2);
	q.setOptn3(optn3);
	q.setOptn4(optn4);
	q.setExamid(qexamid);
	
	if (DAO.addques(q)){
		response.sendRedirect("User-Page.jsp?pg=4&sexamid="+q.getExamid()+"");

	} else {
		response.sendRedirect("User-Page.jsp?pg=1");
	}
}
/*=============================enroll========================================  */
else if (request.getParameter("page").toString().equals("enroll")) {
	String enrollid = RandomIdGenerator.generateRandomString();
	String addedby = request.getParameter("addedby");
	String enexamid = request.getParameter("enexamid");
	String enbatchid=request.getParameter("enbatchid");
	String enstatus = "Active";   
	
	Enroll en=new Enroll();
	
	en.setEnrollid(enrollid);
	en.setAddedby(addedby);
	en.setEnexamid(enexamid);
	en.setEnbatchid(enbatchid);
	en.setEnstatus(enstatus);
	List<Enroll> Liste =DAO.enrollValidate(enexamid, enbatchid);
	if (Liste.size()==0) {
		DAO.adden(en);
		List<Student> Liststud = DAO.getAllstudent(enbatchid);
		for(Student stud : Liststud) {	
			Exam ex=DAO.getexamDetails(enexamid);
			GEmailSender gEmailSender = new GEmailSender();
		    String from = "systemonlineexamination@gmail.com";
		    String subject = "Exam Notice";
		    String text = " Dear "+stud.getFirstname()+","+
		    		"\n \n Greetings from Online Examination System"+
		    		"\n \n Online exam is assigned to you. Kindly login using the below mentioned username and password and take up the Exam."+
		    		"\n \n You need to appear for the exam."+
		    		"\n \n Exam Details"+
		    		"\n Exam Name : "+ex.getExamtitle()+
		    		"\n \n Login details :"+
		    		"\n Email-id : "+stud.getStudentemailid()+
		    		"\n Password : "+stud.getStudentpassword()+
		    		"\n \n All the Best!!!" ;
		    boolean b = gEmailSender.sendEmail(stud.getStudentemailid(), from, subject, text);
		}
	/* 	GEmailSender gEmailSender = new GEmailSender();
	    String from = "systemonlineexamination@gmail.com";
	    String subject = "Register Student";
	    String text = " Dear "+fname+","+
	    		"\n You Are registered in Online Examination System ."+
	    		"\n Your Email id : "+emailid+
	    		"\n Password "+password+" for login" ;
	    boolean b = gEmailSender.sendEmail(emailid, from, subject, text); */
	    				
		response.sendRedirect("User-Page.jsp?pg=5");
	} else {
		response.sendRedirect("User-Page.jsp?pg=5");
	}
	
	/* 
	if (DAO.adden(en)){
		response.sendRedirect("User-Page.jsp?pg=5");

	} else {
		response.sendRedirect("User-Page.jsp?pg=1");
	} */
}
/* ===========================student Login======================================= */
else if (request.getParameter("page").toString().equals("LoginStudent")) {
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	if (DAO.studLoginValidate(email, password)) {
		session.setAttribute("studStatus", "1");
		session.setAttribute("studId", DAO.getstudId(email, password));
		RequestDispatcher rd = request.getRequestDispatcher("stud-Page.jsp?spg=1");
		rd.forward(request, response);
	} else {
		RequestDispatcher rd = request.getRequestDispatcher("Student-Login.jsp?msg=unsuccessfully1");
		rd.include(request, response);
	}
}
/* ===========================paper======================================= */
else if (request.getParameter("page").toString().equals("exams")) {
	if (request.getParameter("operation").toString().equals("submitted")) {
        int size = Integer.parseInt(request.getParameter("size"));
        String exId = (String) session.getAttribute("startexam");
        String tMarks = request.getParameter("totalmarks");
        String tMarksw = request.getParameter("totalmarksw");
        String sid = (String) session.getAttribute("studId");
        int marktot=Integer.parseInt(request.getParameter("marktot"));
        session.removeAttribute("examStatus");
        session.removeAttribute("startexam");
        for (int i = 0; i < size; i++) {
        	String ansid = RandomIdGenerator.generateRandomString();
            String questionid = request.getParameter("questionid" + i);
            Question que=DAO.getquesDetails(questionid);
            String opt = request.getParameter("opt"+i);
            String cans=que.getAns();
            Answer a=new Answer();
          	a.setExId(exId);
            a.setSid(sid);
            
            if(request.getParameter("opt"+i).toString().equals(que.getAns())){
            	a.setMark(tMarks);
            }
            
            else if(request.getParameter("opt"+i).toString().equals("NOTSELECTED")){
            	a.setMark("0");	
            }
            
            else{
            	a.setMark(tMarksw);
            }
            
            a.setQuestionid(questionid);
            a.setOpt(opt);
            a.setAnsid(ansid);
            List<Answer> dou =DAO.ansdouble(questionid, sid);
            
            if (dou.size()==0) {
            	DAO.insertAnswer(a);
            }
        }
        int Mark=0;
        List<Answer> Liste =DAO.getans(exId, sid);
        	for(Answer ans : Liste) {	
        	 Mark+=Integer.parseInt(ans.getMark());
       		}
        String mark=String.valueOf(Mark);
        String totalmarks=String.valueOf(marktot);
        String resultid=RandomIdGenerator.generateRandomString();
      	Result r=new Result();
      	r.setExamid(exId);
      	r.setMarks(mark);
      	r.setResultid(resultid);
      	r.setStudid(sid);
      	r.setTotalmarks(totalmarks);
      	r.setExstatus("COMPLETE");
      	List<Result> reos =DAO.resdouble(sid,exId);
      	int an=reos.size();
      	System.out.println(an+"aaaaaaaaaaaaaaaaaaa------------------");	
        if (reos.size()==0) {
        	DAO.insertResult(r); 
        	System.out.println("Done");
        }
        else{
        	String resid =DAO.getres(sid, exId); 
        	DAO.updatereult(resid, mark, totalmarks);
        	
        	System.out.println(resid+"-----------------------------------");	
        }
        response.sendRedirect("stud-Page.jsp?spg=2");
        System.out.println(Mark+"-----------------------------------"+marktot);	
	 } 
}
/* ===========================logout======================================= */
else if (request.getParameter("page").toString().equals("logout")) {
    session.setAttribute("studStatus", "0");
    session.removeAttribute("examStatus");
    session.removeAttribute("startexam");
    response.sendRedirect("index.jsp");
}
/* ===========================logout======================================= */
else if (request.getParameter("page").toString().equals("logout1")) {
    session.setAttribute("UserStatus", "0");
    session.removeAttribute("UserId");
    response.sendRedirect("index.jsp");
}
/* ===========================Notice======================================= */
else if (request.getParameter("page").toString().equals("instrct")) {
	String noticeid = RandomIdGenerator.generateRandomString();
	String addedby = request.getParameter("addedby");
	String noticetitle = request.getParameter("topic");
	String description = request.getParameter("description");
  
	Notice n=new Notice();
	
	n.setAddedby(addedby);
	n.setDescription(description);
	n.setNoticeid(noticeid);
	n.setNoticetitle(noticetitle);
	
	if (DAO.addnotice(n)){
		response.sendRedirect("User-Page.jsp?pg=7");

	} else {
		response.sendRedirect("User-Page.jsp?pg=1");
	}
}


%>