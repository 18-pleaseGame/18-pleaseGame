import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Gamebase {
    id: secondLevelScene
    gameName: "SecondLevel"
    width: 320
    height: 480

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item{
        id:second
        opacity: 1
        enabled: opacity === 1


        Text {
            id: questionInfo1
            text: "太"
            x: 20
            y: 50
            font.pointSize: 20
            font.family: font.name
            font.bold: true
        }
        Text {
            id: questionInfo2
            text: "平"
            x: questionInfo1.x + questionInfo2.width
            y: questionInfo1.y
            font.pointSize: 20
            font.family: font.name
            font.bold: true
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (JS.dbReadAll() < 2) {
                        JS.dbUpdate(0, 2)
                    }
                    console.log("success")
                    second.opacity = 0.3
                    sfTip.opacity = 1
                }
            }
        }

        Text {
            id: questionInfo3
            text: "洋的中间是什么？"
            x: questionInfo2.x + questionInfo2.width
            y: questionInfo2.y
            font.pointSize: 20
            font.family: font.name
            font.bold: true
        }

        Rectangle {
            id: answerRec
            width: 100
            height: 30
            x: 100
            y: 340
            color: "#f9bb74"
            border.color: "#d7830c"

            TextField {
                id: answer
                width: 100
                height: 30
                x: 100
                y: 210
                focus: true
                anchors.fill: parent
                onEditingFinished: {
                    console.log("you are wrong.")
                }
            }
        }

        Text {
            id: daan
            x: answerRec.x - 90
            y: answerRec.y + 9
            text: "You answer:"
        }

        Image {
            id: global
            scale: 0.6
            x: 30
            y: 90
            source: "../../assets/img/第2关/useEarth.png"
        }

        MenuButton {
            text: "OK"
            x: 140
            y: 390
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    second.opacity = 0.3
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
            x: secondLevelScene.width / 1.5
            y: secondLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                second.opacity = 0
                nextLevel = "ThirdLevel.qml"
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
            x: secondLevelScene.width / 1.5
            y: secondLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                second.opacity = 0
                nextLevel = "SecondLevel.qml"
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
