import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0


Gamebase {
    gameName: "ThirteenthLevel"
    id: scene

    width: 320
    height: 480

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item{
        id: thirteen1
        opacity: 1
        enabled: opacity === 1
        width: 320
        height: 480
        Text {
            id:question1
            text:"什么东西在箱子后面,请点击它"
            x:scene.width / 15
            y: scene.height / 10
            font.family: font.name
            font.bold: true
            font.pixelSize: 20
        }

        Image {
            id: duck
            source: "../../assets/img/第13关/duck.png"
            x: scene.width / 4 + duck.width
            y: scene.height / 2 + duck.height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    thirteen1.opacity = 0
                    thirteen2.opacity = 1
                }
            }
        }

        Image {
            id:box
            source: "../../assets/img/第13关/Box.png"
            x: scene.width / 4
            y: scene.height / 2

            MouseArea {
                anchors.fill: box
                drag.target: box
                drag.axis: "XAndYAxis"
            }
        }
    }

    Item {
        id: thirteen2
        opacity: 0
        enabled: opacity === 1
        width: 320
        height: 480

        Text {
            id:question
            text:"在箱子前面"
            x: answer.x + answer.width
            y: answer.y
            font.family: font.name
            font.bold: true
            font.pixelSize: 20
        }

        Text {
            id:answer
            text:"什么东西"
            x:scene.width / 8
            y: scene.height / 10
            font.family: font.name
            font.bold: true
            font.pixelSize: 20
            }

        Image {
            id:box2
            source: "../../assets/img/第13关/Box.png"
            x: scene.width / 4
            y: scene.height / 2

            MouseArea {
                anchors.fill: box2
                drag.target: box2
                drag.axis: "XAndYAxis"
            }
        }

        MouseArea {
            anchors.fill: answer
            onClicked: {
                console.log("you win")
                if(JS.dbReadAll()<13){
                    JS.dbUpdate(0,13)
                }
                thirteen2.opacity = 0.3
                sfTip.opacity = 1
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
            x:scene.width / 1.5
            y:scene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                thirteen2.opacity = 0
                nextLevel = "FourteenthLevel.qml"
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

