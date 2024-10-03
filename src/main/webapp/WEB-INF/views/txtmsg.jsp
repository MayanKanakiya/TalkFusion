<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="canonical" href="https://rtm.akshatvg.com">
    <link rel="apple-touch-icon" href="assets/img/apple-touch-icon.png" type="image/png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        defer>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="chatFiles/index.css">
    <title>Text Message</title>
    <noscript>Please enable JavaScript to open this page.</noscript>

</head>

<body>
    <!-- Main Div -->
    <div class="p-20">
        <div class="row">
            <!-- Messages -->
            <div class="col s12 m8 offset-m2">
                <div class="grey lighten-4 p-20" id="messageBox">
                    <h5><b>Channel Name:</b> <span id="channelNameBox"></span></h5>
                    <h5><b>Username:</b> <span id="username"></span></h5>
                    <br>
                    <a id="joinChannelBtn" class="btn waves-effect modal-trigger red" href="#joinChannelModal">Join Channel</a>
                    <button id="leaveChannelBtn" class="btn waves-effect red" onclick="leaveChannel();">Leave Channel</button>
                    <!-- Messages will be displayed here -->
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Message Form -->
            <div class="col s12 m8 offset-m2">
                <div class="grey lighten-4 p-20">
                    <label for="channelMsg">Channel Message</label>
                    <textarea placeholder="Type your message here.." id="channelMsg"
                        class="materialize-textarea"></textarea>
                    <button id="sendMsgBtn" class="btn waves-effect red">Send Message</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Channel Join Modal -->
    <div id="joinChannelModal" class="modal">
        <div class="modal-content">
            <h4 class="center">Join Channel</h4>
            <label for="agoraAppId">App ID</label>
            <input type="text" placeholder="App ID" id="agoraAppId" />
            <label for="accountName">User Name</label>
            <input type="text" placeholder="User Name" id="accountName" />
            <label for="channelNameInput">Channel Name</label>
            <input type="text" placeholder="Channel Name" id="channelNameInput" />
        </div>
        <div class="modal-footer">
            <button id="joinChannelBtn" class="modal-close btn waves-effect red">Join Channel</button>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src=" https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/agora-rtm-sdk@1.3.1/index.js"></script>
    <script src="chatFiles/rtm-client.js"></script>

</body>

</html>