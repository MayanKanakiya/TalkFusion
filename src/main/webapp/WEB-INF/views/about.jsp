<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.main.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Page</title>
<style>
.navbar {
	background-color: rgb(49, 60, 89) !important;
}

.full-height {
	height: 110vh;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="vendors/swiper/swiper-bundle.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&amp;family=Rubik:ital,wght@0,300..900;1,300..900family=Rubik:ital,wght@0,300..900;1,300..900&amp;display=swap"
	rel="stylesheet">
<link href="css/theme.min.css" rel="stylesheet" id="style-default">
<link href="css/user-rtl.min.css" rel="stylesheet" id="user-style-rtl">
<link href="css/user.min.css" rel="stylesheet" id="user-style-default">
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>
<body>
	<!-- Navbar Code Start here -->
	<nav class="navbar navbar-expand-md fixed-top" id="navbar"
		data-navbar-soft-on-scroll="data-navbar-soft-on-scroll">
		<div class="container-fluid px-0">
			<a href="/"><img class="navbar-brand w-75 d-md-none"
				src="img/logos/logo.svg" alt="logo" /></a><a
				class="navbar-brand fw-bold d-none d-md-block" href="/">TalkFusion</a>
			<button class="navbar-toggler border-0 pe-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbar-content"
				aria-controls="navbar-content" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-md-end"
				id="navbar-content" data-navbar-collapse="data-navbar-collapse">
				<ul class="navbar-nav gap-md-2 gap-lg-3 pt-x1 pb-1 pt-md-0 pb-md-0"
					data-navbar-nav="data-navbar-nav">
					<li class="nav-item"><a class="nav-link lh-xl" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link lh-xl" href="/about">About
							us</a></li>
					<li style="display: contents">
						<%
						User user = (User) session.getAttribute("user");
						%> <%
 if (user == null) {
 %> <!-- If session exists --> <a
						class="btn btn-primary btn-sm ms-md-x1 mt-lg-0 order-md-1 ms-auto"
						href="/login">Login</a> <a
						class="btn btn-primary btn-sm ms-md-x1 mt-lg-0 order-md-1 ms-auto"
						href="/signup">Signup</a> <%
 } else {
 %> <!-- If session does not exist --> <script>
		window.location.href = "/";
	</script> <%
 }
 %>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar Code end here -->
	<h1 class="text-center mb-4">About Us</h1>
	<div class="container-fluid">
	  <p>Welcome to <strong>TalkFusion</strong>, your all-in-one communication platform designed to simplify and enhance your conversations. Whether it's through video calls, voice messages, or text messages, our platform provides a seamless way to connect with your friends, family, or colleagues from anywhere in the world.</p>
            
            <h3>Our Vision</h3>
            <p>At TalkFusion, our vision is to create an easy-to-use, secure, and reliable communication tool that brings people closer together, no matter the distance. We believe that clear and efficient communication is essential in today’s fast-paced world, and we strive to provide a platform that allows users to stay connected effortlessly.</p>
            
            <h3>What We Offer</h3>
            <ul>
                <li><strong>Video Calling:</strong> Enjoy crystal-clear video communication with your loved ones or business partners.</li>
                <li><strong>Voice Messaging:</strong> Leave voice messages for quick, audio-based communication when time is of the essence.</li>
                <li><strong>Text Messaging:</strong> Send real-time text messages and keep a record of your conversations.</li>
            </ul>
            
            <h3>Why Choose TalkFusion?</h3>
            <ul>
                <li><strong>User-Friendly:</strong> Designed with simplicity in mind, TalkFusion is easy to navigate for users of all ages and tech experience.</li>
                <li><strong>Security:</strong> We take user privacy seriously, ensuring all communications are encrypted and secure.</li>
                <li><strong>Multi-Platform Support:</strong> Access TalkFusion from your desktop or mobile device, giving you the freedom to stay connected on the go.</li>
            </ul>
            
            <h3>Our Commitment</h3>
            <p>We are committed to continuously improving TalkFusion by integrating new features and listening to user feedback. Our dedicated team is always working to provide the best communication experience for our users.</p>
            
            <h3>Get in Touch</h3>
            <p>If you have any questions or need support, feel free to reach out to our customer service team at <strong>support@talkfusion.com</strong>. We are here to assist you 24/7.</p>
            
            <p>Thank you for choosing TalkFusion as your go-to communication platform!</p>
	</div>
	
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"></script>
	<script src="vendors/popper/popper.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.min.js"></script>
	<script src="vendors/is/is.min.js"></script>
	<script src="vendors/countup/countUp.umd.js"></script>
	<script src="vendors/swiper/swiper-bundle.min.js"></script>
	<script src="vendors/lodash/lodash.min.js"></script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="js/theme.js"></script>
</body>
</html>