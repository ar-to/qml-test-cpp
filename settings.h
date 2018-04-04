#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
#include <QVariant>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = nullptr);
    void newSetting(QString keyname, QVariant value);
    void getSetting(QString keyname);

private:
    QSettings *settings;
    const QString *organization;
    const QString *application;

signals:

public slots:
};

#endif // SETTINGS_H
