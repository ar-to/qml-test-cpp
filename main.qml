import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QmlProperties 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    property int margin: 11
//    title: qsTr("Tabs")
    title: qmlProperty.name
    property int someNumber: 100
    function myQmlFunction(msg) {
        console.log("Got message:", msg)
        return "some return value"
    }

    property color mainTextCOlor: "green"

    QmlProperty {
        id: qmlProperty
        text: "QML signal and Property"
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            ColumnLayout {
                id: page1Column
                width: parent.width
                spacing: 2

                Test {
                    y:50
                }

                Text {
                    id:page1Text
    //                x: 30
    //                anchors.left: parent
                    anchors.topMargin: 10
    //                text: "Signal handler"
                    text: qmlProperty.name
                    Component.onCompleted: {
                        page1Text.color = "red"
                    }
                }

                Text {
                    id:item
                    x: 150
    //                text: "QML signal"
                    text: qmlProperty.text
                    objectName: "page1Item"

                    signal qmlSignal(string msg)

                    MouseArea {
                        anchors.fill: parent
                        onClicked: item.qmlSignal("Hello from QML")
                    }
                }
            }

            ColumnLayout {
                width: parent.width
                anchors.top: page1Column.bottom
                spacing: 15
                Text {
                    text: "offlineStoragePath: " + offlineStoragePath
//                    anchors.top: page1Column.bottom
                    color: mainTextColor
                }

                Text {
                    text: "QStandardPaths: " + appDataLocation
                }

                Button {
                    height: 10
                    focus: true
                    text: activeFocus ? "I have active focus!" : "I do not have active focus"
                    Keys.onPressed: {
                        if (event.key === Qt.Key_A) {
                            console.log('Key A was pressed');
                            event.accepted = true;
                        }
                    }
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        color: button.down ? "#d6d6d6" : "#f6f6f6"
                        border.color: "#26282a"
                        border.width: 1
                        radius: 4
                    }
                }
            }

            Button {
                y: 100
                objectName: "page1Button1"
                text: "Button"
                onClicked: qmlProperty.changeText("Text Changed")
            }

            Button {
                y: 150
                text: "Http Button"
                objectName: "httpButton"
                onClicked: qmlProperty.getRequest("https://jsonplaceholder.typicode.com/posts/2")
            }

            Button {
                y: 200
                text: "add Setting"
                onClicked: qmlProperty.newSetting("setting1", 10)
            }

            Button {
                y: 240
                text: "get Setting"
                onClicked: qmlProperty.getSetting("setting1")
            }
        }

        Page2Form {
            RowLayout {
                width: parent.width
                spacing: 6

                Rectangle {
                    color: 'teal'
                    Layout.fillWidth: true
                    Layout.minimumWidth: 50
                    Layout.preferredWidth: 100
                    Layout.maximumWidth: 300
                    Layout.minimumHeight: 150
                    Text {
                        anchors.centerIn: parent
                        text: parent.width + 'x' + parent.height
                    }
                }
                Rectangle {
                    color: 'plum'
                    Layout.fillWidth: true
                    Layout.minimumWidth: 100
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 100
                    Text {
                        anchors.centerIn: parent
                        text: parent.width + 'x' + parent.height
                    }
                }
            }
        }

        Page3Form {

        }

        Page4Form {

        }

        Page5Form {

        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
        TabButton {
            text: qsTr("Page 3")
        }   
        TabButton {
            text: qsTr("Page 4")
        }
        TabButton {
            text: qsTr("Page 5")
        }
    }
}
