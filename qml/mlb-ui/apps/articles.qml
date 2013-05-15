import QtQuick 2.0

Item {
    width: 100
    height: 62
    state: "listShown"
    function showArticle(articleID, articleText) {
        state = "articleShown"
        articleItem.articleText = articleText
    }

    ListView {
        id: listViewItem
        anchors.fill: parent
        model: articlesModel
        delegate: ArticleDelegate {
            width: listViewItem.width
            height: 40
            text:articleTitle
            onArticleSelected: {
                showArticle(articleID, articleText)
            }
        }
    }

    Article {
        id: articleItem
        anchors.fill: parent
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
