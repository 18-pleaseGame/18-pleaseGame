import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Gamebase {
    id: fivethLevelScene
    gameName: "FivethLevel"
    width: 320
    height: 480

    Item {
        id: five

        opacity: 1
        enabled: opacity === 1

        width: 320
        height: 480

        FontLoader {
            id: font
            source: "../../assets/字体/lemiao.ttf"
        }

        Text {
            id: questionInfo
            text: "请算出sinx/n等于多少？"
            x: 20
            y: 70
            font.pointSize: 18
            font.family: font.name
            font.bold: true
        }

        Image {
            id: sanjiao
            scale: 0.4
            anchors.centerIn: parent
            source: "../../assets/img/第5关/gou3gu4xian5.png"
        }

        Text {
            id: threeMi
            x: 220
            y: 235
            text: "3"
        }

        Text {
            id: fourMi
            x: 150
            y: 285
            text: "4"
        }

        Text {
            id: fiveMi
            x: 120
            y: 220
            text: "5"
        }

        Rectangle {
            id: answerRec
            width: 100
            height: 30
            x: 100
            y: 350
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
            }
        }

        Text {
            id: daan
            x: answerRec.x - 90
            y: answerRec.y + 9
            text: "You answer:"
        }

        MenuButton {
            id: ok
            x: 130
            y: 390
            width: 50
            height: 30
            text: "Ok"
            onClicked: {
                if (answer.text == 6) {
                    console.log("success")
                    if(JS.dbReadAll()<5){
                       JS.dbUpdate(0,5)
                    }
                    five.opacity = 0.3
                    sfTip.opacity = 1
                } else {
                    five.opacity = 0.3
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
            x: fivethLevelScene.width / 1.5
            y: fivethLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                five.opacity = 0
                nextLevel = "SixthLevel.qml"
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
            x: fivethLevelScene.width / 1.5
            y: fivethLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                five.opacity = 0
                nextLevel = "FivethLevel.qml"
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
