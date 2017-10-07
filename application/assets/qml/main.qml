/*
 * This software was written by Maciej Węglarczyk and is licensed under MIT license.
 * https://github.com/FenixVoltres/QtIosAndroidAppSplit
 */

import QtQuick.Window 2.2
import QtQuick 2.9

Window {
    id: rootWindow

    height: 480
    width: 640

    title: qsTr("Splitable application")
    visibility: Window.FullScreen
    visible: true

    // perSize -> these images are present in density- and size-dependent versions (phone x1, phone x2, ...)
    // each device will get only one, proper version of this image
    // it can have different sizes for each density / size
    Image {
        id: background

        anchors.fill: parent

        source: "../images/perSize/background.png"

        Rectangle {
            id: qtLogoBackground

            height: parent.height
            width: 1.2*qtLogo.width

            anchors.horizontalCenter: parent.horizontalCenter

            // oneSize -> these images are present in one size only
            // must be scaled
            Image {
                id: qtLogo

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 10
                }

                source: "../images/oneSize/qt_logo_one.png"
            }

            // anySize -> these images are present in density-dependent versions (x1, x2)
            // each device will get only one, proper version of this image
            // it should have different sizes for each density
            Image {
                id: qtLogoHighDpi

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: 10
                }

                source: "../images/anySize/qt_logo_any.png"
            }
        }
    }
}
