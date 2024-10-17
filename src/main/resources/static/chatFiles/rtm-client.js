// Constants
var isLoggedIn = false;
var client; // Moved client to global scope
var channel; // Moved channel to global scope
$("#sendMsgBtn").prop("disabled", true);

// Auto Init MaterializeCSS
M.AutoInit();

// Form Click Event
$("#joinChannelBtn").click(function () {
    var accountName = $('#accountName').val();
    var agoraAppId = $('#agoraAppId').val();

    // Initialize RtmClient
    client = AgoraRTM.createInstance(agoraAppId, {
        enableLogUpload: false
    });

    // Login
    client.login({ uid: accountName }).then(() => {
        console.log('AgoraRTM client login success. Username: ' + accountName);
        isLoggedIn = true;

        // Channel Join
        var channelName = $('#channelNameInput').val();
        channel = client.createChannel(channelName);
        document.getElementById("channelNameBox").innerHTML = channelName;
        document.getElementById("username").innerHTML = accountName;

        channel.join().then(() => {
            console.log('AgoraRTM client channel join success.');
            $("#joinChannelBtn").prop("disabled", true);
            $("#sendMsgBtn").prop("disabled", false);

            // Close Channel Join Modal
            $("#joinChannelModal").modal('close');

            // Display current members
            updateMemberList();

            // Listen for member joined
            channel.on('MemberJoined', function (memberId) {
                console.log(memberId + ' joined the channel');
                updateMemberList();
            });

            // Listen for member left
            channel.on('MemberLeft', function (memberId) {
                console.log(memberId + ' left the channel');
                updateMemberList();
            });

            // Receive Channel Message
            channel.on('ChannelMessage', ({ text }, senderId) => {
                console.log("Message received successfully.");
                console.log("The message is: " + text + " by " + senderId);
                $("#messageBox").append("<br> <b>Sender:</b> " + senderId + "<br> <b>Message: </b> <span style='white-space: pre-wrap;'>" + text + "</span><br>");
            });

            // Send Channel Message
            $("#sendMsgBtn").off('click').on('click', function () {
                var singleMessage = $('#channelMsg').val();
                channel.sendMessage({ text: singleMessage }).then(() => {
                    console.log("Message sent successfully.");
                    console.log("Your message was: " + singleMessage + " by " + accountName);
                    $("#messageBox").append("<br> <b>Sender:</b> " + accountName + "<br> <b>Message: </b> <span style='white-space: pre-wrap;'>" + singleMessage + "</span><br>");
                    $('#channelMsg').val('');
                }).catch(error => {
                    console.log("Message wasn't sent due to an error: ", error);
                });
            });

        }).catch(error => {
            console.log('AgoraRTM client channel join failed: ', error);
        });

    }).catch(err => {
        console.log('AgoraRTM client login failure: ', err);
    });
});

// Function to update the member list
function updateMemberList() {
    channel.getMembers().then(function(memberIds) {
        var memberList = memberIds.join(', ');
        $("#memberList").html("<b>Members in Channel:</b> " + memberList);
    }).catch(err => {
        console.log('Error getting members: ', err);
    });
}

// Show Form on Page Load
$(document).ready(function () {
    $('#joinChannelModal').modal();
    $("#joinChannelModal").modal('open');
});

// Logout
function leaveChannel() {
    channel.leave();
    client.logout();
    isLoggedIn = false;
    $("#joinChannelBtn").prop("disabled", false);
    $("#sendMsgBtn").prop("disabled", true);
    $("#joinChannelModal").modal('open');
    console.log("Channel left successfully and user has been logged out.");
    // Clear member list
    $("#memberList").html("");
}
