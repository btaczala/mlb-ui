import QtQuick 2.0

Item {
    width: 720
    height: 60
    property alias busyText: textField.text
    signal settingsClicked();
    signal applicationClicked();
    Row {
        anchors.fill: parent
        Image {
            id: applicationListIcon
            source: "resources/applications.png"
            width: 32
            height: 32
            anchors.verticalCenter: parent.verticalCenter
            MouseArea {
                anchors.fill: parent
                onClicked: applicationClicked();

            }
        }
        Item {
            width: parent.width - applicationListIcon.width - settingIcon.width - 10
            height: parent.height
            Text {
                id: textField
                anchors.fill: parent
                text: ""
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }
        Image {
            id: settingIcon
            width: 32
            height: 32
            source: "resources/settings.png"
            anchors.verticalCenter: parent.verticalCenter
            MouseArea {
                anchors.fill: parent
                onClicked: settingsClicked();
            }
        }
    }
}
