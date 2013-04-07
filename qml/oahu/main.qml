import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id: window
    width: 500
    height: 400
    // Properties
    property alias videoSource: video.source

    // Signals
    signal openClicked()
    signal urlClicked()
    signal settingsClicked()
    signal equalizerClicked()
    signal subtitlesClicked()
    signal playlistClicked()

    Rectangle {
        id: box
        anchors.fill: parent

        color: "white"

        Rectangle {
            id: rectangle2
            x: 0
            y: 0
            color: "black"
            anchors.fill: parent
            border.color: "white"
            border.width: 5
            VideoWidget {
                id:video
                anchors.fill: parent
                onPositionChanged: {
                    slider.max = duration
                    slider.setValue(position)
                }
            }
        }

        Rectangle {
            id: rectangle1
            y: 325
            height: 75

            color: "white"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            border.color: "white"
            border.width: 0

            // Populate with backward, play/pause and forward buttons
            RoundedButton {
                id: back
                x: 6
                y: 26
                text: "B"
                width: 25
                height: 25
                onButtonHold: {
                    video.position -= 5000
                }
            }
            RoundedButton {
                id: play
                x: 36
                y: 14
                text: "P"
                anchors.leftMargin: 5
                width: 50
                height: 50
                anchors.left: back.right

                onButtonClick: {
                    if (video.playbackState == MediaPlayer.PlayingState)
                        video.pause()
                    else
                        video.play()
                }
            }
            RoundedButton {
                id: next
                x: 86
                y: 26
                text: "N"
                anchors.leftMargin: 5
                width: 25
                height: 25
                anchors.left: play.right
                onButtonHold: {
                    video.position += 5000
                }
            }
            // Slider
            Slider {
                id: slider
                x: 109
                y: 26
                width: 325
                height: 25
                anchors.rightMargin: 6
                // Use higher spacing between button and slider
                anchors.left: next.right
                anchors.right: buttonGrid.left

                onPositionChanged: {
                    //video.position += 500 //value/0.1*100*1000
                }
            }
            ButtonGrid {
                id: buttonGrid
                x: 409
                y: 14
                width: 85
                height: 55
                anchors.rightMargin: 6
                anchors.right: parent.right
            }
        }
    }
}
