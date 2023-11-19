package com.entity;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Examtable")
public class Exam {
	@Id
	@NotNull
	@Column(name = "examid")
	private String examid;

	@NotNull
	@Column(name = "addedby" )
	private String addedby;

	@NotNull
	@Column(name = "examtitle")
	private String examtitle;
	
	@Column(name = "examdesc")
	private String examdesc;

	@NotNull
	@Column(name = "examduration")
	private String examduration;
	
	@NotNull
	@Column(name = "totalQues")
	private String totalQues;

	@NotNull
	@Column(name = "markright")
	private String markright;

	@NotNull
	@Column(name = "markwrong")
	private String markwrong;

	public String getExamid() {
		return examid;
	}

	public void setExamid(String examid) {
		this.examid = examid;
	}

	public String getAddedby() {
		return addedby;
	}

	public void setAddedby(String addedby) {
		this.addedby = addedby;
	}

	public String getExamtitle() {
		return examtitle;
	}

	public void setExamtitle(String examtitle) {
		this.examtitle = examtitle;
	}

	public String getExamdesc() {
		return examdesc;
	}

	public void setExamdesc(String examdesc) {
		this.examdesc = examdesc;
	}

	public String getExamduration() {
		return examduration;
	}

	public void setExamduration(String examduration) {
		this.examduration = examduration;
	}

	public String getTotalQues() {
		return totalQues;
	}

	public void setTotalQues(String totalQues) {
		this.totalQues = totalQues;
	}

	public String getMarkright() {
		return markright;
	}

	public void setMarkright(String markright) {
		this.markright = markright;
	}

	public String getMarkwrong() {
		return markwrong;
	}

	public void setMarkwrong(String markwrong) {
		this.markwrong = markwrong;
	}

	public Exam(String examid, String addedby, String examtitle, String examdesc, String examduration, String totalQues,
			String markright, String markwrong) {
		super();
		this.examid = examid;
		this.addedby = addedby;
		this.examtitle = examtitle;
		this.examdesc = examdesc;
		this.examduration = examduration;
		this.totalQues = totalQues;
		this.markright = markright;
		this.markwrong = markwrong;
	}

	public Exam() {
		super();
		// TODO Auto-generated constructor stub
	}





	
}
