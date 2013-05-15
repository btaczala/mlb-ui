#include "articleitem.h"

namespace mlb {
namespace ui {

ArticleItem::ArticleItem(quint32 articleID, const QString& articleTitle):
    m_articleID(articleID),
    m_articleTitle(articleTitle)
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

} // namespace ui
} // namespace mlb
