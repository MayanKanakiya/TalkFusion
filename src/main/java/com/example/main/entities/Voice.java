package com.example.main.entities;

import java.time.format.DateTimeFormatter;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Voice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long channel_id;

    private String name;

    @Column(name = "usernames_array", columnDefinition = "LONGTEXT")
    private String usernamesArray;

    private java.sql.Timestamp time;

    private String username; // Add this line for the username

    // Getters and Setters
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

    public String getUsername() { // Getter for username
        return username;
    }

    public void setUsername(String username) { // Setter for username
        this.username = username;
    }

    // Method to format the time as per your requirement
    public String getFormattedTime() {
        if (time != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss a");
            return time.toLocalDateTime().format(formatter);
        }
        return "No time available";
    }
}
