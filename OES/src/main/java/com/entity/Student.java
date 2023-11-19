package com.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Student")
public class Student {
	@Id
	@Column(name = "studentid", nullable = false)
	private String studentid;

	@Column(name = "firstname", nullable = false)
	private String firstname;

	@Column(name = "middlename", nullable = false)
	private String middlename;

	@Column(name = "lastname", nullable = false)
	private String lastname;

	@Column(name = "studentemailid", unique = true, nullable = false)
	private String studentemailid;

	@Column(name = "studentaddress", nullable = false, length = 255)
	private String studentaddress;
	
	@Column(name = "student_password", nullable = false)
	private String studentpassword;

	@Column(name = "phoneno", unique = true, nullable = false)
	private String phoneno;
	
	@Column(name = "rollno", nullable = false)
	private String rollno;

	@Column(name = "studentaddedby", nullable = false)
	private String studentaddedby;
	
	@Column(name = "studentgender", nullable = false)
	private String studentgender;

	@Column(name = "studentdob", nullable = false)
	private Date studentdob;

	@Column(name = "studentbatch", nullable = false)
	private String studentbatch;
	
	@Column(name = "studentstatus", nullable = false)
	private String studentstatus;

	@Column(name = "studentaddedon", nullable = false)
	private Date studentaddedon;

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getStudentemailid() {
		return studentemailid;
	}

	public void setStudentemailid(String studentemailid) {
		this.studentemailid = studentemailid;
	}

	public String getStudentaddress() {
		return studentaddress;
	}

	public void setStudentaddress(String studentaddress) {
		this.studentaddress = studentaddress;
	}

	public String getStudentpassword() {
		return studentpassword;
	}

	public void setStudentpassword(String studentpassword) {
		this.studentpassword = studentpassword;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
	}

	public String getStudentaddedby() {
		return studentaddedby;
	}

	public void setStudentaddedby(String studentaddedby) {
		this.studentaddedby = studentaddedby;
	}

	public String getStudentgender() {
		return studentgender;
	}

	public void setStudentgender(String studentgender) {
		this.studentgender = studentgender;
	}

	public Date getStudentdob() {
		return studentdob;
	}

	public void setStudentdob(Date studentdob) {
		this.studentdob = studentdob;
	}

	public String getStudentbatch() {
		return studentbatch;
	}

	public void setStudentbatch(String studentbatch) {
		this.studentbatch = studentbatch;
	}

	public String getStudentstatus() {
		return studentstatus;
	}

	public void setStudentstatus(String studentstatus) {
		this.studentstatus = studentstatus;
	}

	public Date getStudentaddedon() {
		return studentaddedon;
	}

	public void setStudentaddedon(Date studentaddedon) {
		this.studentaddedon = studentaddedon;
	}

	public Student(String studentid, String firstname, String middlename, String lastname, String studentemailid,
			String studentaddress, String studentpassword, String phoneno, String rollno, String studentaddedby,
			String studentgender, Date studentdob, String studentbatch, String studentstatus, Date studentaddedon) {
		super();
		this.studentid = studentid;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.studentemailid = studentemailid;
		this.studentaddress = studentaddress;
		this.studentpassword = studentpassword;
		this.phoneno = phoneno;
		this.rollno = rollno;
		this.studentaddedby = studentaddedby;
		this.studentgender = studentgender;
		this.studentdob = studentdob;
		this.studentbatch = studentbatch;
		this.studentstatus = studentstatus;
		this.studentaddedon = studentaddedon;
	}

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
