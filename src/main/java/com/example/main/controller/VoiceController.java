package com.example.main.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.main.dao.VoiceRepository;
import com.example.main.entities.User;
import com.example.main.entities.Voice;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/voice")
public class VoiceController {

    @Autowired
    private VoiceRepository voiceCallRepository; // Use your correct repository

    @Autowired
    private HttpSession httpSession; // For session management

    @PostMapping("/save")
    public String saveVoiceDetails(@RequestParam("channel") String channel) {
        try {
        	System.out.println("Inside saveVoiceDetails method"); 
            // Fetch the logged-in user from the session
            User currentUser = (User) httpSession.getAttribute("user");
            String currentUsername = currentUser != null ? currentUser.getUsername() : "DefaultUser"; // Default username

            // Debugging logs
            System.out.println("Channel: " + channel);
            System.out.println("Current User: " + currentUsername);

            // Capture the current timestamp
            Timestamp time = new Timestamp(System.currentTimeMillis());
            System.out.println("Current Time: " + time);

            // Create a new VoiceCall object
            Voice voiceCall = new Voice();
            voiceCall.setName(channel);
            voiceCall.setUsername("[" + currentUsername + "]"); // Store as a JSON string or other format as needed
            voiceCall.setTime(time); // Set the current time

            // Save the VoiceCall object in the database
            voiceCallRepository.save(voiceCall);
            System.out.println("VoiceCall object saved: " + voiceCall);

            return "Voice data saved successfully!";
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for any exception
            return "An error occurred: " + e.getMessage();
        }
    }
}
