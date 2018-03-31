#include "qmlproperty.h"
#include <QDebug>

QmlProperty::QmlProperty(QObject *parent) : QObject(parent)
{
    this->m_name = "QML Property";
}

void QmlProperty::setName(const QString &name) {
    qDebug() << "Changing title to: " << name;
    this->m_name = name;
}

void QmlProperty::setText(const QString &text) {
    qDebug() << "Changing text to: " << text;
    this->m_text = text;
}

void QmlProperty::changeText(const QString &text) {
    setText(text);
    qDebug() << "Text changed via slot: " << text;
    emit textChanged();
}
