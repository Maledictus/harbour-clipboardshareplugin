/*
The MIT License (MIT)

Copyright (c) 2016 Oleg Linkin <maledictusdemagog@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.TransferEngine 1.0

ShareDialog {
    id: root

    property bool isLink: root.content && ('type') in root.content &&
            root.content.type === "text/x-url"
    property bool isText: root.content && ('type') in root.content &&
            root.content.type === "text/plain"

    onAccepted: {
        Clipboard.text = shareItem.userData.text
        shareItem.start()
    }

    Column {
        anchors.fill: parent

        spacing: Theme.paddingMedium

        DialogHeader {
            acceptText: qsTr("Copy to clipboard")
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            text: root.content.status
            width: root.width - Theme.paddingLarge * 2
            elide: Text.ElideRight
            wrapMode:  Text.Wrap
            maximumLineCount: 3
            opacity: .6
            font.pixelSize: Theme.fontSizeSmall
        }
    }

    SailfishShare {
        id: shareItem

        source: root.source
        metadataStripped: true
        serviceId: root.methodId
        userData: {
            "text": root.content.status
        }
        mimeType: root.isLink ? "text/x-url" : "text/plain"
    }
}
