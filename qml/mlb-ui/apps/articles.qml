import QtQuick 2.0

Item {
    width: 100
    height: 62
    state: "listShown"
    signal busy()
    signal finished()
    function showArticle(articleID, articleText, articleHeader) {
        state = "articleShown";
    }

    ListView {
        id: listViewItem
        anchors.fill: parent
        model: articlesModel
        clip: true
        delegate: ArticleDelegate {
            width: listViewItem.width
            height: 40
            text:articleTitle
            onArticleSelected: {
                showArticle(articleID, articleText, articleTitle)
            }
        }
    }

    Article {
        id: articleItem
        anchors.fill: parent
        onLoadingStarted: busy();
        onLoadingFinished: finished();
    }

    states: [
        State {
            name: "listShown"
            PropertyChanges { target: articleItem; visible: false}
            PropertyChanges { target: listViewItem; visible: true}
        },
        State {
            name: "articleShown"
            PropertyChanges { target: articleItem; visible: true}
            PropertyChanges { target: listViewItem; visible: false}
        }
    ]
}
