#include <QApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/oahu/main.qml"));
    viewer.showExpanded();

    // Slots
    QObject::connect((QObject*)viewer.rootObject(), SIGNAL(openClicked()), &viewer, SLOT(onOpenClicked()));
    QObject::connect((QObject*)viewer.rootObject(), SIGNAL(urlClicked()), &viewer, SLOT(onUrlClicked()));

    return app.exec();
}
