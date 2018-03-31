#include "myclass.h"

MyClass::MyClass(QObject *parent) : QObject(parent)
{

}

void MyClass::handleButton1(QObject *page1Button1)
{
    page1Button1->setProperty("text","Example");
}
