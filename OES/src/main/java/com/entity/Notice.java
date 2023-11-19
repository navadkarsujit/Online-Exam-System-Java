package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "NoticeTable")
public class Notice {
	@Id
	@NotNull
	@Column(name = "noticeid")
	private String noticeid;

	@NotNull
	@Column(name = "addedby" )
	private String addedby;

	@Column(name = "noticetitle")
	private String noticetitle;

	@Column(name = "description")
	private String description;

	public String getNoticeid() {
		return noticeid;
	}

	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}

	public String getAddedby() {
		return addedby;
	}

	public void setAddedby(String addedby) {
		this.addedby = addedby;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Notice(String noticeid, String addedby, String noticetitle, String description) {
		super();
		this.noticeid = noticeid;
		this.addedby = addedby;
		this.noticetitle = noticetitle;
		this.description = description;
	}

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
