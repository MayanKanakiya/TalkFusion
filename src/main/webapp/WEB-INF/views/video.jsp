<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.example.main.entities.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Video Call</title>
<!-- Assuming you have bootstrap.min.css and index.css in your project's static resource folder -->
<link rel="stylesheet" href="videoFiles/bootstrap.min.css">
<link rel="stylesheet" href="videoFiles/index.css">
</head>

<body>
	<%
	User user = (User) session.getAttribute("user");
	%>
	<%
	if (user == null) {
	%>
	 <script>
		window.location.href = "/login";
	</script> 
	<%
	}
	%>
	<!-- Success alert -->
	<div id="success-alert"
		class="alert alert-success alert-dismissible fade show" role="alert">
		<strong>Congratulations!</strong><span> You can invite others
			to join this channel by clicking </span> <a href="/video" target="_blank">here</a>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<!-- Success alert with token -->
	<div id="success-alert-with-token"
		class="alert alert-success alert-dismissible fade show" role="alert">
		<strong>Congratulations!</strong><span> Joined room
			successfully. </span>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<div class="container">
		<form id="join-form">
			<div class="row join-info-group">
				<div class="col-sm">
					<p class="join-info-text">AppID</p>
					<input id="appid" type="text" placeholder="enter appid" required>
					<p class="tips">
						If you don’t know what your appid is, checkout <a
							href="https://docs.agora.io/en/Agora%20Platform/terms?platform=All%20Platforms#a-nameappidaapp-id"
							target="_blank">this</a>
					</p>
				</div>

				<div class="col-sm">
					<p class="join-info-text">Channel</p>
					<input id="channel" type="text" placeholder="enter channel name"
						required>
					<p class="tips">
						If you don’t know what your channel is, checkout <a
							href="https://docs.agora.io/en/Agora%20Platform/terms?platform=All%20Platforms#channel"
							target="_blank">this</a>
					</p>
				</div>
			</div>

			<div class="button-group">
				<button id="join" type="submit" class="btn btn-primary btn-sm">Join</button>
				<button id="leave" type="button" class="btn btn-primary btn-sm"
					disabled>Leave</button>
			</div>
		</form>

		<div class="row video-group">
			<div class="col">
				<p id="local-player-name" class="player-name"></p>
				<div id="local-player" class="player"></div>
			</div>
			<div class="w-100"></div>
			<div class="col">
				<div id="remote-playerlist"></div>
			</div>
		</div>
	</div>

	<!-- Include jQuery and Bootstrap scripts -->
	<script src="videoFiles/jquery-3.4.1.min.js"></script>
	<script src="videoFiles/bootstrap.bundle.min.js"></script>
	<!-- Agora RTC SDK -->
	<script src="videoFiles/AgoraRTC_N-4.22.0.js"></script>
	<script src="videoFiles/index.js"></script>
</body>

</html>
