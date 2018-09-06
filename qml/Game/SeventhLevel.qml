import QtQuick 2.0
import QtQuick.Controls 2.0
import VPlay 2.0
import QtQuick.LocalStorage 2.0
import "../Database.js" as JS
import "../scenes"
import "../common"
Gamebase {
    id: seventhLevelScene
    gameName: "SeventhLevel"
    property int clickflag: 0

    Item {
        id: seven
        width: 320
        height: 480

        opacity: 1
        enabled: opacity === 1


        FontLoader {
            id: font
            source: "../../assets/字体/lemiao.ttf"
        }
        Text {
            id: question
            font.family: font.name
            font.pointSize: 15
            text: if (font.status == FontLoader.Ready)
                      "请指出哪几个小人长得一样"
                  else if (font.status == FontLoader.Loading)
                      "Loading..."
                  else if (font.status == FontLoader.Error)
                      "Error loading font"
        }

        Row {
            x: 20
            y: 50
            Image {

                id: faceimage1
                source: "../../assets/img/第7关/娃娃女1.png"
                property int click: 0
                property int nu: 0

                Rectangle {
                    id:num1
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: faceimage1.nu
                        anchors.centerIn: parent
                    }
                }

                MouseArea {
                    id: faceimage1mousearea
                    anchors.fill: faceimage1
                    onClicked: {
                        faceimage1.click++
                        if(faceimage1.click === 1) {
                            num1.opacity = 1
                            clickflag++
                            faceimage1.nu = clickflag
                        }
                    }
                }
            }


            Image {

                id: faceimage2
                source: "../../assets/img/第7关/娃娃女2.png"
                property int click: 0
                property int nu: 0

                Rectangle {
                    id:num2
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: faceimage2.nu
                        anchors.centerIn: parent
                    }
                }

                MouseArea {
                    id: faceimage2mousearea
                    anchors.fill: parent
                    onClicked: {
                        faceimage2.click++
                        if(faceimage2.click === 1) {
                            num2.opacity = 1
                            clickflag++
                            faceimage2.nu = clickflag
                        }

                    }
                }
            }

            Image {

                id: faceimage3
                source:"../../assets/img/第7关/娃娃女3.png"
                property int click: 0
                property int nu: 0
                Rectangle {
                    id:num3
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: faceimage3.nu
                        anchors.centerIn: parent
                    }
                }

                MouseArea {
                    id: faceimage3mousearea
                    anchors.fill: parent
                    onClicked: {
                        faceimage3.click++
                        if(faceimage3.click === 1) {
                            num3.opacity = 1
                            clickflag++
                            faceimage3.nu = clickflag
                        }
                    }
                }
            }
        }

        Row {
            x: 30
            y: 180
            Image {

                id: faceimage4
                source: "../../assets/img/第7关/娃娃女4.png"
                property int click: 0
                property int nu: 0
                Rectangle {
                    id:num4
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: faceimage4.nu
                        anchors.centerIn: parent
                    }
                }

                MouseArea {
                    id: faceimage4mousearea
                    anchors.fill: parent
                    onClicked: {
                        faceimage4.click++
                        if(faceimage4.click === 1) {
                            num4.opacity = 1
                            clickflag++
                            faceimage4.nu = clickflag
                        }
                    }
                }
            }
            Image {

                id: faceimage5
                source: "../../assets/img/第7关/娃娃男1.png"
                property int click: 0
                property int nu: 0
                Rectangle {
                    id:num5
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: faceimage5.nu
                        anchors.centerIn: parent
                    }
                }

                MouseArea {
                    id: faceimage5mousearea
                    anchors.fill: parent
                    onClicked: {
                        faceimage5.click++
                        if(faceimage5.click === 1) {
                            num5.opacity = 1
                            clickflag++
                            faceimage5.nu = clickflag
                        }
                    }
                }
            }
            Image {

                id: faceimage6
                source: "../../assets/img/第7关/娃娃男2.png"
                property int click: 0
                property int nu: 0
                Rectangle {
                    id:num6
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: faceimage6.nu
                        anchors.centerIn: parent
                    }
                }

                MouseArea {
                    id: faceimage6mousearea
                    anchors.fill: parent
                    onClicked: {
                        faceimage6.click++
                        if(faceimage6.click === 1) {
                            num6.opacity = 1
                            clickflag++
                            faceimage6.nu = clickflag
                        }
                    }
                }
            }
        }

        MenuButton {
            x: parent.width / 2
            y: parent.height / 2 + 100
            text: qsTr("确定")
            onClicked: {
                if (clickflag == 6) {
                    console.log("you win")
                    if (JS.dbReadAll() < 7) {
                        JS.dbUpdate(0, 7)
                    }
                    seven.opacity = 0.3
                    sfTip.opacity = 1
                } else {
                    seven.opacity = 0.3
                    sfTip2.opacity = 1
                }
            }
        }

    }

    Item {
        id: sfTip
        opacity: 0
        enabled: opacity === 1
        Success {
            id: success
        }
        MenuButton {
            text: "下一关"
            x: seventhLevelScene.width / 1.5
            y: seventhLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                seven.opacity = 0
                nextLevel = "EighthLevel.qml"
            }
        }
    }

    Item {
        id: sfTip2
        opacity: 0
        enabled: opacity === 1

        Failure {
            id: failure
        }

        MenuButton {
            text: "再来一次"
            x: seventhLevelScene.width / 1.5
            y: seventhLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                seven.opacity = 0
                nextLevel = "SeventhLevel.qml"
            }
        }
    }

    Loader {
        id: loader
        source: "../Game/" + nextLevel
        onLoaded: {
            // since we did not define a width and height in the level item itself, we are doing it here
            item.width = parent.width
            item.height = parent.height
            // store the loaded level as activeLevel for easier access
            activeGame = item
        }
    }

}
