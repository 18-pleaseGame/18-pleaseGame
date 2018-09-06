import QtQuick 2.0
import QtQuick.Controls 2.0
import VPlay 2.0
import QtQuick.LocalStorage 2.0
import "../Database.js" as JS
import "../scenes"
import "../common"

Gamebase {
    id: ninethLevelScene
    gameName: "NineLevel"
    width: 320
    height: 480

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: nine
        width: 320
        height: 480

        opacity: 1
        enabled: opacity === 1

        Text {

            id: ninequestion
            z: 1
            text: qsTr("如何让叮当猫    起来？？？")
            font.family: font.name
            font.pixelSize: 20
            font.bold: true
        }
        Text {
            id: ninequestionsub
            z: 1
            text: qsTr("开心")
            font.family: font.name
            font.pixelSize: 20
            font.bold: true
            anchors.left: ninequestion.left
            anchors.leftMargin: ninequestion.x + 120
        }

        MouseArea {
            id: textmousearea
            anchors.fill:ninequestionsub
            drag.target: ninequestionsub
            onClicked: {
                console.log(mouseX, mouseY)
            }

            onReleased: {
                console.log(mouseY, catanimation.y)
                if (ninequestionsub.y >= catanimation.y && ninequestionsub.y < catanimation.y + catanimation.height) {
                    console.log("you win")
                    if (JS.dbReadAll() < 9) {
                        JS.dbUpdate(0, 9)
                    }
                    nine.opacity = 0.3
                    sfTip.opacity = 1
                }
            }
        }

        AnimatedImage {
            id: catanimation
            z: 0
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 20
            source: "../../assets/img/第9关/叮当猫.gif"
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
            x: ninethLevelScene.width / 1.5
            y: ninethLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                nine.opacity = 0
                nextLevel = "TenthLevel.qml"
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
