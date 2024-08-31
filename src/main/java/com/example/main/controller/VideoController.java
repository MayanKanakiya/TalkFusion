package com.example.main.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.main.dao.VideoRepository;
import com.example.main.entities.Video;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/api/video")
public class VideoController {

    @Autowired
    private VideoRepository videoRepository;

    @PostMapping("/save")
    public String saveVideoData(@RequestBody String jsonData) {
        try {
            // Parse the JSON data
            ObjectMapper mapper = new ObjectMapper();
            JsonNode node = mapper.readTree(jsonData);
            String name = node.get("name").asText();
            String usernamesArray = node.get("usernamesArray").toString();
            Timestamp time = new Timestamp(System.currentTimeMillis());

            // Save the video data
            Video video = new Video();
            video.setName(name);
            video.setUsernamesArray(usernamesArray); // Set JSON string
            video.setTime(time);

            videoRepository.save(video);

            return "Video data saved successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "An error occurred: " + e.getMessage();
        }
    }
}
