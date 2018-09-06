import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import "../common"
import QtQuick.LocalStorage 2.0
import "../Database.js" as JS

SceneBase {
    id: selectGameScene2
    // 信号表明已经选择了一个级别
    signal gamePressed(string selectedGame)
    signal selectGameSceneflag
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
            id: barrier10
            number: 10

            notpass: if (pass < barrier10.number
                             && (barrier10.number - pass) > 1) {

                         1
                     } else {
                         0
                     }

            onClicked: {
                if (notpass == 0) {
                    gamePressed("TenthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier11
            number: 11
            notpass: if (pass < barrier11.number
                             && (barrier11.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("EleventhLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier12
            number: 12
            notpass: if (pass < barrier12.number
                             && (barrier12.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("TwelvethLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier13
            number: 13
            notpass: if (pass < barrier13.number
                             && (barrier13.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("ThirteenthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier14
            number: 14
            notpass: if (pass < barrier14.number
                             && (barrier14.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("FourteenthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier15
            number: 15
            notpass: if (pass < barrier15.number
                             && (barrier15.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("FifteenthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier16
            number: 16
            notpass: if (pass < barrier16.number
                             && (barrier16.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("SixteenthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier17
            number: 17
            notpass: if (pass < barrier17.number
                             && (barrier17.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("SeventeenthLevel.qml")
                }
            }
        }

        Barrier {
            id: barrier18
            number: 18
            notpass: if (pass < barrier18.number
                             && (barrier18.number - pass) > 1) {

                         1
                     } else {
                         0
                     }
            onClicked: {
                if (notpass == 0) {
                    gamePressed("EighteenthLevel.qml")
                }
            }
        }
    }

    MenuButton {
        text: "Back"
        anchors.right: selectGameScene2.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: selectGameScene2.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    Image {
        id: leftselect
        source: "../../assets/img/leftselect.png"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 14
        x: selectGameScene.width / 2 - 40
        scale: 0.5
        MouseArea {
            anchors.fill: leftselect
            onClicked: {
                selectGameScene2.opacity = 0
                selectGameSceneflag()
            }
        }
    }
}
