import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Gamebase {
    gameName: "EighteenthLevel"
    id: scene

    width: 320
    height: 480

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item{
        id: eighteen
        opacity: 1
        enabled: opacity === 1
        width: 320
        height: 480

        Text {
            id: question
            text: qsTr("找到圆形")
            font.family: font.name
            font.bold: true
            font.pixelSize: 28
            x: parent.width / 20
            y: parent.height / 20
        }

        Text {
            id: answer
            text: qsTr("。")
            font.family: font.name
            font.bold: true
            font.pixelSize: 28
            x: question.x + question.width
            y: question.y

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("you win")
                    if(JS.dbReadAll()<18){
                        JS.dbUpdate(0,18)
                    }
                    quan.opacity = 1
                    eighteen.opacity = 0.3
                    sfTip.opacity = 1
                }
            }
        }

        Image {
            id: quan
            source: "../../assets/img/第18关/quan.png"
            opacity: 0
            x: answer.x - quan.width / 2
            y: answer.y + quan.height / 2
        }

        Image {
            id: circle1
            source: "../../assets/img/第18关/circle1.png"
            x: parent.width / 20
            y: parent.height / 5

            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: "XAndYAxis"
            }
        }

        Image {
            id: circle2
            source: "../../assets/img/第18关/circle2.png"
            x: parent.width / 2 + circle2.width * 2
            y: parent.height / 2 + circle2.width * 2


            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: "XAndYAxis"
            }
        }

        Image {
            id: triangle
            source: "../../assets/img/第18关/triangle.png"
            x: (parent.width - triangle.width) / 2
            y: (parent.height - triangle.height) / 2

            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: "XAndYAxis"
            }

        }

        Image {
            id: sexangle
            source: "../../assets/img/第18关/sexangle.png"
            x: parent.width / 8
            y: parent.height / 1.5

            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: "XAndYAxis"
            }

        }

        Image {
            id: rectangle
            source: "../../assets/img/第18关/rectangle.png"
            x: parent.width - rectangle.width / 2
            y: parent.height / 2 - rectangle.height

            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: "XAndYAxis"
            }
        }
    }

    Item {
        id: sfTip
        opacity: 0
        enabled: opacity === 1

        width: 320
        height: 480

        Image {
            id: tipDialog
            anchors.centerIn: parent
            scale: 1.5
            source: "../../assets/img/提示框.png"
            Text {
                id: successMessage
                anchors.centerIn: parent
                text: "恭喜你通关啦！！！"
                color: "black"
                font.family: font.name
                font.bold: true
            }
        }

        AnimatedImage {
            id: successDog
            scale: 0.5
            x: -170
            y: 100
            source: "../../assets/img/success.GIF"
        }
    }

}

