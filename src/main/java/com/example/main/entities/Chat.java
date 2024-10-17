package com.example.main.entities;  // Ensure this is the correct package

import java.time.format.DateTimeFormatter;
import java.sql.Timestamp;  // Use this import for the Timestamp
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;  // Identifier field

    @Column(name = "channel_name", nullable = false)  // Mapping to the database column
    private String channelName;

    @Column(name = "username_array", columnDefinition = "LONGTEXT", nullable = false)  // Mapping to the database column
    private String usernameArray;  // Assuming this is a comma-separated string

    @Column(name = "current_user", nullable = false)  // Mapping to the database column
    private String currentUser;

    @Column(name = "time", nullable = false)  // Mapping to the database column
    private Timestamp time;  // Use Timestamp directly
    
    public String getFormattedTime() {
        if (time != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss a");
            return time.toLocalDateTime().format(formatter);
        }
        return "No time available";
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getUsernameArray() {
		return usernameArray;
	}

	public void setUsernameArray(String usernameArray) {
		this.usernameArray = usernameArray;
	}

	public String getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
}
