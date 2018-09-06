import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Gamebase {
    id: thirdLevelScene
    gameName: "ThirdLevel"
    width: 320
    height: 480

    Item {
        id: third
        width: 320
        height: 480

        opacity: 1
        enabled: opacity === 1

        FontLoader {
            id: font
            source: "../../assets/字体/lemiao.ttf"
        }

        Text {
            id: questionInfo
            text: "新华字典中有多少个字？"
            x: 20
            y: 80
            font.pointSize: 20
            font.family: font.name
            font.bold: true
        }

        Image {
            id: dictionary
            scale: 0.2
            anchors.fill: parent.Center
            source: "../../assets/img/第3关/zidian.png"
        }

        //input data
        Rectangle {
            id: answerRec
            width: 100
            height: 30
            x: 130
            y: 310
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
            text: "OK"
            x: 140
            y: 370
            onClicked: {
                if (answer.text == 4) {
                    if(JS.dbReadAll()<3){
                        JS.dbUpdate(0,3)
                    }
                    JS.dbUpdate(0,3)
                    console.log("success!")
                    third.opacity = 0.3
                    sfTip.opacity = 1
                } else {
                    third.opacity = 0.3
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
            x: thirdLevelScene.width / 1.5
            y: thirdLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                third.opacity = 0
                nextLevel = "FourthLevel.qml"
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
            x: thirdLevelScene.width / 1.5
            y: thirdLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                third.opacity = 0
                nextLevel = "ThirdLevel.qml"
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
