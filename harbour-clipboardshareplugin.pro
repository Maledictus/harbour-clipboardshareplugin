QMAKE_CXXFLAGS += -std=c++0x

TEMPLATE = lib
TARGET = $$qtLibraryTarget(clipboardshareplugin)

target.path = /usr/lib/nemo-transferengine/plugins

QT += gui

CONFIG += plugin link_pkgconfig

PKGCONFIG += nemotransferengine-qt5

HEADERS += src/clipboardplugininfo.h \
    src/clipboardmediatransfer.h \
    src/clipboardtransferiface.h

SOURCES += src/clipboardplugininfo.cpp \
    src/clipboardmediatransfer.cpp \
    src/clipboardtransferiface.cpp

qml.path = /usr/share/nemo-transferengine/plugins
qml.files = qml/ClipboardShareUi.qml

INSTALLS += target qml

DISTFILES += rpm/harbour-clipboardshareplugin.spec \
    qml/ClipboardShareUi.qml \
    rpm/harbour-clipboardshareplugin.changes
