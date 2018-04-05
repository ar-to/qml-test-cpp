import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Row {
    id: page5Row1
    spacing: 2
//    Rectangle { color: "red"; width: 50; height: 50 }
    Rectangle {
//        width: 180;
        width: parent.width/3
        height: 100;
        color: "red";
        ListView {
//            width: 180;
            width: parent.width
            height: 100

            model: Page5ListModel{}
            delegate: Text {
                text: name + ": " + number
            }
        }
    }

    Rectangle {
//        width: 180;
        width: parent.width/3
        height: 100
        color: "green";
        ListView {
//            width: 180;
            width: parent.width
            height: 100

            model: Page5ListModel{}
            delegate: Text {
                text: name + ": " + number
            }
        }
    }

    Rectangle {
//        width: 180;
        width: parent.width/3
//        height: 200
        height: parent.height / 2
        color: 'teal'

        Component {
            id: contactDelegate
            Item {
//                width: 180;
                width: parent.width
                height: 60
                Column {
                    Text { text: '<b>Name:</b> ' + name }
                    Text { text: '<b>Number:</b> ' + number }
                    Button {
                        id: control
//                        text: qsTr("Button")
                        font.pointSize: 16
                        height: 20
                        focus: true
                        text: activeFocus ? "I have active focus!" : "I do not have active focus"
                    }
                }
            }
        }

        ListView {
            id: page5List
            anchors.fill: parent
            model: Page5ListModel {}
            delegate: contactDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }

        Rectangle {
            anchors.top: page5List.bottom
            height: parent.height / 2
            width: parent.width
            color: "yellow"
            ColumnLayout {
                spacing: 2
                Text {
                    Layout.preferredHeight: 40
                    anchors.centerIn: parent
                    text: activeFocus ? "I have active focus!" : "I do not have active focus"
                }
                Text {
                    Layout.alignment: Qt.AlignBottom
                    anchors.centerIn: parent
                    text: parent.height
                }
            }
        }
    }

//    Rectangle { color: "green"; width: 20; height: 50 }
//    Rectangle { color: "blue"; width: 50; height: 20 }
}

//ListView {
//    width: 180; height: 200

//    model: Page5ListModel{}
//    delegate: Text {
//        text: name + ": " + number
//    }
//}

//Rectangle {
//    width: 180;
//    height: 200
////    height: parent.height / 3
//    color: 'teal'

//    Component {
//        id: contactDelegate
//        Item {
//            width: 180; height: 40
//            Column {
//                Text { text: '<b>Name:</b> ' + name }
//                Text { text: '<b>Number:</b> ' + number }
//            }
//        }
//    }

//    ListView {
//        id: page5List
//        anchors.fill: parent
//        model: Page5ListModel {}
//        delegate: contactDelegate
//        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
//        focus: true
//    }

//    Text {
//        anchors.top: page5List.bottom
//        text: activeFocus ? "I have active focus!" : "I do not have active focus"
//    }

//}

//ListView {
//    width: 180; height: 200

//    Component {
//        id: contactsDelegate
//        Rectangle {
//            id: wrapper
//            width: 180
//            height: contactInfo.height
//            color: ListView.isCurrentItem ? "black" : "red"
//            Text {
//                id: contactInfo
//                text: name + ": " + number
//                color: wrapper.ListView.isCurrentItem ? "red" : "black"
//            }
//        }
//    }

//    model: Page5ListModel {}
//    delegate: contactsDelegate
//    focus: true
//}
