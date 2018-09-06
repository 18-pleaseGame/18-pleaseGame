import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0


Gamebase {
    gameName: "SeventeenthLevel"
    id: scene

    width: 320
    height: 480

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: seventeen
        width: parent.width
        height: parent.height
        opacity: 1
        enabled: opacity === 1

        Text {
            id: name
            text: qsTr("找出与众不同的
一只猩猩。
")
            font.family: font.name
            font.bold: true
            font.pixelSize: 28
        }


        Image {
            id: xingxing1
            source: "../../assets/img/第17关/XINGXING.png"
            y: parent.height / 7
            x: parent.width / 10
        }

        Image {
            id: xingxing2
            source: "../../assets/img/第17关/XINGXING.png"
            y: xingxing1.y
            x: parent.width - xingxing2.width - parent.width / 10
        }

        Image {
            id: xingxing3
            source: "../../assets/img/第17关/XINGXING.png"
            y: xingxing1.y + xingxing1.height + parent.height / 15
            x: xingxing1.x
        }

        Image {
            id: xingxing4
            source: "../../assets/img/第17关/XINGXING.png"
            y: xingxing2.y + xingxing2.height + parent.height / 15
            x: xingxing2.x
        }


        Image {
            id: answerxingxing
            source: "../../assets/img/第17关/XINGIXNG2.png"
            y: xingxing3.y + xingxing3.height + parent.height /15
            x: xingxing1.x

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("you win")
                    if(JS.dbReadAll()<17){
                        JS.dbUpdate(0,17)
                    }
                    seventeen.opacity = 0.3
                    sfTip.opacity = 1
                }
            }
        }
        Image {
            id: xingxing5
            source: "../../assets/img/第17关/XINGXING.png"
            y: xingxing3.y + xingxing3.height + parent.height /15
            x: xingxing1.x

            MouseArea {
                anchors.fill: xingxing5
                drag.target: xingxing5
                drag.axis: "XAndYAxis"
            }
        }

        Image {
            id: xingxing6
            source: "../../assets/img/第17关/XINGXING.png"
            y: xingxing4.y + xingxing4.height + parent.height / 15
            x: xingxing2.x
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
            x: scene.width / 1.5
            y: scene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                seventeen.opacity = 0
                nextLevel = "EighteenthLevel.qml"
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
