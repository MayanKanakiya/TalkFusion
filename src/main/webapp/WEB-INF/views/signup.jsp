<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.main.entities.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
<style>
.navbar {
	background-color: rgb(49, 60, 89) !important;
}

.loginLink {
	background-color: blue;
	color: blue !important;
	text-decoration: underline !important;
}

.form-outline {
	padding: 10px !important;
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
	<!-- Login Code Start here -->
	<!-- Section: Design Block -->
	<section class="container full-height">
		<!-- Jumbotron -->

		<div class="px-4 py-2 px-md-5 text-center text-lg-start"
			style="background-color: hsl(0, 0%, 96%); border-radius: 1rem;">
			<div class="container">
				<div class="row gx-lg-5 align-items-center">
					<div class="col-lg-6 mb-5 mb-lg-0">
						<h1 class="my-5 display-3 fw-bold ls-tight">
							<span class="text-primary">Signup</span>
						</h1>
						<p style="color: hsl(217, 10%, 50.8%)">Join TalkFusion today
							and connect with the world in a whole new way.</p>
					</div>

					<div class="col-lg-6 mb-5 mb-lg-0">
						<div class="card">
							<div class="card-body py-5 px-md-5">
								<form method="POST" action="/signup">
									<%
									if (request.getAttribute("message") != null) {
									%>
									<div class="alert alert-success alert-dismissible fade show"
										role="alert">
										<%=request.getAttribute("message")%>
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
									<script>
										setTimeout(function() {
											window.location.href = "/login";
										}, 3000); // Redirect to login after 3 seconds
									</script>
									<%
									}
									%>

									<%
									if (request.getAttribute("error") != null) {
									%>
									<div class="alert alert-danger alert-dismissible fade show"
										role="alert">
										<%=request.getAttribute("error")%>
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
									<%
									}
									%>

									<!-- Username input -->
									<div data-mdb-input-init class="form-outline mb-4">
										<input type="text" id="username" name="username"
											class="form-control" required="required" /> <label
											class="form-label" for="username">Username</label>
									</div>
									<!-- Email input -->
									<div data-mdb-input-init class="form-outline mb-4">
										<input type="email" id="email" name="email"
											class="form-control" required="required" /> <label
											class="form-label" for="email">Email address</label>
									</div>

									<!-- Password input -->
									<div data-mdb-input-init class="form-outline mb-4">
										<input type="password" id="pass" name="pass"
											class="form-control" required="required" /> <label
											class="form-label" for="pass">Password</label>
									</div>

									<!-- Submit button -->
									<button type="submit"
										class="btn-block btn btn-primary btn-sm order-md-1 ms-auto">Signup</button>

									<!-- Register buttons -->
									<div class="text-center my-2">
										<p>
											If you already have an account, then.<a
												class="nav-link lh-xl loginLink" href="/login">Login</a>.
										</p>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Jumbotron -->
	</section>
	<!-- Section: Design Block -->
	<!-- Login Code end here -->
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