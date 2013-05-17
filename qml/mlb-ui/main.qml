import QtQuick 2.0

Rectangle {
    id: mainItem
    width: 640
    height: 1280
    color: "grey"
    state: "menuPanelHidden"

    function switchView(appName) {
        console.debug("loading application " + appName)
        appLoader.source = appName;
    }


    function busyAction() {
        topPanel.busyText = "Busy...";

    }

    function busyIsFinishedAction() {
        topPanel.busyText = "";
    }

    function lastView() {
        return "apps/players.qml";
    }

    Component.onCompleted: {
        switchView(lastView())
    }
    Row {

        anchors.fill: parent
        spacing: 5
        // if orientation is vertical
        // menu is shown on the bottom
        MenuPanel {
            id: menuPanelItem
            height: parent.height
            width: 100
            onAppClicked: {
                switchView(appName)
            }
        }

        Item {
            id:mainContainer
            height: parent.height
            width: parent.width - menuPanelItem.width
            Column {
                anchors.fill: parent
                TopPanel {
                    id: topPanel
                    width: parent.width
                    height: 60
                    onApplicationClicked: {
                        if ( mainItem.state === "menuPanelHidden")
                            mainItem.state = "menuPanelShown";
                        else
                            mainItem.state = "menuPanelHidden";
                    }
                }
                Loader {
                    id: appLoader
                    width: parent.width
                    height: parent.height - topPanel.height
                    onLoaded: {
                        console.debug(item);
                        item.onBusy.connect(busyAction);
                        item.onFinished.connect(busyIsFinishedAction);
                    }
                }
            }

            Behavior on width { PropertyAnimation {} }
        }

    }
    states: [
        State {
            name: "menuPanelShown"
            PropertyChanges {
                target: menuPanelItem
                width: 100
            }
        },
        State {
            name: "menuPanelHidden"
            PropertyChanges {
                target: menuPanelItem
                width: 0
            }
        }
    ]
}

