#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QDebug>
#include <QtWidgets/QPushButton>

class MyClass : public QObject
{
    Q_OBJECT
public:
    explicit MyClass(QObject *parent = nullptr);

signals:

public slots:
    void cppSlot(const QString &msg)
    {
        qDebug() << "Called the C++ slot with message: " << msg;
    }
private slots:
    void handleButton1(QObject *page1Button1);
};

#endif // MYCLASS_H
