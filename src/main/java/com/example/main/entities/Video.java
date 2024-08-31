package com.example.main.entities;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Video {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long channel_id;

	private String name;

	@Column(name = "usernames_array", columnDefinition = "LONGTEXT")
	private String usernamesArray; // Use String to match LONGTEXT type

	private java.sql.Timestamp time;

	public Long getChannel_id() {
		return channel_id;
	}

	public void setChannel_id(Long channel_id) {
		this.channel_id = channel_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsernamesArray() {
		return usernamesArray;
	}

	public void setUsernamesArray(String usernamesArray) {
		this.usernamesArray = usernamesArray;
	}

	public java.sql.Timestamp getTime() {
		return time;
	}

	public void setTime(java.sql.Timestamp time) {
		this.time = time;
	}

}
