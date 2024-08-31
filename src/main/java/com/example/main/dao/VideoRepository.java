package com.example.main.dao;

import java.sql.Timestamp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.main.entities.Video;

public interface VideoRepository extends JpaRepository<Video, Long> {
	  @Modifying
	    @Transactional
	    @Query(value = "INSERT INTO video (name, usernames_array, time) VALUES (:name, :usernamesArray, :time)", nativeQuery = true)
	    int saveVideo(@Param("name") String name, 
	                  @Param("usernamesArray") String usernamesArray, 
	                  @Param("time") Timestamp time);
}
