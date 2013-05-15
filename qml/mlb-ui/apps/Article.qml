import QtQuick 2.0

Item {
    width: 100
    height: 62
    property var article: null
    property alias articleText: articleTextItem.text
    Text {
        id: articleTextItem
        anchors.fill: parent
        wrapMode: Text.WordWrap
    }
}
