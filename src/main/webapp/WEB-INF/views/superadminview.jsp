<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.example.main.entities.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DataTables Example</title>

<!-- Load jQuery first -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Load DataTables CSS and JS after jQuery -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</head>
<body>
	<h1 class="text-center my-3">User Information :</h1>
	<div class="container">
		<table id="usersTable" class="display">
			<thead>
				<tr>
					<th>ID</th>
					<th>Avatar</th>
					<th>Username</th>
					<th>Email</th>
					<th>User Created:</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<!-- Use Expression Language (EL) to loop through the list of users -->
				<%
				List<User> users = (List<User>) request.getAttribute("users");
				if (users != null) {
					for (User user : users) {
				%>
				<tr data-id="<%=user.getId()%>">
					<td><%=user.getId()%></td>
					<td>
						<%
						// Access the request object
						String contextPath = request.getContextPath(); // Use request to get context path
						String userIcon = user.getUserIcon(); // Use getter to access userIcon
						String imageUrl = contextPath + "/img/icons/" + (userIcon != null && !userIcon.isEmpty() ? userIcon : "user.png");
						%> <img src="<%=imageUrl%>" alt="User Icon"
						style="width: 30px; border-radius: 63px;" />
					</td>

					<td><%=user.getUsername()%></td>
					<td><%=user.getEmail()%></td>
					<td><%=user.getTime()%></td>
					<td>
						<button class="get-user-id-btn">Get ID</button>
					</td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>

	</div>

	<script>
		$(document).ready(function() {
			// Initialize the DataTable
			$('#usersTable').DataTable();

			// Attach click event listener to each 'Get ID' button
			$('.get-user-id-btn').on('click', function() {
				// Get the ID of the user from the row's data-id attribute
				var userId = $(this).closest('tr').data('id');
				alert('User ID: ' + userId); // You can use this ID for further actions
			});
		});
		$('#myTable').DataTable({
			"paging" : true, // Enable pagination
			"searching" : true, // Enable search bar
			"pageLength" : 5, // Set number of records per page
			"ordering" : true
		// Enable column sorting
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
