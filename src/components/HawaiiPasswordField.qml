/****************************************************************************
 * This file is part of Hawaii Shell.
 *
 * Copyright (C) 2014 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:GPL2+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtGraphicalEffects 1.0
import org.kde.plasma.core 2.0 as PlasmaCore

TextField {
    property color textColor: "#000000"
    property color backgroundColor: "#ffffff"
    property color selectionColor: theme.viewFocusColor
    property color selectedTextColor: "#ffffff"
    property color focusColor: theme.viewFocusColor

    id: passwordField
    placeholderText: i18nd("org.hawaii.lookandfeel.desktop", "Password");
    echoMode: TextInput.Password
    style: TextFieldStyle {
        textColor: passwordField.textColor
        placeholderTextColor: Qt.rgba(passwordField.textColor.r, passwordField.textColor.g, passwordField.textColor.b, 0.5)
        selectionColor: passwordField.selectionColor
        selectedTextColor: passwordField.selectedTextColor
        font.family: theme.defaultFont.family
        font.pointSize: 14
        font.bold: true
        background: Item {
            implicitWidth: passwordField.width
            implicitHeight: theme.mSize(theme.defaultFont).height + units.gridUnit * 2

            Rectangle {
                anchors.fill: parent
                anchors.bottomMargin: -1
                color: Qt.rgba(passwordField.textColor.r, passwordField.textColor.g, passwordField.textColor.b, 0.267)
                radius: baserect.radius
            }

            Rectangle {
                id: baserect
                anchors.fill: parent
                radius: 12
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.lighter(passwordField.backgroundColor, 0.8) }
                    GradientStop { position: 0.3; color: passwordField.backgroundColor }
                    GradientStop { position: 1.0; color: passwordField.backgroundColor }
                }
                border.color: control.activeFocus ? passwordField.focusColor : Qt.darker(passwordField.backgroundColor, 1.5)
            }
        }
    }
}
