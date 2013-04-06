import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id: window
    width: 360
    height: 360
    // Properties
    property alias videoSource: video.source

    // Signals
    signal openClicked()

    Rectangle {
        id: box
        x: 0
        y: 0
        width: 381
        height: 360
        anchors.fill: parent

        color: "white"
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: -21

        Rectangle {
            id: rectangle2
            width: window.width - 15
            height: window.height - 15
            //border.width: 5
            color: "black"
            anchors.fill: parent
            VideoWidget {
                id:video
                anchors.bottomMargin: 50
                anchors.fill: parent
                onPositionChanged: slider.setValue(position/1000/100*0.1)
            }
        }

        Rectangle {
            id: rectangle1
            anchors.bottom: parent.bottom
            width: parent.width
            height: 50

            color: "white"
            anchors.bottomMargin: 0
            border.color: "white"
            border.width: 5

            // Populate with backward, play/pause and forward buttons
            RoundedButton {
                id: back
                x: 6
                y: 13
                text: "B"
                width: 25
                height: 25
                anchors.left: text.right
                onButtonHold: {
                    video.position -= 5000
                }
            }
            RoundedButton {
                id: play
                text: "P"
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
                x: 75
                y: 13
                text: "N"
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
                x: 112
                y: 14
                width: 194
                height: 24
                anchors.verticalCenterOffset: 1
                value: 0
                transformOrigin: Item.Center
                anchors.verticalCenter: parent.verticalCenter
                // Use higher spacing between button and slider
                anchors.left: next.right

                onPositionChanged: {
                    //video.position += 500 //value/0.1*100*1000
                }
            }
            RoundedButton {
                id: open
                x: 310
                y: 1
                text: "O"
                anchors.leftMargin: 2
                width: 50
                height: 50
                // Use higher spacing between button and slider
                anchors.left: slider.right

                // Open function
                onButtonClick: {
                    openClicked()
                }
            }
        }
    }
}
