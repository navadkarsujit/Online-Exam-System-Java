package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "AnswerTable")
public class Answer {
	@Id
	@NotNull
	@Column(name = "ansid")
	private String ansid;

	@NotNull
	@Column(name = "sid")
	private String sid;

	
	@NotNull
	@Column(name = "exId")
	private String exId;

	@NotNull
	@Column(name = "questionid" )
	private String questionid;

	@NotNull
	@Column(name = "opt")
	private String opt;

	@NotNull
	@Column(name = "mark")
	private String mark;

	public String getAnsid() {
		return ansid;
	}

	public void setAnsid(String ansid) {
		this.ansid = ansid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getExId() {
		return exId;
	}

	public void setExId(String exId) {
		this.exId = exId;
	}

	public String getQuestionid() {
		return questionid;
	}

	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Answer(String ansid, String sid, String exId, String questionid, String opt, String mark) {
		super();
		this.ansid = ansid;
		this.sid = sid;
		this.exId = exId;
		this.questionid = questionid;
		this.opt = opt;
		this.mark = mark;
	}

	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
