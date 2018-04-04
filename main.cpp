#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQuickItem>
#include <QUrl>
#include <QObject>
#include <QDebug>
#include <QQmlProperty>
#include "myclass.h"
#include "qmlproperty.h"
#include "httprequest.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //For use with QSettings
    QCoreApplication::setOrganizationName("MySoft");
    QCoreApplication::setOrganizationDomain("mysoft.com");
    QCoreApplication::setApplicationName("Star Runner");

    QGuiApplication app(argc, argv);

    //QML custom type
    qmlRegisterType<QmlProperty>("QmlProperties",1,0,"QmlProperty");
//    qmlRegisterType<QmlProperty>("com.qmltestref.qmlproperty",1,0,"QmlProperty");

    QQmlApplicationEngine engine;
    //set QML context property to pass data to qml
    auto offlineStoragePath = QUrl::fromLocalFile(engine.offlineStoragePath());
    QQmlContext *context = new QQmlContext(engine.rootContext());
    engine.rootContext()->setContextProperty("offlineStoragePath", offlineStoragePath);
    //loads qml
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *rootObject = engine.rootObjects().first();
    QObject *qmlObject = rootObject->findChild<QObject*>("swipeView");
    QObject *page1Label = rootObject->findChild<QObject*>("page1Label");
    QObject *page1Item = rootObject->findChild<QObject*>("page1Item");
    QObject *page1Button1 = rootObject->findChild<QObject*>("page1Button1");

//    engine->setProperty("title", "test");
    qDebug() << "Test Debug print";
    qDebug() << rootObject->property("visible");
    qDebug() << qmlObject->property("text");
    qDebug() << page1Label->property("text");
    qDebug() << "variable memory address: " << &page1Label;
    qDebug() << "property value: " << QQmlProperty::read(rootObject, "someNumber").toInt();

    //invoke QML method
    QVariant returnedValue;
    QVariant msg = "Hello from C++";
    QMetaObject::invokeMethod(rootObject, "myQmlFunction",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));

    qDebug() << "QML function returned:" << returnedValue.toString();

    //Connecting QML Signal
    MyClass myClass;
    QObject::connect(page1Item,SIGNAL(qmlSignal(QString)),&myClass,SLOT(cppSlot(QString)));
    QObject::connect(page1Button1,SIGNAL(released()),&myClass,SLOT(handleButton1(page1Button1)));//did not work!!


    //Request working
//    HttpRequest httpRequest;
//    httpRequest.newRequest("https://jsonplaceholder.typicode.com/posts/1");

    return app.exec();
}
