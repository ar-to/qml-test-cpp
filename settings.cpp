#include "settings.h"
#include <QDebug>
#include <QCoreApplication>

Settings::Settings(QObject *parent) : QObject(parent)
{
//    QSettings settings("MyOrg", "MyApp");
//   settings = new QSettings("MyOrg", "MyApp");
//   QCoreApplication::setOrganizationName("MySoft");
//   QCoreApplication::setOrganizationDomain("mysoft.com");
//   QCoreApplication::setApplicationName("Star Runner");
}

void Settings::newSetting(QString keyname, QVariant value)
{
    QSettings settings;
    settings.setValue(keyname, value);
    qDebug() << "set value to new setting";
}

void Settings::getSetting(QString keyname)
{
//    int value = settings->value(keyname).toInt();
    QSettings settings;
    int value = settings.value(keyname).toInt();
    qDebug() << "got setting: " << value;
}
