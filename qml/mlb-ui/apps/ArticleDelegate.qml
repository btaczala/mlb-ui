import QtQuick 2.0
Item {
    width: 100
    height: 100
    property alias text: textItem.text
    id: rootArticleDelegate

    signal articleSelected()

    Rectangle {
        anchors.fill: parent
        radius: 5
        color: "green"
        MouseArea {
            anchors.fill: parent
            onClicked: articleSelected()
        }
        Text {
            id: textItem
            text: "Lorem ipsum dolorosa"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }
}

