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
	<!--a0708b6840e942b6ad269acadb1250ab  -->
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
	%>
	<script>
		window.location.href = "/login";
	</script>
	<%
	}
	%>

	<!-- Success alert -->
	<div id="success-alert" class="alert alert-success alert-dismissible fade show" role="alert">
		<strong>Congratulations!</strong><span> You can invite others to join this channel by clicking </span> <a href="#" target="_blank">here</a>
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>

	<!-- Success alert with token -->
	<div id="success-alert-with-token" class="alert alert-success alert-dismissible fade show" role="alert">
		<strong>Congratulations!</strong><span> Joined room successfully. </span>
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>

	<div class="container">
		<form id="join-form" method="POST" action="/video">	
			<div class="row join-info-group">
				<div class="col-sm">
					<h2 class="join-info-text">AppID</h2>
					<input id="appid" type="text" placeholder="Enter appid" required autocomplete="off">
				</div>

				<div class="col-sm">
					<h2 class="join-info-text">Channel</h2>
					<input id="channel" name="channel" type="text" placeholder="Enter channel name" required autocomplete="off">
				</div>
			</div>

			<div class="button-group my-3">
				<button id="join" type="submit" class="btn btn-danger btn-lg">Join</button>
				<button id="leave" type="button" class="btn btn-danger btn-lg" disabled>Leave</button>
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

	<script>
	let usernamesArray = [];

	async function subscribe(user, mediaType) {
		const uid = user.uid;
		await client.subscribe(user, mediaType);
		console.log("subscribe success");
		if (mediaType === 'video') {
			const player = $(`
				<div id="player-wrapper-${uid}">
					<p class="player-name">${user.username}</p>
					<div id="player-${uid}" class="player"></div>
				</div>
			`);
			$("#remote-playerlist").append(player);
			user.videoTrack.play(`player-${uid}`);
		}
		if (mediaType === 'audio') {
			user.audioTrack.play();
		}
		extractPlayerNames();
	}

	function extractPlayerNames() {
		const playerNames = document.querySelectorAll('.player-name');
		usernamesArray = []; // Clear the array before repopulating it
		playerNames.forEach(element => {
			const playerName = element.textContent.trim();
			if (playerName && !usernamesArray.includes(playerName)) {
				usernamesArray.push(playerName);
			}
		});
		alert("Player names: " + usernamesArray.join(', '));
		saveVideoData();
	}

	function saveVideoData() {
		const channelName = document.getElementById('channel').value;

		fetch('/api/video/save', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				name: channelName,
				usernamesArray: usernamesArray,
				time: new Date().toISOString()
			})
		})
		.then(response => response.text())
		.then(data => {
			console.log("Response:", data);
		})
		.catch((error) => {
			console.error('Error:', error);
		});
	}
	</script>
</body>

</html>
