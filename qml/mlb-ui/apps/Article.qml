import QtQuick 2.0
import QtWebKit 3.0

Item {
    width: 300
    height: 300
    property var article: null
    property alias urticleUrl: webItem.url

    signal loadingStarted()
    signal loadingFinished()

    //TODO: now we display entire web page
    // in the future we would have to display only frame containg an article
    WebView {
        id: webItem
        anchors.fill: parent
        url: "http://miastobasketu.com/index.php?case=art&artykul=1198"
        onLoadingChanged: {
            if ( loadRequest.status === WebView.LoadStartedStatus){
                loadingStarted();
            }
            else if (loadRequest.status === WebView.LoadSucceededStatus) {
                loadingFinished();
            }
        }
    }
}
