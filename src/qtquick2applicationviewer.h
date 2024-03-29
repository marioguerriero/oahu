// checksum 0xfde6 version 0x80003
/*
  This file was generated by the Qt Quick 2 Application wizard of Qt Creator.
  QtQuick2ApplicationViewer is a convenience class containing mobile device specific
  code such as screen orientation handling. Also QML paths and debugging are
  handled here.
  It is recommended not to modify this file, since newer versions of Qt Creator
  may offer an updated version of it.
*/

#ifndef QTQUICK2APPLICATIONVIEWER_H
#define QTQUICK2APPLICATIONVIEWER_H

#include <QtQuick/QQuickView>
#include <QtWidgets/QFileDialog>
#include <QQuickItem>
#include <QDir>
#include <QDebug>
#include <QString>

class QtQuick2ApplicationViewer : public QQuickView
{
    Q_OBJECT

public:
    explicit QtQuick2ApplicationViewer(QWindow *parent = 0);
    virtual ~QtQuick2ApplicationViewer();

    void setMainQmlFile(const QString &file);
    void addImportPath(const QString &path);

    void showExpanded();

    void setVideoSource(QString source) {
        (QObject*)rootObject()->setProperty("videoSource", source);
    }

private:
    class QtQuick2ApplicationViewerPrivate *d;

public slots:
    void onOpenClicked() {
        QString fileName = QFileDialog::getOpenFileName(0, tr("Open Video"),
                                                        QDir::homePath(),
                                                        tr("Video (*.webm *.mp4 *.mpg)"));

        if (fileName != NULL) {
            qDebug() << "Opening: " << fileName;
            // TODO: it's not too elegant to use "'file://' + path", find a better solution
            (QObject*)rootObject()->setProperty("videoSource", "file://" + fileName);
        }
    }
    void onUrlClicked() {
        QString fileName = QFileDialog::getOpenFileName(0, tr("Open Video"),
                                                        QDir::homePath(),
                                                        tr("Video (*.webm *.mp4 *.mpg)"));

        if (fileName != NULL) {
            qDebug() << "Opening: " << fileName;
            // TODO: it's not too elegant to use "'file://' + path", find a better solution
            (QObject*)rootObject()->setProperty("videoSource", "file://" + fileName);
        }
    }
};

#endif // QTQUICK2APPLICATIONVIEWER_H
