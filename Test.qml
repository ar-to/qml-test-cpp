import QtQuick 2.0

Item {
    Text {
        text: "JS Signal"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.color = 'red'
            }
        }
    }
}
