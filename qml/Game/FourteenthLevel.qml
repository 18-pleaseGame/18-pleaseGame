import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0


Gamebase {
    gameName: "FourteenthLevel"
    id: scene

    width: 320
    height: 480
    property int counter: 0

    PhysicsWorld{
        debugDrawVisible: true
    }

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: fourteen
        width: 320
        height: 480

        opacity: 1
        enabled: opacity === 1

        Text{
            id: question
            x: parent.width / 25
            y:parent.height / 14
            text: qsTr("请让每个盘子都放上")
            font.family: font.name
            font.bold: true
            font.pixelSize: 24
        }

        Image {
            id: disk1
            source: "../../assets/img/第14关/disk.png"
            x: parent.width / 2 - disk1.width / 2
            y: parent.width / 2 - disk1.height / 2
        }

        Image {
            id: disk2
            source: "../../assets/img/第14关/disk.png"
            x: disk1.x
            y: parent.width / 2 + disk1.height * 2
        }

        Image {
            id: strawberry
            source: "../../assets/img/第14关/strawberry.png"
            x: disk1.x + disk1.width / 2.5
            y: disk1.y + disk1.height / 5

            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: "XAndYAxis"
            }

        }

        Text {
            id: answer
            x: question.x + question.width
            y: question.y
            text: qsTr("草莓")
            font.family: font.name
            font.bold: true
            font.pixelSize: 24

            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: "XAndYAxis"
                onReleased:
                    if(strawberry.x < (disk1.x + disk1.width / 1.5) && strawberry.x > (disk1.x + disk1.width / 4))
                        if(strawberry.y < (disk2.y + disk1.height / 1.5) && strawberry.y > (disk1.y - disk1.height / 4))
                            if(answer.x < (disk2.x + disk2.width / 1.5) && answer.x > (disk2.x + disk2.width / 4))
                                if(answer.y < (disk2.y + disk2.height / 1.5) && answer.y > (disk2.y - disk2.height / 4)) {
                                    if(JS.dbReadAll()<14){
                                        JS.dbUpdate(0,14)
                                    }
                                    console.log("you win")
                                    fourteen.opacity = 0.3
                                    sfTip.opacity = 1
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
            x: scene.width / 1.5
            y: scene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                fourteen.opacity = 0
                nextLevel = "FifteenthLevel.qml"
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

