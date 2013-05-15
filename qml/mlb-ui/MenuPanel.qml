import QtQuick 2.0

Item {
    id: rootMenuItem
    property int maxWidth: 100
    property alias hideAfter: hideTimer.interval
    width: 100
    height: 62
    state: "menuHidden"

    signal appClicked(string appName)

    Row {
        id: applicationsListViewContainer
        anchors.fill: parent
        ListView {
            id: applicationListView
            model: ApplicationsList {}
            spacing: 10
            width: parent.width - 16
            height: parent.height
            delegate: Rectangle {
                width: applicationListView.width
                height: 60
                color:"yellow"
                MouseArea {
                    width: parent.width
                    height: parent.height - 8
                    anchors.verticalCenter: parent.verticalCenter
                    Column{
                        anchors.fill: parent

                        Image {
                            width: 32
                            height: 32
                            source: "resources/"+appName.toLowerCase() +".png"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            text:appName
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    onClicked: {
                        console.debug("Clicked" + appName)
                        appClicked("apps/"+appName.toLowerCase()+".qml")
                        if ( hideTimer.running === true) {
//                            hideTimer.restart();
                        }
                    }
                }
            }
        }
        Image {
            id: arrowImage
            source: "resources/arrow.svg"
            width: 32
            height: 32
            anchors.verticalCenter: parent.verticalCenter
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (rootMenuItem.state==="menuShown" ) {
                        rootMenuItem.state="menuHidden";
//                        hideTimer.stop();
                    } else {
                        rootMenuItem.state="menuShown";
//                        hideTimer.start();
                    }
                }
            }
        }
    }

    Timer {
        id: hideTimer
        running: false
        onTriggered: {
            rootMenuItem.state = "menuHidden";
        }
    }

    Behavior on width {
        PropertyAnimation {}
    }

    states: [
        State {
            name: "menuShown"
            PropertyChanges { target: rootMenuItem; width: maxWidth}
            PropertyChanges { target: arrowImage; opacity: 1}
        },
        State {
            name: "menuHidden"
            PropertyChanges { target: rootMenuItem; width: 20}
            PropertyChanges { target: arrowImage; opacity: 0.3}
        }
    ]
}
