import QtQuick 2.0
import QtQuick.Controls 2.0
import VPlay 2.0
import QtQuick.LocalStorage 2.0
import "../Database.js" as JS
import "../scenes"
import "../common"
Gamebase {
    id: eightLevelScene
    gameName: "EightLevel"
    width: 320
    height: 480
    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: eight

        opacity: 1
        enabled: opacity === 1

        width: 320
        height: 480
        Text {
            id: eightquestion
            y: eightLevelScene.height / 8
            text: qsTr("请问今年是多少年？？？")
            font.family: font.name
            font.pointSize: 20
        }
        Image {
            id: numberyang
            x: eightLevelScene.width / 16
            y: eightLevelScene.height / 4
            source: "../../assets/img/第8关/2012羊.png"
            width: 282
            height: 100
        }

        Text {
            id: answerTip
            x: eightLevelScene.width / 16
            y: eightLevelScene.height - eightLevelScene.height / 4 + answer.height / 4
            text: "You answer:"
        }

        TextField {
            id: answer
            width: 100
            height: 30
            x: answerTip.x + answerTip.width + 10
            y: eightLevelScene.height - eightLevelScene.height / 4
            focus: true
            onEditingFinished: {
                console.log("you are wrong.")
            }
        }

        MenuButton {
            text: "确定"
            x: answer.x + answer.width * 1.5
            y: answer.y
            onClicked: {
                if (answer.text == getCurDate()) {
                    console.log("you win")
                    if(JS.dbReadAll()<8){
                       JS.dbUpdate(0,8)
                    }
                    eight.opacity = 0.3
                    sfTip.opacity = 1
                } else {
                    eight.opacity = 0.3
                    sfTip2.opacity = 1
                }
            }
        }
    }

    function getCurDate() {
        var d = new Date()
        var years = d.getFullYear()
        return years
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
            x: eightLevelScene.width / 1.5
            y: eightLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                eight.opacity = 0
                nextLevel = "NinethLevel.qml"
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
            x: eightLevelScene.width / 1.5
            y: eightLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                eight.opacity = 0
                nextLevel = "EighthLevel.qml"
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
