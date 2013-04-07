import QtQuick 2.0

Grid {
    columns: 3
    spacing: 5

    RoundedButton {
        id: open
        text: "O"
        width: 25
        height: 25

        // Open function
        onButtonClick: {
            window.openClicked()
        }
    }
    RoundedButton {
        id: url
        text: "U"
        width: 25
        height: 25

        // Open function
        onButtonClick: {
            window.urlClicked()
        }
    }
    RoundedButton {
        id: settings
        text: "S"
        width: 25
        height: 25

        // Open function
        onButtonClick: {
            window.settingsClicked()
        }
    }
    RoundedButton {
        id: equalizer
        text: "E"
        width: 25
        height: 25

        // Open function
        onButtonClick: {
            window.equalizerClicked()
        }
    }
    RoundedButton {
        id: subtitles
        text: "St"
        width: 25
        height: 25

        // Open function
        onButtonClick: {
            window.subtitlesClicked()
        }
    }
    RoundedButton {
        id: playlist
        text: "P"
        width: 25
        height: 25

        // Open function
        onButtonClick: {
            window.playlistClicked()
        }
    }
}
