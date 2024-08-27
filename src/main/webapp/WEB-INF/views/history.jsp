<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.main.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>History Page</title>
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
 if (user != null) {
 %>
						<div class="collapse navbar-collapse navbar-nav"
							id="navbarNavDarkDropdown">
							<ul class="navbar-nav">
								<li class="nav-item dropdown">
									<button class="btn btn-dark dropdown-toggle"
										style="background-color: transparent; border: none; text-transform: none;"
										data-bs-toggle="dropdown" aria-expanded="false">
										Hello, ${user.username}</button>
									<ul class="dropdown-menu dropdown-menu-dark">
										<li><a class="dropdown-item" href="/profile">Profile</a></li>
										<li><a class="dropdown-item" href="/logout">Logout</a></li>
									</ul>
								</li>
							</ul>
						</div> <%
 } else {
 %> <script>
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
	<h1 style="margin-top: 80px;">History Page</h1>
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