package com.example.main.dao;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.main.entities.Voice;

public interface VoiceRepository extends JpaRepository<Voice, Long> {
    
    @Modifying
    @Transactional
    @Query(value = "INSERT INTO voice (name, usernames_array, time, user) VALUES (:name, :usernamesArray, :time, :user)", nativeQuery = true)
    int saveVoice(@Param("name") String name,
                  @Param("usernamesArray") String usernamesArray,
                  @Param("time") Timestamp time,
                  @Param("user") String user);

    @Query("SELECT v FROM Voice v INNER JOIN User u ON u.username = v.username") // Adjusted to use entity names
    List<Voice> fetchAllVoiceLogs();
}
