package com.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "batchtable")
public class Batch {
	@Id
	@NotNull
	@Column(name = "batchid")
	private String batchid;

	@NotNull
	@Column(name = "batchname")
	private String batchname;

	@NotNull
	@Column(name = "addedby")
	private String addedby;

	@NotNull
	@Column(name = "date")
	private Date addeddate;

	public String getBatchid() {
		return batchid;
	}

	public void setBatchid(String batchid) {
		this.batchid = batchid;
	}

	public String getBatchname() {
		return batchname;
	}

	public void setBatchname(String batchname) {
		this.batchname = batchname;
	}

	public String getAddedby() {
		return addedby;
	}

	public void setAddedby(String addedby) {
		this.addedby = addedby;
	}

	public Date getAddeddate() {
		return addeddate;
	}

	public void setAddeddate(Date addeddate) {
		this.addeddate = addeddate;
	}

	public Batch(String batchid, String batchname, String addedby, Date addeddate) {
		super();
		this.batchid = batchid;
		this.batchname = batchname;
		this.addedby = addedby;
		this.addeddate = addeddate;
	}

	public Batch() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
