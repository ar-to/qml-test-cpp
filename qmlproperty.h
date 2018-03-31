#ifndef QMLPROPERTY_H
#define QMLPROPERTY_H

#include <QObject>

class QmlProperty : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString text MEMBER m_text WRITE setText NOTIFY textChanged)

public:
    explicit QmlProperty(QObject *parent = nullptr);

    QString name() const {
        return m_name;
    }
    void setName(const QString &name);
    void setText(const QString &text);

private:
    QString m_name;
    QString m_text;

signals:
    void nameChanged();
    void textChanged();

public slots:
    void changeText(const QString &text);
};

#endif // QMLPROPERTY_H
