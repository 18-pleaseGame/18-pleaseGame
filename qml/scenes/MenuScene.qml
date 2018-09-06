import VPlay 2.0
import QtQuick 2.0
import QtMultimedia 5.5
import "../common"


//主界面（最开始的界面）
SceneBase {
    id: menuScene

    signal selectGamePressed
    property int fengmianFlag: 1

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    Text {
        id: gameName
        text: qsTr("Please 入坑.")
        x: (parent.width - gameName.width) / 2
        y: parent.height / 4 + 10
        rotation: 339
        font.family: font.name
        font.bold: true
        font.pixelSize: 35
    }

    Image {
        id: start
        width: 80
        height: 76
        x: parent.width / 2 - start.width / 2
        y: parent.height / 2 - start.height / 6
        source: "../../assets/img/开始图片.png"
        MouseArea {
            anchors.fill: start
            onClicked: selectGamePressed()
        }
    }

    Image {
        id: gameMusicImg
        width: 30
        height: 30
        x: (parent.width - gameMusicImg.width) / 2
        y: parent.height - fengmian4.height / 2
        source: "../../assets/img/music.png"

        MouseArea {
            anchors.fill: parent
            onPressed: {
                gamemusic.play()
            }
            onDoubleClicked: {
                gamemusic.stop()
            }
        }
    }
    Audio {
        id: gamemusic
        source: "../../assets/sound/game_music.ogg"
        loops : Audio.Infinite

    }

    AnimatedImage {
        id: fengmian1
        width: 150
        height: 150
        opacity: 1
        mirror: true
        rotation: 135
        x: -20
        y: -20
        source: "../../assets/img/封面.GIF"
    }

    AnimatedImage {
        id: fengmian2
        width: 150
        height: 150
        opacity: 0
        mirror: true
        rotation: 225
        x: parent.width - fengmian2.width + 20
        y: fengmian1.y
        source: "../../assets/img/封面.GIF"
    }

    AnimatedImage {
        id: fengmian3
        width: 150
        height: 150
        opacity: 0
        rotation: 45
        x: fengmian1.x
        y: parent.height - fengmian3.height + 20
        source: "../../assets/img/封面.GIF"
    }

    AnimatedImage {
        id: fengmian4
        width: 150
        height: 150
        opacity: 0
        rotation: 315
        x: fengmian2.x
        y: fengmian3.y
        source: "../../assets/img/封面.GIF"
    }

    Timer {
        interval : 5000
        repeat : true
        running : true
        onTriggered: {
            if(fengmianFlag === 1) {
                fengmian1.opacity = 1
                fengmian4.opacity = 0
                fengmianFlag = fengmianFlag + 1
            } else if(fengmianFlag === 2) {
                fengmian2.opacity = 1
                fengmian1.opacity = 0
                fengmianFlag = fengmianFlag + 1
            } else if(fengmianFlag === 3) {
                fengmian3.opacity = 1
                fengmian2.opacity = 0
                fengmianFlag = fengmianFlag + 1
            } else if(fengmianFlag === 4) {
                fengmian4.opacity = 1
                fengmian3.opacity = 0
                fengmianFlag = 1;
            }
        }
    }

}
