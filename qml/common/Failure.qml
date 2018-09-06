import VPlay 2.0
import QtQuick 2.0

Item {
    id: failureDialog

    width: 320
    height: 480

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }
    Image {
        id: tipDialog
        anchors.centerIn: parent
        scale: 1.5
        source: "../../assets/img/提示框.png"

        Text {
            id: failureMessage
            anchors.centerIn: tipDialog
            text: "失败了，你个小笨蛋。"
            color: "black"
            font.family: font.name
            font.bold: true
        }
    }

    AnimatedImage {
        id: failureDog
        scale: 0.5
        x: -170
        y: 100
        source: "../../assets/img/failure.GIF"
    }
}
