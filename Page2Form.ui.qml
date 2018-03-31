import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 600
    height: 400
    property alias page2Button: page2Button

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }

    Label {
        id: itemLabel
        text: "Item"
        y: 150
    }

    Button {
        id: page2Button
        y: 186
        text: qsTr("Button")
    }

    Connections {
        target: page2Button
        onClicked: print("clicked")
    }
}
