import QtQuick 2.0

Item {
    id: rootMenuItem
    width: 100
    height: 62

    signal appClicked(string appName)

    Row {
        id: applicationsListViewContainer
        anchors.fill: parent
        ListView {
            id: applicationListView
            model: ApplicationsList {}
            spacing: 10
            width: parent.width
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
                            width: {
                                if ( parent.width > 0 )
                                    return 32;
                                else
                                    return 0;
                            }
                            height:  {
                                if ( parent.width > 0 )
                                    return 32;
                                else
                                    return 0;
                            }
                            smooth: true
                            source: "resources/"+appName.toLowerCase() +".png"
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
    }

    Behavior on width {
        PropertyAnimation {}
    }

}
