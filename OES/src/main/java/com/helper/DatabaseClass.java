package com.helper;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.*;

public class DatabaseClass {
	/*----------------------------------User Data----------------------------------------------------*/
	// saving data in database of new user
	public boolean saveUser(User user) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(user);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// user login validate
	public boolean UserLoginValidate(String email, String password) {
		Transaction transaction = null;
		User user = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.email = :email").setParameter("email", email)
					.uniqueResult();
			// check password
			if (user != null && user.getPassword().equals(password)) {
				return true;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return false;
	}

	// user
	public boolean UserValidate(String email) {
		Transaction transaction = null;
		User user = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.email = :email").setParameter("email", email)
					.uniqueResult();
			// check password
			if (user == null) {
				return true;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return false;
	}

	// get id of user
	public String getUserId(String email, String password) {
		String id = null;
		Transaction transaction = null;
		User user = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.email = :email").setParameter("email", email)
					.uniqueResult();
			// getting id
			id = user.getId();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return id;
	}

	// User detail
	public User getUserDetails(String id) {
		Transaction transaction = null;
		User user = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			user = session.get(User.class, id);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
	}

	// update user details
	public void updateUserDetails(String id, String username, String email, String password, String phone_no) {
		Transaction transaction = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();

			User user = session.load(User.class, id);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone_no(phone_no);
			user.setUsername(username);
			session.update(user);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// Adding new batch
	public boolean addBatch(Batch batch) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(batch);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// update batch
	public void updatebatchDetails(String batchid, String batchname) {
		Transaction transaction = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Batch batch = session.load(Batch.class, batchid);
			batch.setBatchname(batchname);
			session.update(batch);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// get all batch from database
	public List<Batch> getAllBatch(String addedby) {
		Transaction transaction = null;
		List<Batch> ListOfBatch = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfBatch = session.createQuery("FROM Batch s WHERE s.addedby= :addedby").setParameter("addedby", addedby)
					.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfBatch;
	}

	// batch detail
	public Batch getbatchDetails(String batchid) {
		Transaction transaction = null;
		Batch batch = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			batch = session.get(Batch.class, batchid);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return batch;
	}

	// Adding new student
	public boolean saveStudent(Student student) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(student);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// get all student
	public List<Student> getAllstudent(String studentbatch) {
		Transaction transaction = null;
		List<Student> ListOfstudent = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfstudent = session.createQuery("FROM Student s WHERE s.studentbatch= :studentbatch")
					.setParameter("studentbatch", studentbatch).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfstudent;
	}

	// get student count
	public List<Student> getstudentcount(String addedby) {
		Transaction transaction = null;
		List<Student> ListOfstudent = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfstudent = session.createQuery("FROM Student s WHERE s.studentaddedby= :studentaddedby")
					.setParameter("studentaddedby", addedby).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfstudent;
	}

	// student detail
	public Student getStudentDetails(String studentid) {
		Transaction transaction = null;
		Student student = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			student = session.get(Student.class, studentid);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return student;
	}

	// update student details
	public void updateStudentDetails(String studentid, String fname, String mname, String lname, String address,
			String password, String rollno, String gender, java.sql.Date student_dob, String status) {
		Transaction transaction = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();

			Student student = session.load(Student.class, studentid);
			student.setFirstname(fname);
			student.setMiddlename(mname);
			student.setLastname(lname);
			student.setStudentaddress(address);
			student.setStudentpassword(password);
			student.setRollno(rollno);
			student.setStudentgender(gender);
			student.setStudentdob(student_dob);
			student.setStudentstatus(status);
			session.update(student);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// delete Student
	public Student deleteallStudent(String studentbatch) {
		Transaction transaction = null;
		Student student = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Query q = (Query) session.createQuery("delete Student  WHERE studentbatch= :studentbatch")
					.setParameter("studentbatch", studentbatch);
			q.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return student;
	}

	// delete Student
	public Student deleteStudent(String studentid) {
		Transaction transaction = null;
		Student student = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			student = session.get(Student.class, studentid);
			session.delete(student);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return student;
	}

	// delete batch
	public Batch deletebatch(String batchid) {
		Transaction transaction = null;
		Batch batch = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			batch = session.get(Batch.class, batchid);
			session.delete(batch);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return batch;
	}

	// Adding new exam
	public boolean addexam(Exam exam) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(exam);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// get exam
	public List<Exam> getAllexam(String addedby) {
		Transaction transaction = null;
		List<Exam> ListOfexam = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfexam = session.createQuery("FROM Exam s WHERE s.addedby= :addedby").setParameter("addedby", addedby)
					.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfexam;
	}

	// get exam detail
	public Exam getexamDetails(String examid) {
		Transaction transaction = null;
		Exam exam = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			exam = session.get(Exam.class, examid);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return exam;
	}

	// update exam details
	public void updateExamDetails(String examid, String examtitle, String examduration, String totalQues,
			String markright, String markwrong, String examdesc) {
		Transaction transaction = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Exam exam = session.load(Exam.class, examid);
			exam.setExamtitle(examtitle);
			exam.setExamduration(examduration);
			exam.setTotalQues(totalQues);
			exam.setMarkright(markright);
			exam.setMarkwrong(markwrong);
			exam.setExamdesc(examdesc);
			;

			session.update(exam);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// delete exam
	public Exam deleteexam(String dexamid) {
		Transaction transaction = null;
		Exam exam = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			exam = session.get(Exam.class, dexamid);
			session.delete(exam);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return exam;
	}

	// Adding question
	public boolean addques(Question ques) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(ques);
			System.out.println("=========================================================");
			System.out.println(ques.getOptn1());
			System.out.println(ques.getOptn2());
			System.out.println(ques.getOptn3());
			System.out.println(ques.getOptn4());
			System.out.println(ques.getAns());
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// get question details
	public Question getquesDetails(String quesid) {
		Transaction transaction = null;
		Question ques = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ques = session.get(Question.class, quesid);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ques;
	}

	// get all question
	public List<Question> getAllquestion(String examid) {
		Transaction transaction = null;
		List<Question> ListOfques = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfques = session.createQuery("FROM Question s WHERE s.addedby= :addedby")
					.setParameter("addedby", examid).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfques;
	}

	// get question
	public List<Question> getexamquestion(String examid) {
		Transaction transaction = null;
		List<Question> ListOfques = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfques = session.createQuery("FROM Question s WHERE s.examid= :examid").setParameter("examid", examid)
					.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfques;
	}

	// get questions
	public ArrayList getQuestions(String examid) {
		ArrayList list = new ArrayList();
		Transaction transaction = null;
		Question ques;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			list = (ArrayList) session.createQuery("FROM Question s WHERE s.examid= :examid")
					.setParameter("examid", examid).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return list;
	}

	// delete all question
	public Question deleteallques(String examid) {
		Transaction transaction = null;
		Question ques = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Query q = (Query) session.createQuery("delete Question WHERE examid= :examid").setParameter("examid",
					examid);
			q.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ques;
	}

	// delete question
	public Question deleteques(String quesid) {
		Transaction transaction = null;
		Question ques = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ques = session.get(Question.class, quesid);
			session.delete(ques);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ques;
	}

	// Adding enroll
	public boolean adden(Enroll enroll) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(enroll);
			System.out.println("=========================================================");
			System.out.println(enroll.getEnrollid());
			System.out.println(enroll.getEnstatus());
			System.out.println(enroll.getEnbatchid());
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// list enroll added by
	public List<Enroll> getenroll(String addedby) {
		Transaction transaction = null;
		List<Enroll> ListOfen = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfen = session.createQuery("FROM Enroll s WHERE s.addedby= :addedby").setParameter("addedby", addedby)
					.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfen;
	}

	// list enroll from exam id batch id
	public List<Enroll> enrollValidate(String enexamid, String enbatchid) {
		Transaction transaction = null;
		List<Enroll> ListOfen = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM Enroll s WHERE s.enexamid= :enexamid AND s.enbatchid= :enbatchid";
			Query q = session.createQuery(hql);
			q.setParameter("enexamid", enexamid);
			q.setParameter("enbatchid", enbatchid);
			ListOfen = q.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfen;
	}

	// list enroll from batch id
	public List<Enroll> getenrollbatch(String enbatchid) {
		Transaction transaction = null;
		List<Enroll> ListOfenb = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfenb = session.createQuery("FROM Enroll s WHERE s.enbatchid= :enbatchid")
					.setParameter("enbatchid", enbatchid).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfenb;
	}

	// delete enroll from id
	public Enroll deleteenrol(String enrollid) {
		Transaction transaction = null;
		Enroll en = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			en = session.get(Enroll.class, enrollid);
			session.delete(en);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return en;
	}

	// delete enroll using exam id
	public Enroll deleteenrole(String examid) {
		Transaction transaction = null;
		Enroll en = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Query q = (Query) session.createQuery("delete Enroll WHERE enexamid= :enexamid").setParameter("enexamid",
					examid);
			q.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return en;
	}

	// student login validate
	public boolean studLoginValidate(String semail, String spassword) {
		Transaction transaction = null;
		Student student = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			student = (Student) session.createQuery("FROM Student U WHERE U.studentemailid = :studentemailid")
					.setParameter("studentemailid", semail).uniqueResult();
			if (student != null && student.getStudentpassword().equals(spassword)) {
				return true;
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return false;
	}

	// get student id
	public String getstudId(String email, String password) {
		String id = null;
		Transaction transaction = null;
		Student stud = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			stud = (Student) session.createQuery("FROM Student U WHERE U.studentemailid = :studentemailid")
					.setParameter("studentemailid", email).uniqueResult();
			id = stud.getStudentid();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return id;
	}

	// get student details
	public Student getstudDetails(String id) {
		Transaction transaction = null;
		Student ss = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ss = session.get(Student.class, id);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ss;
	}

	// Adding answer
	public boolean insertAnswer(Answer ans) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(ans);
			System.out.println("=========================================================");
			System.out.println(ans.getMark());
			System.out.println(ans.getOpt());
			System.out.println(ans.getExId());
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// get marks of student from answer table
	public List<Answer> getans(String exId, String sid) {
		Transaction transaction = null;
		List<Answer> anslist = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM Answer s WHERE s.exId= :exId AND s.sid= :sid";
			Query q = session.createQuery(hql);
			q.setParameter("exId", exId);
			q.setParameter("sid", sid);
			anslist = q.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return anslist;
	}

	// list answer from student id and question id
	public List<Answer> ansdouble(String questionid, String sid) {
		Transaction transaction = null;
		List<Answer> anslist = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM Answer s WHERE s.questionid= :questionid AND s.sid= :sid";
			Query q = session.createQuery(hql);
			q.setParameter("questionid", questionid);
			q.setParameter("sid", sid);
			anslist = q.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return anslist;
	}

	// add result
	public boolean insertResult(Result res) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(res);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// list result from student id and exam id
	public List<Result> resdouble(String studid, String examid) {
		Transaction transaction = null;
		List<Result> res = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM Result s WHERE s.studid= :studid AND s.examid= :examid";
			Query q = session.createQuery(hql);
			q.setParameter("studid", studid);
			q.setParameter("examid", examid);
			res = q.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return res;
	}

	// Get result id
	public String getres(String studid, String examid) {
		String id = null;
		Transaction transaction = null;
		Result res = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM Result s WHERE s.studid= :studid AND s.examid= :examid";
			Query q = session.createQuery(hql);
			q.setParameter("studid", studid);
			q.setParameter("examid", examid);
			res = (Result) q.uniqueResult();
			id = res.getResultid();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return id;
	}

	// update result
	public void updatereult(String resultid, String marks, String totalmarks) {
		Transaction transaction = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Result res = session.load(Result.class, resultid);
			res.setMarks(marks);
			res.setTotalmarks(totalmarks);
			session.update(res);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// result list from exam id
	public List<Result> getresultid(String examid) {
		Transaction transaction = null;
		List<Result> Listrid = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Listrid = session.createQuery("FROM Result s WHERE s.examid= :examid").setParameter("examid", examid)
					.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return Listrid;
	}

	// add notice
	public boolean addnotice(Notice no) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(no);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			session.close();
		}
		return result;
	}

	// notice list
	public List<Notice> getnotice(String addedby) {
		Transaction transaction = null;
		List<Notice> ListOfno = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			ListOfno = session.createQuery("FROM Notice s WHERE s.addedby= :addedby").setParameter("addedby", addedby)
					.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return ListOfno;
	}

	// delete Notice
	public Notice delnotice(String noticeid) {
		Transaction transaction = null;
		Notice n = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			n = session.get(Notice.class, noticeid);
			session.delete(n);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return n;
	}

	// delete result from result id
	public Result delresult(String resultid) {
		Transaction transaction = null;
		Result n = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			n = session.get(Result.class, resultid);
			session.delete(n);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return n;
	}

	// Delete Answer where stud id and exam id
	public Answer delans(String sid, String exId) {
		Transaction transaction = null;
		Answer n = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery("delete FROM Answer s WHERE s.sid= :sid AND s.exId= :exId");
			query.setParameter("sid", sid);
			query.setParameter("exId", exId);
			query.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return n;
	}

	// result detail
	public Result resultdetail(String Resultid) {
		Transaction transaction = null;
		Result res = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			res = session.get(Result.class, Resultid);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return res;
	}

	// delete enroll using exam id
	public Result deleteres(String examid) {
		Transaction transaction = null;
		Result en = null;
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Query q = (Query) session.createQuery("delete Result WHERE examid= :examid").setParameter("examid",
					examid);
			q.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return en;
	}
}
