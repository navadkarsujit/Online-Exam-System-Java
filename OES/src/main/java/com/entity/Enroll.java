package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "enrollTable")
public class Enroll {
	@Id
	@NotNull
	@Column(name = "enrollid")
	private String enrollid;
	
	@NotNull
	@Column(name = "addedby")
	private String addedby;

	@NotNull
	@Column(name = "enexamid" )
	private String enexamid;

	@NotNull
	@Column(name = "enbatchid")
	private String enbatchid;
	
	@NotNull
	@Column(name = "enstatus")
	private String enstatus;

	public String getEnrollid() {
		return enrollid;
	}

	public void setEnrollid(String enrollid) {
		this.enrollid = enrollid;
	}

	public String getAddedby() {
		return addedby;
	}

	public void setAddedby(String addedby) {
		this.addedby = addedby;
	}

	public String getEnexamid() {
		return enexamid;
	}

	public void setEnexamid(String enexamid) {
		this.enexamid = enexamid;
	}

	public String getEnbatchid() {
		return enbatchid;
	}

	public void setEnbatchid(String enbatchid) {
		this.enbatchid = enbatchid;
	}

	public String getEnstatus() {
		return enstatus;
	}

	public void setEnstatus(String enstatus) {
		this.enstatus = enstatus;
	}

	public Enroll(String enrollid, String addedby, String enexamid, String enbatchid, String enstatus) {
		super();
		this.enrollid = enrollid;
		this.addedby = addedby;
		this.enexamid = enexamid;
		this.enbatchid = enbatchid;
		this.enstatus = enstatus;
	}

	public Enroll() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
