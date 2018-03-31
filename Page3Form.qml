import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.margins: margin
        GroupBox {
            id: rowBox
            title: "Row layout"
            Layout.fillWidth: true

            RowLayout {
                id: rowLayout
                anchors.fill: parent
                TextField {
                    placeholderText: "This wants to grow horizontally"
                    Layout.fillWidth: true
                }
                Button {
                    text: "Button"
                }
            }
        }

        GroupBox {
            id: rowBox2
            title: "Row layout2"
            Layout.fillWidth: true

            RowLayout {
                id: rowLayout2
                anchors.fill: parent
                TextField {
                    placeholderText: "This wants to grow horizontally"
                    Layout.fillWidth: true
                }
                Button {
                    text: "Button2"
                }
            }
        }
    }

}
