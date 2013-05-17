import QtQuick 2.0
Item {
    width: 100
    height: 100
    property alias text: textItem.text
    id: rootArticleDelegate

    signal articleSelected()

    Item {
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            onClicked: articleSelected()
        }
        Column {
            anchors.fill: parent
            Rectangle {
                color: "white"
                width: parent.width
                height: 1
            }
            Text {
                id: textItem
                text: "Lorem ipsum dolorosa"
                width: parent.width
                height: parent.height-2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Rectangle {
                color: "white"
                width: parent.width
                height: 1
            }
        }
    }
}

