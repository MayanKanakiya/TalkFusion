// create Agora client for voice only
var client = AgoraRTC.createClient({ mode: "rtc", codec: "vp8" });

var localTracks = {
    audioTrack: null
};
var remoteUsers = {};
// Agora client options
var options = {
    appid: null,
    channel: null,
    uid: null,
    token: null
};

// Automatically join the channel if parameters are in the URL
$(() => {
    var urlParams = new URL(location.href).searchParams;
    options.appid = urlParams.get("appid");
    options.channel = urlParams.get("channel");
    options.token = urlParams.get("token");
    if (options.appid && options.channel) {
        $("#appid").val(options.appid);
        $("#token").val(options.token);
        $("#channel").val(options.channel);
        $("#join-form").submit();
    }
})

$("#join-form").submit(async function(e) {
    e.preventDefault();
    $("#join").attr("disabled", true);
    try {
        options.appid = $("#appid").val();
        options.token = $("#token").val();
        options.channel = $("#channel").val();
        await join();
        if (options.token) {
            $("#success-alert-with-token").css("display", "block");
        } else {
            $("#success-alert a").attr("href", `voice?appid=${options.appid}&channel=${options.channel}&token=${options.token}`);
            $("#success-alert").css("display", "block");
        }
    } catch (error) {
        console.error(error);
    } finally {
        $("#leave").attr("disabled", false);
    }
})

$("#leave").click(function(e) {
    leave();
})

async function join() {

    // Add event listener to play remote audio when a remote user publishes.
    client.on("user-published", handleUserPublished);
    client.on("user-unpublished", handleUserUnpublished);

    // Join a channel and create a local audio track
    [options.uid, localTracks.audioTrack] = await Promise.all([
        // Join the channel
        client.join(options.appid, options.channel, options.token || null),
        // Create local audio track using microphone
        AgoraRTC.createMicrophoneAudioTrack()
    ]);

    // Play local audio track (you won't see any video here since it's voice only)
    localTracks.audioTrack.play("local-player");
    $("#local-player-name").text(`You`);

    // Publish local tracks to the channel
    await client.publish([localTracks.audioTrack]);
    console.log("publish success");
}

async function leave() {
    // Stop and close local tracks
    for (trackName in localTracks) {
        var track = localTracks[trackName];
        if (track) {
            track.stop();
            track.close();
            localTracks[trackName] = undefined;
        }
    }

    // Clear remote users and UI
    remoteUsers = {};
    $("#remote-playerlist").html("");

    // Leave the Agora channel
    await client.leave();

    $("#local-player-name").text("");
    $("#join").attr("disabled", false);
    $("#leave").attr("disabled", true);
    alert("Leave");
    console.log("client leaves channel success");
}

// Handle when a remote user publishes their audio track
function handleUserPublished(user, mediaType) {
    const id = user.uid;
    remoteUsers[id] = user;
    subscribe(user, mediaType);
}

// Handle when a remote user unpublishes their track
function handleUserUnpublished(user) {
    const id = user.uid;
    delete remoteUsers[id];
    $(`#player-wrapper-${id}`).remove();
}

// Subscribe to a remote user's media
async function subscribe(user, mediaType) {
    await client.subscribe(user, mediaType);
    console.log("subscribe success");

    if (mediaType === 'audio') {
        const player = $(`<div id="player-wrapper-${user.uid}">
                            <p class="player-name">RemoteUser(${user.uid})</p>
                            <div id="player-${user.uid}" class="player"></div>
                          </div>`);
        $("#remote-playerlist").append(player);
        user.audioTrack.play(`player-${user.uid}`);
    }
}
