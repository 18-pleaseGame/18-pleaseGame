import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Gamebase {
    id: fourthLevelScene
    gameName: "FourthLevel"
    width: 320
    height: 480

    Item {
        id: fourth
        width: 320
        height: 480

        opacity: 1
        enabled: opacity === 1

        FontLoader {
            id: font
            source: "../../assets/字体/lemiao.ttf"
        }

        Text {
            id: questionInfo1
            text: "找到"
            x: 20
            y: 50
            font.pointSize: 17
            font.family: font.name
            font.bold: true
        }

        Text {
            id: questionInfo2
            z: 2
            text: "猫咪"
            x: questionInfo1.x + questionInfo1.width
            y: questionInfo1.y
            font.pointSize: 17
            font.family: font.name
            font.bold: true
            MouseArea {
                anchors.fill: parent
                drag.target: questionInfo2
                drag.axis: Drag.XAndYAxis
                hoverEnabled: true
                onPositionChanged: if (questionInfo2.x > 285
                                           || questionInfo2.x < -15
                                           || questionInfo2.y < -10
                                           || questionInfo2.y > 470) {
                                       console.log("success!")
                                       if (JS.dbReadAll() < 4) {
                                           JS.dbUpdate(0, 4)
                                       }
                                       fourth.opacity = 0.3
                                       sfTip.opacity = 1
                                   } else {
                                       console.log("wrong!")
                                   }
            }
        }

        Text {
            id: questionInfo3
            text: "，然后再把它"
            x: questionInfo1.x + 90
            y: questionInfo1.y
            font.pointSize: 17
            font.family: font.name
            font.bold: true
        }
        Text {
            id: questionInfo21
            text: "藏起来？"
            x: questionInfo1.x
            y: questionInfo1.y + questionInfo1.height
            font.pointSize: 17
            font.family: font.name
            font.bold: true
        }
        Image {
            id: room
            z: 1
            scale: 0.7
            anchors.centerIn: parent
            source: "../../assets/img/第4关/room3.png"
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
            x: fourthLevelScene.width / 1.5
            y: fourthLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                fourth.opacity = 0
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
