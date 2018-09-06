import QtQuick 2.0
import QtQuick.Controls 2.0
import VPlay 2.0
import QtQuick.LocalStorage 2.0
import "../Database.js" as JS
import "../scenes"
import "../common"

Gamebase {
    id: tenthLevelScene
    property int opacityflag: 1
    gameName: "TenLevel"
    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: ten
        width: 320
        height: 480

        opacity: 1
        enabled: opacity === 1

        Text {

            id: ninequestion
            y: parent.height / 16
            z: 1
            text: qsTr("如何让睡着的猪消失？？？")
            font.family: font.name
            font.pixelSize: 20
            font.bold: true
        }
        AnimatedImage {
            id: piganimation
            z: 0
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 0
            source: "../../assets/img/第10关/IMG_3789.GIF"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    piganimation.opacity-=0.2
                    if(piganimation.opacity === 0) {
                        console.log("you win")
                        if(JS.dbReadAll()<10){
                            JS.dbUpdate(0,10)
                        }
                        ten.opacity = 0.3
                        sfTip.opacity = 1
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
            x: tenthLevelScene.width / 1.5
            y: tenthLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                ten.opacity = 0
                nextLevel = "EleventhLevel.qml"
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


