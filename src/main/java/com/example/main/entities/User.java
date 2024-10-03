package com.example.main.entities;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotEmpty(message = "Username cannot be empty")
	private String username;
	@Email(message = "Email should be valid")
	@NotEmpty(message = "Email cannot be empty")
	private String email;
	@NotEmpty(message = "Password cannot be empty")
	private String pass;
	private Timestamp time;
	private String userIcon;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int id, String username, String email, String pass, Timestamp time,String userIcon) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.pass = pass;
		this.time = time;
		this.userIcon = userIcon;
	}

	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}
