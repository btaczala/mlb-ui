import QtQuick 2.0

Item {
    width: 100
    height: 62

    signal busy()
    signal finished()
    Rectangle {
        width: 40
        height: 40
        color: "green"
    }
}
