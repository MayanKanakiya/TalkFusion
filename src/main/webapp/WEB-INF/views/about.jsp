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
					<%
					User user = (User) session.getAttribute("user");
					%>
					<li style="display: contents">
						<%
						if (user == null) {
						%> <!-- If session exists --> <a
						class="btn btn-primary btn-sm ms-md-x1 mt-lg-0 order-md-1 ms-auto"
						href="/login">Login</a> <a
						class="btn btn-primary btn-sm ms-md-x1 mt-lg-0 order-md-1 ms-auto"
						href="/signup">Signup</a> <%
 } else {
 %> <!-- If session does not exist -->
						<div class="collapse navbar-collapse navbar-nav"
							id="navbarNavDarkDropdown">
							<ul class="navbar-nav">
								<li class="nav-item dropdown">
									<button class="btn btn-dark dropdown-toggle"
										style="background-color: transparent; border: none; text-transform: none;"
										text-transform: none;""
										data-bs-toggle="dropdown"
										aria-expanded="false">Hello, ${user.username}</button>
									<ul class="dropdown-menu dropdown-menu-dark">
										<li><a class="dropdown-item" href="#"
											onclick="showAlertEditProfile()">Profile</a></li>
										<li><a class="dropdown-item" href="#"
											onclick="showAlert()">Let's Talk</a></li>
										<li><a class="dropdown-item" href="/history">History</a></li>
										<li><a class="dropdown-item" href="/logout">Logout</a></li>
									</ul>
								</li>
							</ul>
						</div> <%
 }
 %>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<h1 class="modal-title fs-5" id="exampleModalLabel">Let's Talk</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Choose any one of the three and feel
					free to communicate your choice below.</div>
				<div class="modal-footer d-flex justify-content-between">
					<a href="/video" class="btn btn-primary btn-sm"
						style="text-transform: none;">Video Call</a> <a href="/voice"
						class="btn btn-primary btn-sm" style="text-transform: none;">Voice
						Call</a> <a href="/txtmsg" class="btn btn-primary btn-sm"
						style="text-transform: none;">Text Message</a>
				</div>
			</div>
		</div>
	</div>
	
		<!-- User profile Modal -->
		<div class="modal fade" id="editProfileModal" tabindex="-1"
			aria-labelledby="editProfileModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="editProfileModalLabel">Edit
							Your Profile</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="card">
							<div class="card-body py-2 px-md-2">
								<!-- User Logo (Centered) -->
								<div class="d-flex justify-content-center">
									<img src="img/icons/user.png" alt="User Logo"
										class="img-fluid mb-3" width="100">
								</div>

								<!-- Username (Centered) -->
								<div class="d-flex justify-content-center">
									<h4 class="mb-4">${user.username}</h4>
								</div>

								<form method="POST" action="/editProfile" enctype="multipart/form-data">
									<div data-mdb-input-init class="form-outline mb-4">
										<label class="form-label mb-1" for="email">Edit Email:</label>
										<input type="email" id="editEmail" name="editEmail"
											class="form-control" value="${user.email}"
											style="border-color: gray; border-radius: 4px; height: 40px;"
											placeholder="Edit your email id" />
									</div>

									<div data-mdb-input-init class="form-outline mb-4">
										<label class="form-label mb-1" for="editIcon">Edit
											Your Icon:</label> <input type="file" id="editIcon" name="editIcon"
											class="form-control" />
									</div>
								</form>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Edit</button>
					</div>
				</div>
			</div>
		</div>
	

	<!-- Navbar Code end here -->
	<h1 class="text-center" style="margin-top: 80px;">About Us</h1>
	<div class="container-fluid">
		<p>
			Welcome to <strong>TalkFusion</strong>, your all-in-one communication
			platform designed to simplify and enhance your conversations. Whether
			it's through video calls, voice messages, or text messages, our
			platform provides a seamless way to connect with your friends,
			family, or colleagues from anywhere in the world.
		</p>

		<h3>Our Vision</h3>
		<p>At TalkFusion, our vision is to create an easy-to-use, secure,
			and reliable communication tool that brings people closer together,
			no matter the distance. We believe that clear and efficient
			communication is essential in today’s fast-paced world, and we strive
			to provide a platform that allows users to stay connected
			effortlessly.</p>

		<h3>What We Offer</h3>
		<ul>
			<li><strong>Video Calling:</strong> Enjoy crystal-clear video
				communication with your loved ones or business partners.</li>
			<li><strong>Voice Messaging:</strong> Leave voice messages for
				quick, audio-based communication when time is of the essence.</li>
			<li><strong>Text Messaging:</strong> Send real-time text
				messages and keep a record of your conversations.</li>
		</ul>

		<h3>Why Choose TalkFusion?</h3>
		<ul>
			<li><strong>User-Friendly:</strong> Designed with simplicity in
				mind, TalkFusion is easy to navigate for users of all ages and tech
				experience.</li>
			<li><strong>Security:</strong> We take user privacy seriously,
				ensuring all communications are encrypted and secure.</li>
			<li><strong>Multi-Platform Support:</strong> Access TalkFusion
				from your desktop or mobile device, giving you the freedom to stay
				connected on the go.</li>
		</ul>

		<h3>Our Commitment</h3>
		<p>We are committed to continuously improving TalkFusion by
			integrating new features and listening to user feedback. Our
			dedicated team is always working to provide the best communication
			experience for our users.</p>

		<h3>Get in Touch</h3>
		<p>
			If you have any questions or need support, feel free to reach out to
			our customer service team at <strong>support@talkfusion.com</strong>.
			We are here to assist you 24/7.
		</p>

		<p>Thank you for choosing TalkFusion as your go-to communication
			platform!</p>
	</div>
	<script src="vendors/popper/popper.min.js"></script>
	<script>
		function showAlert() {
			var myModal = new bootstrap.Modal(document
					.getElementById('exampleModal'), {
				keyboard : false
			});
			myModal.show();
		}
		function showAlertEditProfile() {
			var myModal = new bootstrap.Modal(document
					.getElementById('editProfileModal'), {
				keyboard : false
			});
			myModal.show();
		}
	</script>
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