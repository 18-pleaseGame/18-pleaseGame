import QtQuick 2.0
import QtQuick.Controls 2.0
import VPlay 2.0
import QtQuick.LocalStorage 2.0
import "../Database.js" as JS
import "../scenes"
import "../common"

Gamebase {
    id: twelvethLevelScene
    gameName: "TwelveLevel"

    property int clickFlag: 0

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: twelve
        width: 320
        height: 480

        opacity: 1
        enabled: opacity === 1

        Text {
            id: eightquestion
            text: qsTr("请指出哪些是多边形？？？")
            font.family: font.name
            font.pointSize: 15
        }
        Row{
            x:40
            y:100
            spacing: 50
            Image {
                id: square
                width: 80
                height: 80

                property int nu: 0
                property int clicked: 0

                source: "../../assets/img/第12关/正方形.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        square.clicked++
                        if(square.clicked < 2) {
                            clickFlag++
                            num1.opacity = 1
                            square.nu = clickFlag
                        }
                    }
                }

                Rectangle {
                    id:num1
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: square.nu
                        anchors.centerIn: parent
                    }
                }
            }

            Image {
                id: sixsquare
                width: 80
                height: 70

                property int nu: 0
                property int clicked: 0

                source: "../../assets/img/第12关/菱形.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        sixsquare.clicked++
                        if(sixsquare.clicked < 2) {
                            clickFlag++
                            num2.opacity = 1
                            sixsquare.nu = clickFlag
                        }
                    }
                }

                Rectangle {
                    id:num2
                    opacity: 0
                    width: 20
                    height: 20
                    color: "white"
                    radius: 180
                    border.color: "red"
                    Text {
                        text: sixsquare.nu
                        anchors.centerIn: parent
                    }
                }

            }
        }
        Image {
            id: fivesquare
            width: 80
            height: 70

            property int nu: 0
            property int clicked: 0


            source: "../../assets/img/第12关/五边形.png"
            anchors.centerIn: parent
            MouseArea{
                anchors.fill: parent
                onClicked:  {
                    fivesquare.clicked++
                    if(fivesquare.clicked < 2) {
                        clickFlag++
                        num3.opacity = 1
                        fivesquare.nu = clickFlag
                    }
                }
            }

            Rectangle {
                id:num3
                opacity: 0
                width: 20
                height: 20
                color: "white"
                radius: 180
                border.color: "red"
                Text {
                    text: fivesquare.nu
                    anchors.centerIn: parent
                }
            }

        }

        MenuButton {
            id: ok
            text: "OK"
            x: twelvethLevelScene.width / 2 - ok.width / 2
            y: twelvethLevelScene.height / 2 + ok.height * 5
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if( clickFlag === 3 ){
                        if (JS.dbReadAll() < 12) {
                            JS.dbUpdate(0, 12)
                        }
                        twelve.opacity = 0.3
                        sfTip.opacity = 1
                    } else {
                        console.log("dsd")
                        twelve.opacity = 0.3
                        sfTip2.opacity = 1
                    }
                }
            }
        }

    }

    Item {
        id: sfTip
        opacity: 0
        Success {
            id: success
        }
        MenuButton {
            text: "下一关"
            x:twelvethLevelScene.width / 1.5
            y:twelvethLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                twelve.opacity = 0
                nextLevel = "ThirteenthLevel.qml"
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
            x:twelvethLevelScene.width / 1.5
            y:twelvethLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                twelve.opacity = 0
                nextLevel = "TwelvethLevel.qml"
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
