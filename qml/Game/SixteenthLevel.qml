import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0


Gamebase {
    gameName: "SixteenthLevel"
    id: scene

    width: 320
    height: 480

    property int num: 0

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item{
        id: sixteen

        opacity: 1
        enabled: opacity === 1

        width: 320
        height: 480

        Text {
            id: question
            text:"数一数有几个黑点"
            x: parent.width / 20
            y: parent.height / 10
            font.family: font.name
            font.bold: true
            font.pixelSize: 28
        }

        Rectangle {
            id:answer
            width: 3
            height: 3
            color: "black"
            radius: 180
            x: question.width + 20
            y: question.y + 23
        }

        Image {
            id: quan
            source: "../../assets/img/第16关/quan.png"
            opacity: 0
            x: answer.x - quan.width / 2
            y: answer.y - quan.height / 2
        }

        Image {
            id: blackboard
            source: "../../assets/img/第16关/heige.png"
            anchors.centerIn: parent
        }

        Image {
            id: plus
            source: "../../assets/img/第16关/plus.png"
            y: parent.height - parent.height / 7
            x: parent.width / 20
            MouseArea{
                anchors.fill: plus
                onClicked:
                    scene.num = scene.num + 1
            }
        }

        Image {
            id: jian
            source: "../../assets/img/第16关/jian.png"
            y: parent.height - parent.height / 7
            x: parent.width / 4 + plus.width
            MouseArea{
                anchors.fill: jian
                onClicked:
                    scene.num = scene.num - 1
            }
        }

        //        Rectangle {
        //            id: ok
        //            width: 100
        //            height: 50
        //            color: "gold"
        //            radius: 90
        //            x: jian.x + jian.width + 20
        //            y: parent.height - parent.height / 7

        //            Text {
        //                text: "OK"
        //                font.family: font.name
        //                font.bold: true
        //                font.pixelSize: 28
        //                anchors.centerIn: parent
        //            }

        //            MouseArea {
        //                anchors.fill: parent
        //                onClicked: {
        //                    if(scene.num === 1) {
        //                        console.log("you win")
        //                        if(JS.dbReadAll()<16){
        //                            JS.dbUpdate(0,16)
        //                        }
        //                        quan.opacity = 1
        //                        sixteen.opacity = 0.3
        //                        sfTip.opacity = 1
        //                    } else {
        //                        console.log("you lose")
        //                        sixteen.opacity = 0.3
        //                        sfTip2.opacity = 1
        //                    }
        //                }
        //            }
        //        }

        MenuButton {
            id: ok
            text: "OK"
            width: 100
            height: 50
            x: jian.x + jian.width + 20
            y: parent.height - parent.height / 7

            onClicked: {
                if(scene.num === 1) {
                    console.log("you win")
                    if(JS.dbReadAll()<16){
                        JS.dbUpdate(0,16)
                    }
                    quan.opacity = 1
                    sixteen.opacity = 0.3
                    sfTip.opacity = 1
                } else {
                    console.log("you lose")
                    sixteen.opacity = 0.3
                    sfTip2.opacity = 1
                }
            }
        }

        Text {
            id: quantity
            text:scene.num
            x: (jian.x + plus.x + plus.width - 14) / 2
            y: jian.y + jian.height / 4
            font.family: font.name
            font.bold: true
            font.pixelSize: 28
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
            x: scene.width / 1.5
            y: scene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                sixteen.opacity = 0
                nextLevel = "SeventeenthLevel.qml"
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
            x:scene.width / 1.5
            y: scene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                sixteen.opacity = 0
                nextLevel = "SixteenthLevel.qml"
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

