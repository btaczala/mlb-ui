import QtQuick 2.0

Rectangle {
    id: mainItem
    width: 640
    height: 1280
    color: "grey"

    function switchView(appName) {
        console.debug("loading application " + appName)
        appLoader.source = appName;
    }

    function lastView() {
        return "apps/players.qml";
    }

    Component.onCompleted: {
        switchView(lastView())
    }

    Item {
        id:mainContainer
        height: parent.height
        anchors.right: parent.right
        Loader {
            id: appLoader
            anchors.fill: parent
        }
        Behavior on width { PropertyAnimation {} }
    }

    // if orientation is vertical
    // menu is shown on the bottom
    MenuPanel {
        id: menuPanelItem
        maxWidth: mainItem.width/4
        height: parent.height
        hideAfter: 3000

        onAppClicked: {
            switchView(appName)
        }

        onStateChanged: {
            console.debug("State changed" + state);
            if (state==="menuHidden") {
                mainContainer.width = mainItem.width - 20;
                mainContainer.anchors.right = mainItem.right;
            } else {
                mainContainer.width = mainItem.width - menuPanelItem.maxWidth;
            }
        }
    }
}

