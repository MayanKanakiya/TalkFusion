<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.example.main.entities.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Voice Call</title>
    <!-- Bootstrap and custom CSS -->
    <link rel="stylesheet" href="videoFiles/bootstrap.min.css">
    <link rel="stylesheet" href="videoFiles/index.css">
    <style>
        .user-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .user-icon {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 2px solid gray;
        }

        .user-name {
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .speaking {
            animation: blink-border 0.8s infinite;
        }

        @keyframes blink-border {
            0% {
                border-color: red;
            }
            50% {
                border-color: yellow;
            }
            100% {
                border-color: red;
            }
        }
    </style>
</head>

<body>

<%-- Check if the user is logged in --%>
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
    <!-- Remote user icon (image) and username display -->
    <div class="user-container">
        <img class="user-icon" src="img/icons/user.png" alt="Remote User Icon" id="remoteUserIcon">
        <div class="user-name" id="remoteUserName">Remote User</div>
    </div>

    <div class="container">
        <form id="join-form" method="POST" action="/voice">
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
    </div>

    <!-- Include jQuery and Bootstrap scripts -->
    <script src="videoFiles/jquery-3.4.1.min.js"></script>
    <script src="videoFiles/bootstrap.bundle.min.js"></script>
    <!-- Agora RTC SDK -->
    <script src="videoFiles/AgoraRTC_N-4.22.0.js"></script>
    <script>
        let client;
        let localAudioTrack;
        let remoteUserId;

        // Initialize Agora client
        async function initAgoraClient() {
            client = AgoraRTC.createClient({ mode: "rtc", codec: "vp8" });
            await client.join($("#appid").val(), $("#channel").val(), null, null);

            localAudioTrack = await AgoraRTC.createMicrophoneAudioTrack();
            await client.publish([localAudioTrack]);

            $("#join").prop("disabled", true);
            $("#leave").prop("disabled", false);

            // Handle remote user events
            client.on("user-published", async (user, mediaType) => {
                await client.subscribe(user, mediaType);

                if (mediaType === "audio") {
                    const remoteAudioTrack = user.audioTrack;
                    remoteAudioTrack.play();
                    remoteUserId = user.uid;

                    // Display the remote user and animate their icon while speaking
                    $("#remoteUserName").text("Remote User " + remoteUserId);
                    $("#remoteUserIcon").addClass("speaking");

                    // Stop blinking when the user stops speaking
                    client.on("user-unpublished", () => {
                        $("#remoteUserIcon").removeClass("speaking");
                    });
                }
            });
        }

        // Join voice channel
        $("#join").on("click", async function (event) {
            event.preventDefault();
            await initAgoraClient();
        });

        // Leave voice channel
        $("#leave").on("click", async function () {
            localAudioTrack.close();
            await client.leave();
            $("#join").prop("disabled", false);
            $("#leave").prop("disabled", true);
        });
    </script>
</body>

</html>
