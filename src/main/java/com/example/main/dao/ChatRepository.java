package com.example.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.main.entities.Chat;

@Repository
public interface ChatRepository extends JpaRepository<Chat, Integer>  {
	@Modifying
    @Transactional
    @Query(value = "INSERT INTO chat (channel_name, username_array, current_user, time) VALUES (:channelName, :usernameArray, :currentUser, CURRENT_TIMESTAMP)", nativeQuery = true)
    void saveChat(String channelName, String usernameArray, String currentUser);
}
