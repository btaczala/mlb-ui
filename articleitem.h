#ifndef MLB_UI_ARTICLEITEM_H
#define MLB_UI_ARTICLEITEM_H

#include <QtCore/QObject>

namespace mlb {
namespace ui {

class ArticleItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(quint32 articleID READ articleID CONSTANT)
    Q_PROPERTY(QString articleTitle READ articleTitle CONSTANT)
public:
    ArticleItem(quint32 articleID, const QString& articleTitle);

    quint32 articleID() const;
    const QString &articleTitle() const;
private:
    quint32 m_articleID;
    QString m_articleTitle;
};

} // namespace ui
} // namespace mlb

#endif // MLB_UI_ARTICLEITEM_H
