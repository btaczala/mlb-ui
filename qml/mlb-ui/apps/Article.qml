import QtQuick 2.0

Item {
    width: 300
    height: 300
    property var article: null
    property alias articleText: articleTextItem.text
    property alias articleHeader: articleHeaderTextItem.text
    Column {
        anchors.fill: parent
        Text {
            id: articleHeaderTextItem
            text: "Some header text"
            height: parent.height /5
            width: parent.width

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Flickable{
            width: parent.width
            height: parent.height - articleHeaderTextItem.height
            contentHeight: articleTextItem.height
//            contentWidth: articleTextItem.width
            flickableDirection: Flickable.VerticalFlick
            clip: true
            Text {
                id: articleTextItem
                width: parent.width
                wrapMode: Text.WordWrap
                text: "Morbi ultrices ullamcorper imperdiet. Proin ultrices, tortor a ornare luctus, mauris quam sagittis purus, dapibus luctus lectus est eu velit. Fusce mi ante, dictum tincidunt suscipit ut, viverra et velit. Donec a vehicula mauris. Vestibulum ornare tortor cursus nulla venenatis in imperdiet metus gravida. Cras ut libero sed neque volutpat molestie sed sit amet risus. Donec nec enim in quam aliquam adipiscing. Vestibulum hendrerit fermentum fermentum. Morbi hendrerit ipsum nec purus eleifend vitae lacinia nisi ullamcorper.

Curabitur vitae sodales risus. Nulla bibendum massa in quam vulputate porttitor. Aenean elit justo, accumsan ut varius id, commodo et elit. Suspendisse potenti. Nunc est nisl, venenatis sagittis malesuada pretium, aliquet pharetra leo. Sed nec dui vel tortor dignissim feugiat eu non lorem. Morbi id nisi sem. Curabitur facilisis bibendum tincidunt. Pellentesque pharetra, ipsum sit amet pretium porttitor, lectus lectus laoreet enim, at aliquet odio risus sed odio. Sed ultrices aliquam est, ac interdum mauris pretium a. Cras pharetra aliquam vulputate. Etiam faucibus placerat quam, id auctor turpis lacinia non. Praesent fringilla quam nec ante euismod commodo. Nulla facilisi. Aliquam erat volutpat. Donec eu odio urna.

Suspendisse at sapien mauris. Proin vel est non sem ultricies laoreet. Aenean feugiat fermentum libero nec interdum. Curabitur ligula ante, elementum in pulvinar id, blandit sit amet massa. Sed non justo eu purus lobortis tempor eget non tellus. Duis at ligula nisl, non sagittis nunc. Etiam cursus, ligula eu dignissim sagittis, purus lectus congue dui, quis dictum justo odio vel diam. Proin tempor nisi et eros vestibulum sed malesuada ante cursus. Nunc id orci sapien, a pretium massa. Nulla rhoncus, est in dapibus dignissim, elit mi pellentesque tellus, vitae imperdiet nibh nunc at lectus. In eu felis turpis. Sed dolor dolor, dictum vel porttitor in, egestas sit amet felis. Mauris mattis, elit at mattis lacinia, purus lorem porta diam, eu imperdiet nibh risus et lectus."
            }
        }
    }
}
