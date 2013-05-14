import QtQuick 2.0

Item {
    id: rootMenuItem
    property int maxWidth: 100
    width: 100
    height: 62
//    color: "black"
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
                    } else {
                        rootMenuItem.state="menuShown";
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "menuShown"
            PropertyChanges { target: rootMenuItem; width: maxWidth}
            PropertyChanges { target: applicationListView; visible: true}
            PropertyChanges { target: arrowImage; opacity: 1}
        },
        State {
            name: "menuHidden"
            PropertyChanges { target: rootMenuItem; width: 20}
            PropertyChanges { target: applicationListView; visible: false}
            PropertyChanges { target: arrowImage; opacity: 0.3}
        }
    ]
}
