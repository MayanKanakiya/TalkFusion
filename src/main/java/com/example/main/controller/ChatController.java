package com.example.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.main.dao.ChatRepository;

@RestController
@RequestMapping("/chat")
public class ChatController {

	 @Autowired
	    private ChatRepository chatRepository;

	    @PostMapping("/chat/save")
	    public String saveChat(
	            @RequestParam("channelName") String channelName,
	            @RequestParam("usernames") String usernames,
	            @RequestParam("currentUser") String currentUser) {
	        
	        // Save chat data using the repository
	        chatRepository.saveChat(channelName, usernames, currentUser);
	        
	        // Redirect or return a message as needed
	        return "Data stored sucessfully.";  // Adjust to the appropriate page after saving
	    }
}
