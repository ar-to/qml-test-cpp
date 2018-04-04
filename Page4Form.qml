import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    GridLayout {
        id: page4Grid
        columns: 1
        anchors.fill: parent

        Button {
            id: button1
            text: "Click to change title"
//            onClicked: updateTitle("This is new!")
        }

        Button {
            id: button2
            text: "Click to send a parammeter"
//            onClicked: walletApp.listener("Parameter1", 234)
        }

//        ListView {
//            id: walletList
//            width: 200
//            height: 100
//            model: walletApp.wallets
//            delegate: Rectangle {
//                width: 200
//                height: 100
//                Text {
//                    text: "Owner: " + model.modelData.owner + ", " + model.modelData.amount + " " + model.modelData.currency + ". Bills: " + model.modelData.count
//                }
//            }
//        }
    }
}
