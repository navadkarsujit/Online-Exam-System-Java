package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Questiontable")
public class Question {
	@Id
	@NotNull
	@Column(name = "quesid")
	private String quesid;
	
	@NotNull
	@Column(name = "examid")
	private String examid;

	@NotNull
	@Column(name = "ques" ,length = 255)
	private String ques;

	@Column(name = "qdesc" ,length = 255)
	private String qdesc;
	
	@NotNull
	@Column(name = "optn1")
	private String optn1;

	@NotNull
	@Column(name = "optn2")
	private String optn2;
	
	@Column(name = "optn3")
	private String optn3;
	
	@Column(name = "optn4")
	private String optn4;

	@NotNull
	@Column(name = "ans" )
	private String ans;
	
	@NotNull
	@Column(name = "addedby")
	private String addedby;

	public String getQdesc() {
		return qdesc;
	}

	public void setQdesc(String qdesc) {
		this.qdesc = qdesc;
	}

	public String getQuesid() {
		return quesid;
	}

	public void setQuesid(String quesid) {
		this.quesid = quesid;
	}

	public String getExamid() {
		return examid;
	}

	public void setExamid(String examid) {
		this.examid = examid;
	}

	public String getQues() {
		return ques;
	}

	public void setQues(String ques) {
		this.ques = ques;
	}

	public String getOptn1() {
		return optn1;
	}

	public void setOptn1(String optn1) {
		this.optn1 = optn1;
	}

	public String getOptn2() {
		return optn2;
	}

	public void setOptn2(String optn2) {
		this.optn2 = optn2;
	}

	public String getOptn3() {
		return optn3;
	}

	public void setOptn3(String optn3) {
		this.optn3 = optn3;
	}

	public String getOptn4() {
		return optn4;
	}

	public void setOptn4(String optn4) {
		this.optn4 = optn4;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

	public String getAddedby() {
		return addedby;
	}

	public void setAddedby(String addedby) {
		this.addedby = addedby;
	}

	public Question(String quesid, String examid, String ques, String qdesc, String optn1, String optn2, String optn3,
			String optn4, String ans, String addedby) {
		super();
		this.quesid = quesid;
		this.examid = examid;
		this.ques = ques;
		this.qdesc = qdesc;
		this.optn1 = optn1;
		this.optn2 = optn2;
		this.optn3 = optn3;
		this.optn4 = optn4;
		this.ans = ans;
		this.addedby = addedby;
	}

	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
