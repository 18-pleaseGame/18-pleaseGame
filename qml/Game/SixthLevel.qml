import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Gamebase {
    id: sixLevelScene
    gameName: "SixthLevel"
    width: 320
    height: 480

    Item {
        id: six
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
            text: "怎么去掉梦露的痣？"
            x: 20
            y: 50
            font.pointSize: 20
            font.family: font.name
            font.bold: true
        }

        Image {
            id: lulu
            scale: 0.4
            anchors.fill: parent.Center
            source: "../../assets/img/第6关/梦露.png"
            MouseArea {
                id: mouse
                anchors.fill: parent
                x: mouseX
                y: mouseY
                //                        onClicked: console.log(Number(mouse.x), mouse.y)
            }

            Image {
                id: blank
                visible: false
                x: 205
                y: 252
                source: "../../assets/img/第6关/blank.png"
            }
            Image {
                id: jiGuang
                x: 15
                y: 400
                scale: 0.3
                source: "../../assets/img/第6关/jiguang.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        blank.visible = true
                        if (blank.visible == true) {
                            console.log("success!")
                            if(JS.dbReadAll()<6){
                                JS.dbUpdate(0,6)
                            }
                            six.opacity = 0.3
                            sfTip.opacity = 1
                        } else {
                            console.log("you are wrong!")
                        }
                    }
                }
            }

            Image {
                id: eraser
                x: 200
                y: 340
                scale: 0.4
                source: "../../assets/img/第6关/eraser.png"
                MouseArea {
                    anchors.fill: parent
                    drag.target: eraser
                    drag.axis: Drag.XAndYAxis
                    hoverEnabled: true
                }
            }

            Image {
                id: huoCai
                y: 490
                scale: 0.5
                source: "../../assets/img/第6关/huochai.png"
                MouseArea {
                    anchors.fill: parent
                    drag.target: huoCai
                    drag.axis: Drag.XAndYAxis
                    hoverEnabled: true
                    onClicked: console.log(Number(mouse.x), mouse.y)
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
            x: sixLevelScene.width / 1.5
            y: sixLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                six.opacity = 0
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
