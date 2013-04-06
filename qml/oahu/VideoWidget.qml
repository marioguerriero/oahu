import QtQuick 2.0
import QtMultimedia 5.0

Video {
    id: video
    width: 300
    height: 262

    autoPlay: true

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (playbackState == MediaPlayer.PlayingState)
                pause()
            else
                play()
        }
    }

    focus: true
    Keys.onSpacePressed: video.paused = !video.paused
    Keys.onLeftPressed: video.position -= 5000
    Keys.onRightPressed: video.position += 5000

    function setSource(s) {
        pause()
        source: s
    }
}
