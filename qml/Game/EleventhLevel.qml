import QtQuick.Controls 2.0
import VPlay 2.0
import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "../Database.js" as JS
import "../scenes"
import "../common"

Gamebase {
    id: eleventhLevelScene
    gameName: "EleventhLevel"
    width: 320
    height: 480
    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: eleven

        opacity: 1
        enabled: opacity === 1


        width: 320
        height: 480

        Text {
            id: elevenquestion
            text: qsTr("后轮转10圈，请问前轮转了多少圈？？？")
            font.family: font.name
            font.pixelSize: 15
            y: parent.height / 14
        }
        Image {
            id: bycile
            width:250
            height: 200
            source: "../../assets/img/第11关/车.png"
            anchors.top: elevenquestion.bottom
            anchors.topMargin: 80
            anchors.left:parent.left
            anchors.leftMargin: 30
        }
        Image {
            id: substractbutton
            width: 30
            height: 30
            source: "../../assets/img/第11关/substract.png"
            anchors.top:bycile.bottom
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 30
            MouseArea{
                id:substractbuttonarea
                anchors.fill: parent
                onClicked: {
                    if(answertext.text!=0){
                        answertext.text--
                    }
                }
            }
        }
        TextEdit{
            id:answertext
            text:"0"
            font.family: font.name
            width: 50
            height: 30
            color: "black"
            anchors.left: substractbutton.right
            anchors.leftMargin: 30
            anchors.top:bycile.bottom
            anchors.topMargin: 50

        }
        Image {
            id: addbutton
            width: 30
            height: 30
            source: "../../assets/img/第11关/add.png"
            anchors.left: answertext.right
            anchors.leftMargin: 30
            anchors.top:bycile.bottom
            anchors.topMargin: 50
            MouseArea{
                id:addbuttonarea
                anchors.fill: parent
                onClicked: {
                    answertext.text++
                }
            }
        }

        MenuButton {
            text: "OK"
            x: 140
            y: 390
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(answertext.text==0){
                        console.log("success!")
                        if(JS.dbReadAll()<11){
                            JS.dbUpdate(0,11)
                        }
                        eleven.opacity = 0.3
                        sfTip.opacity = 1

                    } else {
                        eleven.opacity = 0.3
                        sfTip2.opacity = 1
                    }

                }
            }
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
            x: eleventhLevelScene.width / 1.5
            y: eleventhLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                eleven.opacity = 0
                nextLevel = "TwelvethLevel.qml"
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
            x: eleventhLevelScene.width / 1.5
            y: eleventhLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                eleven.opacity = 0
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
