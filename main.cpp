#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

#include <QtQml/QQmlContext>
#include <QtCore/QList>

//#include "articleslist.h"
#include "articleitem.h"

QObjectList articlesModel()
{
    QObjectList articlesList;
    articlesList.append(new mlb::ui::ArticleItem(1,"ZLO", ""));

    return articlesList;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/mlb-ui/main.qml"));

    viewer.rootContext()->setContextProperty("articlesModel", QVariant::fromValue(articlesModel()));
    viewer.showExpanded();

    return app.exec();
}
