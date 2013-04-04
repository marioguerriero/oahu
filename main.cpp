#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/oahu/main.qml"));
    viewer.showExpanded();

    QObject::connect((QObject*)viewer.rootObject(), SIGNAL(openClicked()), &viewer, SLOT(onOpenClicked()));

    return app.exec();
}
