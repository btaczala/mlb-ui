import QtQuick 2.0

Item {
    width: 100
    height: 62
    ListView {
        anchors.fill: parent
        model: articlesModel
        delegate: Text {
            width: 100
            height: 100
            text:articleTitle
        }
    }
}
