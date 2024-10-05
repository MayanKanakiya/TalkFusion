package com.example.main.controller;

import java.sql.Timestamp;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.main.dao.UserRepository;
import com.example.main.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @PersistenceContext
    private EntityManager entityManager;

    // Home page handler
    @GetMapping("/")
    public String home() {
        return "home";
    }

    // Login page handler
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // About page handler
    @GetMapping("/about")
    public String about() {
        return "about";
    }

    // History page handler
    @GetMapping("/history")
    public String history() {
        return "history";
    }

    // Profile page handler
    @GetMapping("/profile")
    public String profile() {
        return "profile";
    }

    @GetMapping("/video")
    public String videoCallPage() {
        return "video";
    }

    @GetMapping("/voice")
    public String voiceCallPage() {
        return "voice";
    }

    @GetMapping("/txtmsg")
    public String txtMsgCallPage() {
        return "txtmsg";
    }

    // Signup page handler
    @GetMapping("/signup")
    public String signup() {				
        return "signup";
    }
 // SuperAdmin page handler
    @GetMapping("/talkfusionsuperadmin")
    public String superAdminLogin() {
        return "superadminlogin";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam("username") String username, @RequestParam("email") String email,
                         @RequestParam("pass") String password, Model model) {
        try {
            // Check if username already exists
            int userExists = userRepository.checkUsernameExists(username);

            if (userExists > 0) {
                model.addAttribute("error", "Username already taken, please choose a different one.");
                return "signup";
            }
            // Check if email exists
            if (userRepository.checkEmailExists(email) > 0) {
                model.addAttribute("error", "Email already exists.");
                return "signup";
            }

            // Save the user with null for userIcon
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            int result = userRepository.saveUser(username, email, password, currentTime, null);

            if (result > 0) {
                // Success alert box with Bootstrap
                model.addAttribute("message", "Signup successful! Redirecting to login page...");
                model.addAttribute("alertType", "success");
                return "signup";
            } else {
                model.addAttribute("error", "Failed to register. Please try again.");
                return "signup";
            }

        } catch (Exception e) {
            model.addAttribute("error", "An error occurred. Please try again." + e);
            return "signup";
        }
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email, @RequestParam("pass") String password, Model model,
                            HttpSession session) {

        Optional<User> userOpt = userRepository.findByEmailAndPass(email, password);

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            session.setAttribute("user", user);
            model.addAttribute("message", "Login successful!");
            return "login";
        } else {
            model.addAttribute("error", "Invalid email or password.");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    // New method for updating user profile
    @PostMapping("/updateProfile")
    public String updateProfile(@RequestParam("userIcon") String userIcon, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            user.setUserIcon(userIcon);
            userRepository.save(user); // Use save to update the user entity
            model.addAttribute("message", "Profile updated successfully!");
        }
        return "profile"; // Redirect back to profile page
    }
    @PostMapping("/superadminauth")
    public String superAdminAuth(@RequestParam("superadminuname") String superadminuname, @RequestParam("superadminpass") String superadminpass,Model model,HttpSession session) {
//    	Superadmin pass : xQ!7k%hV2@pG3$gZ9r&J4yA7*n8LsX0
    	
        String correctUsername = "talkfusionadmin";
        String correctPassword = "xQ!7k%hV2@pG3$gZ9r&J4yA7*n8LsX0";
        
        if (superadminuname.equals(correctUsername) && superadminpass.equals(correctPassword)) {
            session.setAttribute("superadmin", correctUsername);
            return "superadminview";
        } else {
            model.addAttribute("error", "Invalid superadmin credentials!");
            return "superadminlogin";
        }
    }
    
}
