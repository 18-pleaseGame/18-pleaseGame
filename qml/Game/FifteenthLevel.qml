import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../Database.js" as JS
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Gamebase {
    gameName: "FifteenthLevel"
    id: scene

    width: 320
    height: 480

    property int numFlag: 0

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Item {
        id: fifteen
        opacity: 1
        enabled: opacity === 1
        width: 320
        height: 480

        Text {
            id: name
            text: qsTr("从左到右依次点击动
物，然后顺次点击
五边形、菱形、星形。
")
            font.family: font.name
            font.bold: true
            font.pixelSize: 28
        }

        Image {
            id: animalIm1
            source: "../../assets/img/第15关/yang.png"
            property int click: 0
            property int nMouseClick: -1
            x: parent.width / 30
            y:parent.height / 4
            MouseArea {
                id: ma1
                anchors.fill: animalIm1
                onClicked: {
                    scene.numFlag = scene.numFlag + 1
                    animalIm1.nMouseClick = animalIm1.nMouseClick + 1
                    if(scene.numFlag === 1)
                        animalIm1.click = 1
                    whichOpacity(scene.numFlag, ma1, animalIm1, animalIm1.nMouseClick)
                }
            }
        }


        Image {
            id: animalIm2
            source: "../../assets/img/第15关/yazi.png"
            property int click: 0
            property int nMouseClick: -1
            x:animalIm1.x + animalIm1.width * 1.5
            y:animalIm1.y
            MouseArea {
                id: ma2
                anchors.fill: animalIm2
                onClicked: {
                    scene.numFlag = scene.numFlag + 1
                    animalIm2.nMouseClick = animalIm2.nMouseClick + 1
                    if(scene.numFlag === 2)
                        animalIm2.click = 2
                    whichOpacity(scene.numFlag, ma1, animalIm2, animalIm2.nMouseClick)
                }
            }
        }

        Image {
            id: wrongAnimalIm
            source: "../../assets/img/第15关/huangren.png"
            property int click: 0
            property int nMouseClick: -1
            x:animalIm2.x + animalIm2.width * 1.5
            y:animalIm1.y
            MouseArea {
                id: ma3
                anchors.fill: wrongAnimalIm
                onClicked: {
                    scene.numFlag = scene.numFlag + 1
                    wrongAnimalIm.nMouseClick = wrongAnimalIm.nMouseClick + 1
                    wrongAnimalIm.click = scene.numFlag
                    whichOpacity(scene.numFlag, ma3, wrongAnimalIm, wrongAnimalIm.nMouseClick)
                }
            }
        }

        Image {
            id: wubianxing
            source: "../../assets/img/第15关/wubianxing.png"
            property int click: 0
            property int nMouseClick: -1
            x: parent.width / 20
            y:animalIm1.height + parent.height / 3
            MouseArea {
                id: ma4
                anchors.fill: wubianxing
                onClicked: {
                    scene.numFlag = scene.numFlag + 1
                    wubianxing.nMouseClick = wubianxing.nMouseClick + 1
                    if(scene.numFlag === 3)
                        wubianxing.click = 3
                    whichOpacity(scene.numFlag, ma4, wubianxing, wubianxing.nMouseClick)
                }
            }
        }

        Image {
            id: lingxing
            source: "../../assets/img/第15关/lingxing.png"
            property int click: 0
            property int nMouseClick: -1
            x: wubianxing.width + parent.width / 5
            y:wubianxing.y
            MouseArea {
                id: ma5
                anchors.fill: lingxing
                onClicked: {
                    scene.numFlag = scene.numFlag + 1
                    lingxing.nMouseClick = lingxing.nMouseClick + 1
                    if(scene.numFlag === 4)
                        lingxing.click = 4
                    whichOpacity(scene.numFlag, ma5, lingxing, lingxing.nMouseClick)
                }
            }
        }

        Image {
            id: star
            source: "../../assets/img/第15关/star.png"
            property int click: 0
            property int nMouseClick: -1
            x: wubianxing.x + 70
            y:lingxing.y + lingxing.height
            MouseArea {
                id: ma6
                anchors.fill: star
                onClicked: {
                    scene.numFlag = scene.numFlag + 1
                    star.nMouseClick = star.nMouseClick + 1
                    if(scene.numFlag === 5)
                        star.click = 5
                    whichOpacity(scene.numFlag, ma6, star, star.nMouseClick)
                }
            }
        }




        Rectangle {
            id:num1
            opacity: 0
            width: 20
            height: 20
            color: "white"
            radius: 180
            border.color: "red"
            Text {
                id: first
                text: qsTr("1")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id:num2
            opacity: 0
            width: 20
            height: 20
            color: "white"
            radius: 180
            border.color: "red"
            Text {
                id: second
                text: qsTr("2")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id:num3
            opacity: 0
            width: 20
            height: 20
            color: "white"
            radius: 180
            border.color: "red"
            Text {
                id: third
                text: qsTr("3")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id:num4
            opacity: 0
            width: 20
            height: 20
            color: "white"
            radius: 180
            border.color: "red"
            Text {
                id: fourth
                text: qsTr("4")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id:num5
            opacity: 0
            width: 20
            height: 20
            color: "white"
            radius: 180
            border.color: "red"
            Text {
                id: fifth
                text: qsTr("5")
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id:num6
            opacity: 0
            width: 20
            height: 20
            color: "white"
            radius: 180
            border.color: "red"
            Text {
                id: sixth
                text: qsTr("6")
                anchors.centerIn: parent
            }
        }
    }

    function whichOpacity(opFlag, ma, img, nclick) {
        if(opFlag === 1) {
            num1.x = ma.mouseX + img.x + nclick * 15
            num1.y = ma.mouseY + img.y
            num1.opacity = 1
        } else if(opFlag === 2) {
            num2.x = ma.mouseX + img.x + nclick * 15
            num2.y = ma.mouseY + img.y
            num2.opacity = 1
        } else if(opFlag === 3) {
            num3.x = ma.mouseX + img.x + nclick * 15
            num3.y = ma.mouseY + img.y
            num3.opacity = 1
        } else if(opFlag === 4) {
            num4.x = ma.mouseX + img.x + nclick * 15
            num4.y = ma.mouseY + img.y
            num4.opacity = 1
        } else if(opFlag === 5) {
            num5.x = ma.mouseX + img.x + nclick * 15
            num5.y = ma.mouseY + img.y
            num5.opacity = 1
            winOrFail()
        } else if(opFlag === 6) {
            num6.x = ma.mouseX + img.x + nclick * 15
            num6.y = ma.mouseY + img.y
            num6.opacity = 1
            console.log("you lose")
            fifteen.opacity = 0.3
            sfTip2.opacity = 1
        }
    }


    function winOrFail() {
        if(wrongAnimalIm.click === 0)
            if(animalIm1.click === 1 && animalIm2.click === 2)
                if(wubianxing.click === 3 && lingxing.click === 4) {
                    console.log("you win")
                    if (JS.dbReadAll() < 15) {
                        JS.dbUpdate(0, 15)
                    }
                    fifteen.opacity = 0.3
                    sfTip.opacity = 1
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
                fifteen.opacity = 0
                nextLevel = "SixteenthLevel.qml"
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
                fifteen.opacity = 0
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


