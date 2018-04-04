#ifndef HTTPREQUEST_H
#define HTTPREQUEST_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QUrl>
#include <QNetworkReply>

//class QNetworkReply;
class QNetworkRequest;

class HttpRequest : public QObject
{
    Q_OBJECT
public:
    explicit HttpRequest(QObject *parent = nullptr);
    void newRequest(QString url);
    void buttonRequest(QString url);

private:
    QUrl *url;
    QNetworkAccessManager *manager;
    QNetworkRequest *request;
    QNetworkReply *reply;

signals:

private slots:
    void on_httpButton_clicked();

public slots:
    void handleReply(QNetworkReply *reply);
    void handleButtonReply(QNetworkReply *reply);
};

#endif // HTTPREQUEST_H
