<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SuperAdmin Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	rel="stylesheet" />
<link href="css/superadmin-css.css" rel="stylesheet" />
</head>
<body class="main-bg">
	<div class="login-container text-c animated flipInX">
		<div>
			<h1 class="logo-badge text-whitesmoke">
				<span class="fa fa-user-circle"></span>
			</h1>
		</div>
		<h3 class="text-whitesmoke">SuperAdmin Login</h3>
		<div class="container-content">
			<form class="margin-t" action="superadminauth" method="POST">
				<%-- Error Message Alert Box --%>
				<%
				if (request.getAttribute("error") != null) {
				%>
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<%=request.getAttribute("error")%>
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				}
				%>

				<div class="form-group">
					<input type="text" class="form-control" name="superadminuname"
						placeholder="Username" required>
				</div>
				<div class="form-group my-2">
					<input type="password" class="form-control" name="superadminpass"
						placeholder="*****" required>
				</div>
				<button type="submit" class="form-button button-l margin-b">Login</button>
			</form>
			<p class="margin-t text-whitesmoke">
				<small> TalkFusion &copy; 2024</small>
			</p>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>