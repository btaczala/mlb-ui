#include "articleitem.h"

namespace mlb {
namespace ui {

ArticleItem::ArticleItem(quint32 articleID, const QString& articleTitle, const QString& articleText):
    m_articleID(articleID),
    m_articleTitle(articleTitle),
    m_articleText(articleText)
{
}

quint32 ArticleItem::articleID() const
{
    return m_articleID;
}

const QString &ArticleItem::articleTitle() const
{
    return m_articleTitle;
}

const QString &ArticleItem::articleText() const
{
   return m_articleText;
}

} // namespace ui
} // namespace mlb
