#include "httprequest.h"
#include <QDebug>

HttpRequest::HttpRequest(QObject *parent) : QObject(parent)
{
    manager = new QNetworkAccessManager(this);
}

void HttpRequest::newRequest(QString url)
{
//    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
//    manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),
        this, SLOT(handleReply(QNetworkReply*)));

    manager->get(QNetworkRequest(QUrl(url)));
//    manager->get(QNetworkRequest(QUrl("https://jsonplaceholder.typicode.com/posts/1")));

//    request->setUrl(QUrl(url));
//    manager->get(request);
    qDebug() << "http triggered";
}

void HttpRequest::buttonRequest(QString url)
{
//    QNetworkReply* pReply = manager->get(QNetworkRequest(QUrl(url)));
    connect(manager, SIGNAL(finished(QNetworkReply*)),this, SLOT(handleButtonReply(QNetworkReply*)));

    manager->get(QNetworkRequest(QUrl(url)));
    //not sending this request
    qDebug() << "http button triggered";
}

void HttpRequest::on_httpButton_clicked()
{
    //not working
//    this->newRequest("https://jsonplaceholder.typicode.com/posts/1");
    this->newRequest("https://jsonplaceholder.typicode.com/posts/1");
    qDebug() << "http Button Clicked";
}

void HttpRequest::handleReply(QNetworkReply *reply)
{
    if (reply->error()) {
        qDebug() << reply->errorString();
        return;
    }

    QString answer = reply->readAll();

    qDebug() << "Request: " << answer;

    reply->deleteLater();
}

void HttpRequest::handleButtonReply(QNetworkReply *reply)
{
    if (reply->error()) {
        qDebug() << reply->errorString();
        return;
    }

    QString answer = reply->readAll();

    qDebug() <<"Button Request: " << answer;

    reply->deleteLater();
}
