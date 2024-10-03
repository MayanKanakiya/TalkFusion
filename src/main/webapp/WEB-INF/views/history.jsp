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

.accordion {
	border-top: 5px solid #d568 !important;
}

::placeholder {
	color: gray !important; /* Change this to your desired color */
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
										<li><a class="dropdown-item" href="#"
											onclick="showAlertEditProfile()">Profile</a></li>
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
	<div class="accordion" id="accordionExample" style="margin-top: 75px;">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">Video
					History</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<table class="table  table-striped">
						<thead>
							<tr>
								<th scope="col">Srno</th>
								<th scope="col">Channel Name</th>
								<th scope="col">Communicate User</th>
								<th scope="col">Time</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Friends</td>
								<td>Mayank,Ram</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Friends</td>
								<td>Ram,Sita</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Friends</td>
								<td>Mayank,Raj</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>Friends</td>
								<td>Mayank,Rohan</td>
								<td>26-09-2024</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="false" aria-controls="collapseTwo">Voice
					History</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<table class="table  table-striped">
						<thead>
							<tr>
								<th scope="col">Srno</th>
								<th scope="col">Channel Name</th>
								<th scope="col">Communicate User</th>
								<th scope="col">Time</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Friends</td>
								<td>Mayank,Ram</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Friends</td>
								<td>Ram,Sita</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Friends</td>
								<td>Mayank,Raj</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>Friends</td>
								<td>Mayank,Rohan</td>
								<td>26-09-2024</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree"
					aria-expanded="false" aria-controls="collapseThree">Chat
					History</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<table class="table  table-striped">
						<thead>
							<tr>
								<th scope="col">Srno</th>
								<th scope="col">Channel Name</th>
								<th scope="col">Communicate User</th>
								<th scope="col">Time</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Friends</td>
								<td>Mayank,Ram</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Friends</td>
								<td>Ram,Sita</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Friends</td>
								<td>Mayank,Raj</td>
								<td>26-09-2024</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>Friends</td>
								<td>Mayank,Rohan</td>
								<td>26-09-2024</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<section class="container full-height">
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

								<form method="POST" action="/">
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
	</section>
	<script>
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