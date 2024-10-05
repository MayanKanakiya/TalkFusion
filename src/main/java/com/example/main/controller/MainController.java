package com.example.main.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String superAdminAuth(@RequestParam("superadminuname") String superadminuname,
			@RequestParam("superadminpass") String superadminpass, Model model, HttpSession session) {
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
	@PostMapping("/editProfile")
	public String editProfile(@RequestParam("editEmail") String editEmail, 
	                          @RequestParam(value = "editIcon", required = false) MultipartFile editIcon, 
	                          Model model, HttpSession session) {

	    // Retrieve the User object from the session
	    User sessionUser = (User) session.getAttribute("user");

	    // Check if the session contains a valid user
	    if (sessionUser == null || sessionUser.getUsername() == null) {
	        System.out.println("Session expired or invalid. Redirecting to login.");
	        model.addAttribute("error", "Session expired. Please log in again.");
	        return "login"; // Redirect to login page if session is invalid
	    }

	    // Extract the username from the session User object
	    String username = sessionUser.getUsername();
	    System.out.println("Username from session: " + username);

	    // Fetch the current email and icon for the logged-in user
	    String previousEmail = userRepository.findEmailByUsername(username);
	    String currentIcon = sessionUser.getUserIcon(); // Get the current icon name
	    System.out.println("Previous email: " + previousEmail);
	    
	    String newIconName = null; // Initialize the variable to hold the new icon name

	    // If a new file is uploaded, save it and get the new filename
	    if (editIcon != null && !editIcon.isEmpty()) {
	        try {
	            // Define the directory to save the uploaded image
	            String uploadDir = "src/main/resources/static/img/icons/";

	            // Create the directory if it does not exist
	            Path uploadPath = Paths.get(uploadDir);
	            if (!Files.exists(uploadPath)) {
	                Files.createDirectories(uploadPath);
	            }

	            // Check if there's an existing icon to delete
	            if (currentIcon != null && !currentIcon.isEmpty()) {
	                // Define the path for the old icon
	                Path oldIconPath = uploadPath.resolve(currentIcon);
	                // Delete the old icon file if it exists
	                if (Files.exists(oldIconPath)) {
	                    Files.delete(oldIconPath);
	                    System.out.println("Deleted old icon: " + currentIcon);
	                }
	            }

	            // Generate a unique filename to avoid conflicts
	            newIconName = UUID.randomUUID().toString() + "_" + editIcon.getOriginalFilename();
	            Path filePath = uploadPath.resolve(newIconName);

	            // Save the uploaded file to the directory
	            Files.copy(editIcon.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	            System.out.println("Uploaded new icon: " + newIconName);
	        } catch (IOException e) {
	            e.printStackTrace();
	            model.addAttribute("error", "Error while uploading image. Please try again.");
	            return "/";
	        }
	    }

	    // Update user profile with the new email and icon
	    if (editEmail.equals(previousEmail)) {
	        System.out.println("Emails are the same, proceeding to update icon only.");
	        int updateStatus = userRepository.updateUserProfileByUsername(editEmail, 
	                             newIconName != null ? newIconName : currentIcon, // Use new icon name or keep the old one
	                             username);
	        System.out.println("Update status: " + updateStatus);
	        if (updateStatus > 0) {
	            model.addAttribute("message", "Profile updated successfully!");
	            // Update the session with the new email and icon
	            sessionUser.setEmail(editEmail);
	            if (newIconName != null) {
	                sessionUser.setUserIcon(newIconName); // Update with new icon name
	            }
	            session.setAttribute("user", sessionUser); // Refresh the session
	        } else {
	            model.addAttribute("error", "Profile update failed. Please try again.");
	        }
	    } else {
	        System.out.println("Emails are different, checking if the new email exists.");
	        // Check if the new email exists in the database
	        int emailCount = userRepository.checkEmailExists(editEmail);
	        System.out.println("Email count for new email: " + emailCount);
	        
	        if (emailCount > 0) {
	            model.addAttribute("error", "Email already exists!");
	            return "login"; // Redirect back to edit profile page with error message
	        } else {
	            // Update with the new email and icon
	            System.out.println("Email is unique, proceeding to update email and icon.");
	            int updateStatus = userRepository.updateUserProfileByUsername(editEmail, 
	                                 newIconName != null ? newIconName : currentIcon, 
	                                 username);
	            System.out.println("Update status: " + updateStatus);
	            if (updateStatus > 0) {
	                // Invalidate session and ask the user to log in again after email change
	                session.invalidate(); // Invalidate the session
	                model.addAttribute("message", "Email updated successfully. Please log in again.");
	                return "login"; // Redirect to login page
	            } else {
	                model.addAttribute("error", "Profile update failed. Please try again.");
	            }
	        }
	    }

	    return "redirect:/"; // Redirect back to edit profile page with success or failure message
	}
}
