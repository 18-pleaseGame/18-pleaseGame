import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls 2.0

import QtQuick.LocalStorage 2.0
import "../Database.js" as JS
import "../common"
import "../Game"

SceneBase {
    id: selectGameScene
    // 信号表明已经选择了一个级别
    signal gamePressed(string selectedGame)
    signal selectGameScene2flag
    property int pass: if (JS.dbReadAll()) {
                           JS.dbReadAll()
                       } else {
                           JS.dbInsert(0, 0)
                           JS.dbReadAll()
                       }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            pass = JS.dbReadAll()
        }
    }

    Grid {
        id: gameType
        anchors.centerIn: parent
        spacing: 20
        columns: 3

        Barrier {
            id: barrier1
            number: 1

            notpass: 0
            onClicked: {

                gamePressed("FirstLevel.qml")
            }
        }

        Barrier {
            id: barrier2
            number: 2
            notpass: if (pass < barrier2.number
                             && (barrier2.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("SecondLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier3
            number: 3
            notpass: if (pass < barrier3.number
                             && (barrier3.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("ThirdLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier4
            number: 4
            notpass: if (pass < barrier4.number
                             && (barrier4.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("FourthLevel.qml")
                }
            }
        }
        Barrier {
            id: barrier5
            number: 5
            notpass: if (pass < barrier5.number
                             && (barrier5.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("FivethLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier6
            number: 6
            notpass: if (pass < barrier6.number
                             && (barrier6.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("SixthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier7
            number: 7
            notpass: if (pass < barrier7.number
                             && (barrier7.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("SeventhLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier8
            number: 8
            notpass: if (pass < barrier8.number
                             && (barrier8.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("EighthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier9
            number: 9
            notpass: if (pass < barrier9.number
                             && (barrier9.number - pass) > 1) {
                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("NinethLevel.qml")
                }
            }
        }
    }

    MenuButton {
        text: "Back"
        anchors.right: selectGameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: selectGameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    Image {
        id: rightselect
        source: "../../assets/img/rightselect.png"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 14
        x: selectGameScene.width / 2 - 40
        scale: 0.5
        MouseArea {
            anchors.fill: rightselect
            onClicked: {
                selectGameScene.opacity = 0
                selectGameScene2flag()
            }
        }
    }
}
