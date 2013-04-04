import QtQuick 2.0

Rectangle {
    id: button
    radius: 300
    border.width: 3

    anchors.leftMargin: 3
    anchors.rightMargin: 3

    Text {
        id: buttonLabel
        anchors.centerIn: parent
    }

    property alias text: buttonLabel.text

    // Status properties
    property bool paused: true

    property color buttonColor: "white"
    property color onHoverColor: "steelblue"
    property color borderColor: "lightblue"

    border.color: borderColor

    signal buttonClick()
    signal buttonHold()

    MouseArea{
        id: buttonMouseArea
        anchors.fill: parent
        onClicked: buttonClick()
        onPressAndHold: buttonHold()
        hoverEnabled: true
        onEntered: parent.border.color = onHoverColor
        onExited:  parent.border.color = borderColor
    }

    //determines the color of the button by using the conditional operator
    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.1) : buttonColor

}
