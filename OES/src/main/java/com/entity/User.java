package com.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.helper.RandomIdGenerator;

@Entity
@Table(name = "usertable")
public class User {
	@Id
	@NotNull
	@Column(name = "id")
	private String id;

	@NotNull
	@Column(name = "username")
	private String username;

	@NotNull
	@Column(name = "email", unique = true)
	private String email;

	@NotNull
	@Column(name = "phone_no",unique = true)
	private String phone_no;

	@NotNull
	@Column(name = "password")
	private String password;

	@NotNull
	@Column(name = "date")
	private Date created_Date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreated_Date() {
		return created_Date;
	}

	public void setCreated_Date(Date created_Date) {
		this.created_Date = created_Date;
	}

	public User(String id, String username, String email, String phone_no, String password, Date created_Date) {
		super();
		this.id = RandomIdGenerator.generateRandomString();
		this.username = username;
		this.email = email;
		this.phone_no = phone_no;
		this.password = password;
		this.created_Date = created_Date;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

}
