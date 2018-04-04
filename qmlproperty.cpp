#include "qmlproperty.h"
#include "httprequest.h"
#include "settings.h"
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

void QmlProperty::getRequest(QString url)
{
    //not sending request
    HttpRequest httpRequest;
    httpRequest.buttonRequest(url);
    qDebug() << "slot for http button request";
}

void QmlProperty::newSetting(QString keyname, QVariant value)
{
    Settings settings;
    settings.newSetting(keyname, value);
    qDebug() << "added and rewrote setting";
}

void QmlProperty::getSetting(QString keyname)
{
    Settings settings;
    settings.getSetting(keyname);

}
