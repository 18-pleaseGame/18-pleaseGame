import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Dialogs 1.2

Gamebase {
    id: firstLevelScene
    gameName: "FirstLevel"
    width: 320
    height: 480

    property alias hbuttonText: hour.text
    property alias sbuttonText: second.text
    property variant activeGame
    property int number1: 0
    property int number2: 0

    Item{
        id:first
        opacity: 1
        enabled: opacity === 1

        FontLoader {
            id: font
            source: "../../assets/字体/lemiao.ttf"
        }

        Text {
            id: questionInfo
            text: "请输入当前的时间？"
            x: 20
            y: 50
            font.pointSize: 20
            font.family: font.name
            font.bold: true
        }

        Image {
            id: clock
            scale: 0.4
            anchors.fill: parent.Center
            source: "../../assets/img/第1关/clock1.png"
        }

        //input hours data
        Image {
            id: addHour
            z: 1
            source: "../../assets/img/第1关/add.PNG"
            x: 35
            y: 200
            scale: 0.2

            MouseArea {
                anchors.fill: parent
                onClicked: if (number1 >= 0 && number1 < 24) {
                               number1 += 1
                           } else if (number1 === 24) {
                               number1 = 0
                           }
            }
        }

        Image {
            id: subHour
            x: 35
            y: 260
            source: "../../assets/img/第1关/jian.png"
            scale: 0.2
            MouseArea {
                anchors.fill: parent
                onClicked: if (number1 > 0 && number1 <= 24) {
                               number1 -= 1
                           } else if (number1 === 0) {
                               number1 = 24
                           }
            }
        }

        Rectangle {
            id: hoursdata
            x: 92
            y: 280
            Text {
                id: hour
                text: number1
                font.family: "Comic Sans MS"
                anchors.fill: parent
            }
        }

        Rectangle {
            id: maohao
            x: 130
            y: 280
            Text {
                id: maohao1
                text: ":"
                font.family: "Comic Sans MS"
                anchors.fill: parent
            }
        }

        //input seconds data
        Image {
            id: addHour1
            z: 1
            source: "../../assets/img/第1关/add.PNG"
            x: 100
            y: 200
            scale: 0.2

            MouseArea {
                anchors.fill: parent
                onClicked: if (number2 >= 0 && number2 < 60) {
                               number2 += 1
                           } else if (number2 === 60) {
                               number2 = 0
                           }
            }
        }
        Image {
            id: subHour1
            x: 100
            y: 260
            source: "../../assets/img/第1关/jian.png"
            scale: 0.2
            MouseArea {
                anchors.fill: parent
                onClicked: if (number2 > 0 && number2 <= 60) {
                               number2 -= 1
                           } else if (number2 === 0) {
                               number2 = 60
                           }
            }
        }

        Rectangle {
            id: secondsdata
            x: 160
            y: 280
            Text {
                id: second
                text: number2
                anchors.fill: parent
                font.family: "Comic Sans MS"
            }
        }

        Timer {
            interval: 500
            running: true
            repeat: true
            onTriggered: timeHours.text = getCurhours()
        }

        Text {
            id: timeHours
            visible: false
        }

        Timer {
            interval: 500
            running: true
            repeat: true
            onTriggered: timeSeconds.text = getCurminutes()
        }

        Text {
            id: timeSeconds
            visible: false
        }
        Text {
            id: num2
            text: number2
            visible: false
        }

        //ok button
        MenuButton {
            text: "OK"
            x: 140
            y: 370
            onClicked: {
                if (number1 == timeHours.text && number2 == timeSeconds.text) {
                    if (JS.dbReadAll() < 1) {
                        JS.dbUpdate(0, 1)
                    }
                    first.opacity = 0.3
                    sfTip.opacity = 1
                } else {
                    first.opacity = 0.3
                    sfTip2.opacity = 1
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
            x: firstLevelScene.width / 1.5
            y: firstLevelScene.height / 1.5
            onClicked: {
                sfTip.opacity = 0
                first.opacity = 0
                nextLevel = "SecondLevel.qml"
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
            x: firstLevelScene.width / 1.5
            y: firstLevelScene.height / 1.5
            onClicked: {
                sfTip2.opacity = 0
                first.opacity = 0
                nextLevel = "FirstLevel.qml"
            }
        }
    }


    function getCurminutes() {
        var d = new Date()
        var minutes = d.getMinutes()
        var mindata = Number(minutes)
        return mindata
    }

    function getCurhours() {
        var d = new Date()
        var hours = d.getHours()
        var hdate = Number(hours)
        return hdate
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
