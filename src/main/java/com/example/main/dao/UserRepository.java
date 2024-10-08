package com.example.main.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.main.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    @Modifying
    @Transactional
    @Query(value = "INSERT INTO User (username, email, pass, time, user_icon) VALUES (:username, :email, :password, :time, :userIcon)", nativeQuery = true)
    int saveUser(@Param("username") String username, @Param("email") String email, 
                  @Param("password") String password, @Param("time") Timestamp time,
                  @Param("userIcon") String userIcon); // Add userIcon parameter

    @Query(value = "SELECT COUNT(*) FROM User WHERE username = :username", nativeQuery = true)
    int checkUsernameExists(@Param("username") String username);

    @Query(value = "SELECT COUNT(*) FROM User WHERE email = :email", nativeQuery = true)
    int checkEmailExists(@Param("email") String email);

    @Query("SELECT u FROM User u WHERE u.email = :email AND u.pass = :password")
    Optional<User> findByEmailAndPass(@Param("email") String email, @Param("password") String password);
    
    @Query(value = "SELECT email FROM User WHERE username = :username", nativeQuery = true)
    String findEmailByUsername(@Param("username") String username);

    @Modifying
    @Transactional
    @Query(value = "UPDATE User SET email = :email, user_icon = :userIcon WHERE username = :username", nativeQuery = true)
    int updateUserProfileByUsername(@Param("email") String email, @Param("userIcon") String userIcon, @Param("username") String username);
    
    @Query("SELECT u FROM User u")
    List<User> fetchAllUsers(); 

}
