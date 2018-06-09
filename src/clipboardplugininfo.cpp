/*
The MIT License (MIT)

Copyright (c) 2016-2018 Oleg Linkin <maledictusdemagog@gmail.com>

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

#include "clipboardplugininfo.h"

ClipboardPluginInfo::ClipboardPluginInfo()
: m_Ready(false)
{
}

ClipboardPluginInfo::~ClipboardPluginInfo()
{
}

QList<TransferMethodInfo> ClipboardPluginInfo::info() const
{
    return m_InfoList;
}

void ClipboardPluginInfo::query()
{
    TransferMethodInfo info;

    QStringList capabilities;
    capabilities << QLatin1String("text/x-url");
    capabilities << QLatin1String("text/plain");

    info.displayName = QLatin1String("Clipboard");
    info.methodId = QLatin1String("ClipboardSharePlugin");
    info.accountIcon = QLatin1String("image://theme/icon-m-clipboard");
    info.shareUIPath = QLatin1String("/usr/share/nemo-transferengine/plugins/ClipboardShareUi.qml");
    info.capabilitities = capabilities;

    m_InfoList.clear();
    m_InfoList << info;

    m_Ready = true;
    emit infoReady();
}

bool ClipboardPluginInfo::ready() const
{
    return m_Ready;
}
